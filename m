From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Dec 2018 11:25:51 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: fix display of comment
Message-ID: <20181202102551.18249-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
to display the comment "libbsd needs a toolchain w/ threads, wchar"

Set the correct dependency:
depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbsd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index ba5e5cbcfa..ce50ec37de 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -24,5 +24,5 @@ config BR2_PACKAGE_LIBBSD
 
 comment "libbsd needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.17.1
