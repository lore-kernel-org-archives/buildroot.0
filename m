From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 May 2015 12:48:29 -0300
Subject: [Buildroot] [PATCH] php: readline needs dynamic library
Message-ID: <1430495309-13678-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/604/604995ecf88e97976cbb9e4257ce85df66934ff3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/Config.ext | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index e529409..4995090 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -15,8 +15,12 @@ config BR2_PACKAGE_PHP_EXT_OPCACHE
 	help
 	  Enable the Zend OPcache accelerator.
 
+comment "Readline needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_READLINE
 	bool "Readline"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
-- 
2.0.5
