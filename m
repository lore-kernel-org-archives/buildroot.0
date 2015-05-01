From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 May 2015 22:20:31 +0200
Subject: [Buildroot] [git commit] php: readline needs dynamic library
Message-ID: <20150501202233.CD09781DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fba6a491a8c2b9aeeed1da7f03c08f38d636e8a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/604/604995ecf88e97976cbb9e4257ce85df66934ff3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
