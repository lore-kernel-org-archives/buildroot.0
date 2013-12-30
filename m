From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Dec 2013 12:00:07 +0200
Subject: [Buildroot] [PATCH] oprofile: disable on xtensa
Message-ID: <f0693dd3153f979256d82b2c2f427dd8bb9680df.1388397607.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missing memory barrier definition. Fixes
http://autobuild.buildroot.net/results/df7/df797a81111fa15de9337adefca05cbac156d0b2/.

Also, add nios2 to the dependencies comment while at it.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/oprofile/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 2f223c0..075e9ea 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
 	help
@@ -25,7 +26,8 @@ config BR2_PACKAGE_OPROFILE
 	  libraries, and applications.
 
 comment "oprofile needs a toolchain w/ C++"
-	depends on BR2_USE_MMU && !BR2_aarch64
+	depends on BR2_USE_MMU
+	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "oprofile needs a toolchain w/ threads on PPC"
-- 
1.8.5.2
