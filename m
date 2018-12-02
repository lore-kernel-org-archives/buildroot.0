From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Dec 2018 11:24:27 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: fix display of comment
Message-ID: <20181202102427.16747-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
to display the comment "minizip needs a toolchain w/ threads, wchar"

Set the correct dependency:
depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 4bc12a0d7e..ff8b5b209a 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -20,5 +20,5 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 
 comment "minizip needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.17.1
