/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-10 18:02:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `category_id` tinyint(10) DEFAULT '0',
  `visitable` tinyint(1) DEFAULT '0',
  `content` longtext,
  `markdown_code` longtext,
  `deleted` int(1) DEFAULT '1',
  `update` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'Kaleoz-store前后端分离API设计', '1', '1', '<p><em><em><br>Kaleoz-store v2版本实现前后端分离以取代原kaloez-store由PHP输出html的方式。原Kaleos-store中PHP的业务逻辑改由API实现。\n<p>&gt; <em> 由于前后端分离，前台改用API获取数据<br>>  前后台所需数据结构不同，后台直接使用了Model返回需要的数据结构<br>&gt; <em> 后台数据结构不能满足前台需求<br>>  故前台数据改用Service处理<br>> * 前台Service命名约定以Store为前缀\n<p>Service的继承关系，以获取游戏数据的StoreGameService为例，如下：</p>\n<p>```<br>// 为子类service提供model及共用方法<br>class ModelService extends Tuki_Model<br>{\n<p>}</p>\n<p>// 为前台提供游戏相关数据<br>class StoreGameService extends ModelService<br>{\n<pre><code>public static function getGameById($gameId)\n{\n    self::getConn()-&amp;gt;from(\'game\')\n        -&amp;gt;joinLeft(\'language\', \'l.code=g.language\', \'name AS language\')\n        -&amp;gt;joinLeft(\'platform\', \'p.code=g.platform\', \'name AS platform\')\n        -&amp;gt;joinLeft(\'company\', \'c.id=g.publisher_id\', \'name AS publisher\');\n    self::getConn()-&amp;gt;where(\'g.id=?\', $gameId);\n    return self::getConn()-&amp;gt;limit(1)-&amp;gt;select()-&amp;gt;fetch();\n}\n</code></pre><p>}</p>\n<p>```</p></em></p>\n', '<em><em>\nKaleoz-store v2版本实现前后端分离以取代原kaloez-store由PHP输出html的方式。原Kaleos-store中PHP的业务逻辑改由API实现。\n\n&gt; * 由于前后端分离，前台改用API获取数据\n&gt; * 前后台所需数据结构不同，后台直接使用了Model返回需要的数据结构\n&gt; * 后台数据结构不能满足前台需求\n&gt; * 故前台数据改用Service处理\n&gt; * 前台Service命名约定以Store为前缀\n\nService的继承关系，以获取游戏数据的StoreGameService为例，如下：\n\n```\n// 为子类service提供model及共用方法\nclass ModelService extends Tuki_Model\n{\n\n}\n\n// 为前台提供游戏相关数据\nclass StoreGameService extends ModelService\n{\n\n    public static function getGameById($gameId)\n    {\n        self::getConn()-&gt;from(\'game\')\n            -&gt;joinLeft(\'language\', \'l.code=g.language\', \'name AS language\')\n            -&gt;joinLeft(\'platform\', \'p.code=g.platform\', \'name AS platform\')\n            -&gt;joinLeft(\'company\', \'c.id=g.publisher_id\', \'name AS publisher\');\n        self::getConn()-&gt;where(\'g.id=?\', $gameId);\n        return self::getConn()-&gt;limit(1)-&gt;select()-&gt;fetch();\n    }\n\n}\n\n```</em></em>', '1', '1568099628', '1568015500');
INSERT INTO `article` VALUES ('5', 'test', '2', '0', '<p>te</p>\n', 'te', '0', null, '1568087318');
INSERT INTO `article` VALUES ('2', 'PHP-PSR-[0-4]代码规范', '1', '1', '<p>PSR-0 (Autoloading Standard) 自动加载标准<br>PSR-1 (Basic Coding Standard) 基础编码标准<br>PSR-2 (Coding Style Guide) 编码风格向导<br>PSR-3 (Logger Interface) 日志接口<br>PSR-4(Improved Autoloading) 自动加载的增强版，可以替换掉PSR-0了。\n<hr>\n<p>PSR-0</p>\n<blockquote>\n<ol>\n<li>完全限定的命名空间和类必须具有以下结构 \\<Vendor Name>(<Namespace>)*<class name=\"\"></class><li>每个名称空间必须具有顶级名称空间（”Vendor Name”）。</li><li>每个命名空间可以包含任意数量的子命名空间。</li><li>每个命名空间分隔符DIRECTORY_SEPARATOR在从文件系统加载时转换为。</li><li>每一个<em>字符都转换为DIRECTORY_SEPARATOR。该</em>字符在命名空间中没有特殊含义。</li><li>.php从文件系统加载时，以.php结尾。</li><li>vendor，namespace和class名称中的字母字符可以是小写字母和大写字母的任意组合。</li></ol>\n</blockquote>\n<p>例子：</p>\n<blockquote>\n<p>\\Doctrine\\Common\\IsolatedClassLoader =&gt; /path/to/project/lib/vendor/Doctrine/Common/IsolatedClassLoader.php<br>\\Symfony\\Core\\Request =&gt; /path/to/project/lib/vendor/Symfony/Core/Request.php<br>\\Zend\\Acl =&gt; /path/to/project/lib/vendor/Zend/Acl.php<br>\\Zend\\Mail\\Message => /path/to/project/lib/vendor/Zend/Mail/Message.php\n</blockquote>\n<p><strong>namespace和class中的下划线：</strong></p>\n<blockquote>\n<p>\\namespace\\package\\Class_Name =&gt; /path/to/project/lib/vendor/namespace/package/Class/Name.php</p>\n<p>\\namespace\\package_name\\Class_Name =&gt; /path/to/project/lib/vendor/namespace/package_name/Class/Name.php<br>```<br>function autoload($className){\n</blockquote>\n<p>$className=ltrim($className,’\\‘);</p>\n<p>$fileName=’’;</p>\n<p>$namespace=’’;</p>\n<p>if($lastNsPos=strrpos($className,’\\‘){</p>\n<p>$namespace=substr($className,0,$lastNsPos);</p>\n<p>$className=substr($className,$lastNsPos+1);</p>\n<p>$fileName=str_replace(‘\\‘,DIRECTORY_SEPARATOR,$namespace).DIRECTORY_SEPARATOR;</p>\n<p>}</p>\n<p>$fileName.=str<em>replace(‘</em>‘,DIRECTORY_SEPARATOR,$className).’.php’;</p>\n<p>require$fileName;</p>\n<p>}</p>\n<p>spl_autoload_register(‘autoload’);</p>\n<p>```</p>\n<p>PSR-4</p>\n<p>The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL”</p>\n<p>概述：此PSR描述了从文件路径<a href=\"http://php.net/autoload\">自动加载</a>类的规范。它完全可互操作，除了包括<a href=\"https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md\">PSR-0</a>在内的任何其他自动加载规范外，还可以使用它。此PSR还描述了根据规范放置将自动加载的文件的位置</p>\n<ol>\n<li>术语“类”指的是类，接口，特征和其他类似结构。</li><li>完全限定的类名具有以下形式：<br>\\<NamespaceName>(\\<SubNamespaceNames>)*\\<ClassName><ol>\n<li>完全限定的类名必须具有顶级命名空间名称，也称为“供应商命名空间”。</li><li>完全限定的类名可以具有一个或多个子命名空间名称。</li><li>完全限定的类名必须具有终止类名。</li><li>下划线在完全限定类名的任何部分都没有特殊含义。</li><li>完全限定类名中的字母字符可以是小写和大写的任意组合。</li><li>必须以区分大小写的方式引用所有类名。</li></ol>\n</li><li>加载对应于完全限定类名的文件时…<ol>\n<li>完全限定类名称（“名称空间前缀”）中的一个或多个前导命名空间和子命名空间名称的连续系列（不包括前导命名空间分隔符）对应于至少一个“基本目录”。</li><li>“名称空间前缀”之后的连续子命名空间名称对应于“基本目录”中的子目录，其中名称空间分隔符表示目录分隔符。子目录名称必须与子命名空间名称的大小写相匹配。</li><li>终止类名对应于以.php。结尾的文件名。文件名必须与终止类名称的大小写相匹配。</li></ol>\n</li><li>Autoloader实现绝不能抛出异常，不得引发任何级别的错误，并且不应该返回值。</li></ol>\n<p>Examples</p>\n<table>\n<thead>\n<tr>\n<th>FULLY QUALIFIED CLASS NAME</th>\n<th>NAMESPACE PREFIX</th>\n<th>BASE DIRECTORY</th>\n<th>RESULTING FILE PATH</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>\\Acme\\Log\\Writer\\File_Writer</td>\n<td>Acme\\Log\\Writer</td>\n<td>./acme-log-writer/lib/</td>\n<td>./acme-log-writer/lib/File_Writer.php</td>\n</tr>\n<tr>\n<td>\\Aura\\Web\\Response\\Status</td>\n<td>Aura\\Web</td>\n<td>/path/to/aura-web/src/</td>\n<td>/path/to/aura-web/src/Response/Status.php</td>\n</tr>\n<tr>\n<td>\\Symfony\\Core\\Request</td>\n<td>Symfony\\Core</td>\n<td>./vendor/Symfony/Core/</td>\n<td>./vendor/Symfony/Core/Request.php</td>\n</tr>\n<tr>\n<td>\\Zend\\Acl</td>\n<td>Zend</td>\n<td>/usr/includes/Zend/</td>\n<td>/usr/includes/Zend/Acl.php</td>\n</tr>\n</tbody>\n</table>\n<p>For example implementations of autoloaders conforming to the specification, please see the <a href=\"https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-4-autoloader-examples.md\">examples file</a>. Example implementations MUST NOT be regarded as part of the specification and MAY change at any time.</p>\n<p>参考 ： <a href=\"https://www.php-fig.org/psr\">https://www.php-fig.org/psr</a><br>参考： <a href=\"https://www.cnblogs.com/52php/p/5852572.html\">https://www.cnblogs.com/52php/p/5852572.html</a></p>\n', 'PSR-0 (Autoloading Standard) 自动加载标准  \nPSR-1 (Basic Coding Standard) 基础编码标准\nPSR-2 (Coding Style Guide) 编码风格向导\nPSR-3 (Logger Interface) 日志接口\nPSR-4(Improved Autoloading) 自动加载的增强版，可以替换掉PSR-0了。\n* * *\n\nPSR-0\n\n> 1. 完全限定的命名空间和类必须具有以下结构 \\<Vendor Name>\\(<Namespace>\\)*<Class Name>\n> 2. 每个名称空间必须具有顶级名称空间（\"Vendor Name\"）。\n> 3. 每个命名空间可以包含任意数量的子命名空间。\n> 4. 每个命名空间分隔符DIRECTORY_SEPARATOR在从文件系统加载时转换为。\n> 5.  每一个_字符都转换为DIRECTORY_SEPARATOR。该_字符在命名空间中没有特殊含义。\n> 6. .php从文件系统加载时，以.php结尾。\n> 7. vendor，namespace和class名称中的字母字符可以是小写字母和大写字母的任意组合。\n\n例子：\n\n> \\Doctrine\\Common\\IsolatedClassLoader => /path/to/project/lib/vendor/Doctrine/Common/IsolatedClassLoader.php\n> \\Symfony\\Core\\Request => /path/to/project/lib/vendor/Symfony/Core/Request.php\n> \\Zend\\Acl => /path/to/project/lib/vendor/Zend/Acl.php\n> \\Zend\\Mail\\Message => /path/to/project/lib/vendor/Zend/Mail/Message.php\n\n**namespace和class中的下划线：**\n\n> \\namespace\\package\\Class_Name => /path/to/project/lib/vendor/namespace/package/Class/Name.php\n> \n> \\namespace\\package_name\\Class_Name => /path/to/project/lib/vendor/namespace/package_name/Class/Name.php\n```\nfunction autoload($className){\n\n$className=ltrim($className,\'\\\\\');\n\n$fileName=\'\';\n\n$namespace=\'\';\n\nif($lastNsPos=strrpos($className,\'\\\\\'){\n\n$namespace=substr($className,0,$lastNsPos);\n\n$className=substr($className,$lastNsPos+1);\n\n$fileName=str_replace(\'\\\\\',DIRECTORY_SEPARATOR,$namespace).DIRECTORY_SEPARATOR;\n\n}\n\n$fileName.=str_replace(\'_\',DIRECTORY_SEPARATOR,$className).\'.php\';\n\nrequire$fileName;\n\n}\n\nspl_autoload_register(\'autoload\');\n\n```\n\nPSR-4\n\nThe key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL”\n\n概述：此PSR描述了从文件路径[自动加载](http://php.net/autoload)类的规范。它完全可互操作，除了包括[PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md)在内的任何其他自动加载规范外，还可以使用它。此PSR还描述了根据规范放置将自动加载的文件的位置\n\n\n1. 术语“类”指的是类，接口，特征和其他类似结构。\n2. 完全限定的类名具有以下形式：\n \\<NamespaceName>(\\<SubNamespaceNames>)*\\<ClassName>\n     1. 完全限定的类名必须具有顶级命名空间名称，也称为“供应商命名空间”。\n     2. 完全限定的类名可以具有一个或多个子命名空间名称。\n     3. 完全限定的类名必须具有终止类名。\n     4. 下划线在完全限定类名的任何部分都没有特殊含义。\n     5. 完全限定类名中的字母字符可以是小写和大写的任意组合。\n     6. 必须以区分大小写的方式引用所有类名。\n3. 加载对应于完全限定类名的文件时...\n    1. 完全限定类名称（“名称空间前缀”）中的一个或多个前导命名空间和子命名空间名称的连续系列（不包括前导命名空间分隔符）对应于至少一个“基本目录”。\n    2. “名称空间前缀”之后的连续子命名空间名称对应于“基本目录”中的子目录，其中名称空间分隔符表示目录分隔符。子目录名称必须与子命名空间名称的大小写相匹配。\n    3. 终止类名对应于以.php。结尾的文件名。文件名必须与终止类名称的大小写相匹配。\n4. Autoloader实现绝不能抛出异常，不得引发任何级别的错误，并且不应该返回值。\n\nExamples\n\n| FULLY QUALIFIED CLASS NAME | NAMESPACE PREFIX | BASE DIRECTORY | RESULTING FILE PATH |\n| --- | --- | --- | --- |\n| \\Acme\\Log\\Writer\\File_Writer | Acme\\Log\\Writer | ./acme-log-writer/lib/ | ./acme-log-writer/lib/File_Writer.php |\n| \\Aura\\Web\\Response\\Status | Aura\\Web | /path/to/aura-web/src/ | /path/to/aura-web/src/Response/Status.php |\n| \\Symfony\\Core\\Request | Symfony\\Core | ./vendor/Symfony/Core/ | ./vendor/Symfony/Core/Request.php |\n| \\Zend\\Acl | Zend | /usr/includes/Zend/ | /usr/includes/Zend/Acl.php |\n\nFor example implementations of autoloaders conforming to the specification, please see the [examples file](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-4-autoloader-examples.md). Example implementations MUST NOT be regarded as part of the specification and MAY change at any time.\n\n\n参考 ： [https://www.php-fig.org/psr](https://www.php-fig.org/psr)\n参考： [https://www.cnblogs.com/52php/p/5852572.html](https://www.cnblogs.com/52php/p/5852572.html)\n', '1', null, '1568018100');
INSERT INTO `article` VALUES ('3', 'composer添加自定义类文件', '1', '1', '<p>1.在composer.json添加如下配置：</p>\n<pre><code>    \"autoload\": {\n        \"classmap\":[\n            \"application/index/service\"\n        ],\n        \"psr-4\": {\n            \"app\\\\\": \"application\"\n        }\n    },\n</code></pre><p>2.使用composer dump<br>在vendoer\\composer\\autoload_classmap.php下生成对应路径：<br>在”classmap”对应的数组中添加需要自动加载的目录,composer将会将目录中所有的类按照 “namespace + classname => base.dir.设置的路径” 的形式生成成一个 key => value 的数组。(ps:base.dir就是我们的工程所在的目录)\n<pre><code>return array(\n    \'IndexService\' =&gt; $baseDir . \'/application/index/service/IndexService.php\',\n);\n</code></pre>', '1.在composer.json添加如下配置：\n```\n    \"autoload\": {\n        \"classmap\":[\n            \"application/index/service\"\n        ],\n        \"psr-4\": {\n            \"app\\\\\": \"application\"\n        }\n    },\n```\n2.使用composer dump\n在vendoer\\composer\\autoload_classmap.php下生成对应路径：\n在”classmap”对应的数组中添加需要自动加载的目录,composer将会将目录中所有的类按照 “namespace + classname => base.dir.设置的路径” 的形式生成成一个 key => value 的数组。(ps:base.dir就是我们的工程所在的目录)\n```\nreturn array(\n    \'IndexService\' => $baseDir . \'/application/index/service/IndexService.php\',\n);\n```', '1', null, '1568014800');
INSERT INTO `article` VALUES ('6', 'test', '2', '1', '<p>test</p>\n', 'test', '1', null, '1568099584');
INSERT INTO `article` VALUES ('7', 'test', '3', '1', '<p>tata</p>\n', 'tata', '0', null, '1568105521');
INSERT INTO `article` VALUES ('8', 'test', '3', '1', '<p>tata</p>\n', 'tata', '0', null, '1568105576');
INSERT INTO `article` VALUES ('9', 'test', '3', '0', '<p>tata</p>\n', 'tata', '0', null, '1568105599');
INSERT INTO `article` VALUES ('10', 'test', '5', '1', '<p>aaa</p>\n', 'aaa', '0', null, '1568105816');
INSERT INTO `article` VALUES ('11', 'test', '5', '1', '<p>aaa</p>\n', 'aaa', '0', null, '1568105819');
INSERT INTO `article` VALUES ('12', 'test', '5', '1', '<p>aaa</p>\n', 'aaa', '0', null, '1568105855');
INSERT INTO `article` VALUES ('13', 'test', '5', '1', '<p>aaa</p>\n', 'aaa', '0', null, '1568105882');
INSERT INTO `article` VALUES ('14', 'test', '1', '0', '<p>a</p>\n', 'a', '0', null, '1568105894');
