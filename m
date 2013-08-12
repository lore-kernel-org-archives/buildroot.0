From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 14:08:33 -0300
Subject: [Buildroot] [PATCH] libcec: needs threads
Message-ID: <1376327313-20317-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/16a/16ad8b64e68477dcd663d07c600fd1be3164df81/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcec/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index b1fa03b..7a67952 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBCEC
 	bool "libcec"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec requires C++ support in toolchain"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libcec requires C++ and threading support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
