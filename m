From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 May 2013 12:01:50 +0200
Subject: [Buildroot] [git commit] bellagio: needs toolchain with threads
	support
Message-ID: <20130517100437.5B35B9A2C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4985ca55acc5452f4eee022d60b066da27a7866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/a4b/a4b7e19f4eee1de8d8722c2ade673fcb816a811e

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
