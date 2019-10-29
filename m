From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 09:59:37 +0100
Subject: [Buildroot] [PATCH 1/2] package/minizip: select libiconv if needed
Message-ID: <20191029085938.10595-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iconv.h is always included by mz_os_posix.c so select
BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 5a0c52b3bb..e4d185d9d7 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
-- 
2.23.0
