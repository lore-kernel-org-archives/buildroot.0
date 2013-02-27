From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Feb 2013 07:27:04 -0300
Subject: [Buildroot] [PATCH] libupnp: requires threads
Message-ID: <1361960824-25124-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ac5a18a6241d36a751cce1867c4da63047eafbaa/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libupnp/Config.in | 5 +++--
 package/ushare/Config.in  | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 2e6edcd..52fa739 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
 	  with an API and open source code for building control points,
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBUPNP
 
 	  http://pupnp.sourceforge.net/
 
-comment "libupnp requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libupnp requires a toolchain with LARGEFILE and thread support"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index f7b2124..5b87087 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_USHARE
 
 	  http://ushare.geexbox.org/
 
-comment "ushare requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "ushare requires a toolchain with LARGEFILE and thread support"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.7.12.4
