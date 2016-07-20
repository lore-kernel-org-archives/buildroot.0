From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 21:24:01 +0200
Subject: [Buildroot] [git commit] domoticz: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS
Message-ID: <20160720192411.AC916817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b76606d38d413fcd80a0261b09c969c5a493389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option was globally removed with
https://git.busybox.net/buildroot/commit/package/boost?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/domoticz/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index e6d2571..3bd7824 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
 	depends on BR2_USE_MMU # mosquitto
 	depends on !BR2_STATIC_LIBS # mosquitto
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -26,7 +25,6 @@ config BR2_PACKAGE_DOMOTICZ
 	  http://domoticz.com
 
 comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
