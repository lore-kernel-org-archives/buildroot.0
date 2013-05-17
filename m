From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 16 May 2013 17:02:35 -0700
Subject: [Buildroot] [PATCH 1/2] bellagio: needs toolchain with threads
	support
Message-ID: <1368748956-15255-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/a4b/a4b7e19f4eee1de8d8722c2ade673fcb816a811e

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/multimedia/bellagio/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
index 1458f63..4be3aee 100644
--- a/package/multimedia/bellagio/Config.in
+++ b/package/multimedia/bellagio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BELLAGIO
 	bool "bellagio"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Bellagio is an opensource implementation of the
 	  OpenMAX IL API.
@@ -14,5 +15,5 @@ config BR2_PACKAGE_BELLAGIO
 
 	  http://omxil.sourceforge.net/
 
-comment "bellagio requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "bellagio requires a toolchain with C++ and threads support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.4.1
