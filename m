From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jan 2019 20:15:05 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: depends on wchar
Message-ID: <20190116191505.30510-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minizip depends on wchar since version 2.7.0 and
https://github.com/nmoinvaz/minizip/commit/21a3102db475e662aabedc7b191e5732734847ec

Fixes:
 - http://autobuild.buildroot.org/results/2e83b694b91fe96e1a044385d327d7abd2183e24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index b531c45b91..5a0c52b3bb 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
+	depends on BR2_USE_WCHAR
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
@@ -12,3 +13,6 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 	depends on BR2_PACKAGE_MINIZIP
 	help
 	  Enable minizip binary tool.
+
+comment "minizip needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
-- 
2.14.1
