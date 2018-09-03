From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Sep 2018 09:22:47 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] php: pdo mysql extension
 needs hash as well
Message-ID: <20180903072218.4E3CD81DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc589d21fa268c345cf910f6fa7165240ca8105d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes:
http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2/

The PDO mysql extension also needs the hash extension - so select it,
similar to how it was done for the mysqli extension in commit 65f96452636
(php: fix build with mysqli).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 45215ffc8a75377228a477bebbf2ad9c78d40a35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 60ef1aee7c..51dcbbf4a4 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -132,6 +132,7 @@ if BR2_PACKAGE_PHP_EXT_PDO
 
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "MySQL"
+	select BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  PDO driver for MySQL
 
