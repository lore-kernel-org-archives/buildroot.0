From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 21:58:39 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] toolchain: drop old
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_* options
Message-ID: <20210321203443.3260E7FB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15b1eee13b36d9a1b4977079dad7ab6f56aee765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 and
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006 options were last selected by the
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64 toolchain, but this
toolchain has been removed as part of commit
d87e114a8ffacdc71f853e7c4ea76fd3c6958d22 in August 2020.

It's time to get rid of those two options that are never enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a7143fb316d048d8a148df9371dbbab07dac3de3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in   |  1 -
 package/go/Config.in.host |  1 -
 toolchain/Config.in       | 10 ----------
 3 files changed, 12 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 339a97f0e4..c95dac1804 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -35,7 +35,6 @@ config BR2_TARGET_SYSLINUX_PXELINUX
 
 config BR2_TARGET_SYSLINUX_MBR
 	bool "install mbr"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'mbr' image, to boot off a
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 87942c7a1e..e82ab6e81a 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,6 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a6fe982445..c436988a5f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,16 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=19615
-# Affect toolchains built with binutils 2.26 (fixed in binutils 2.26.1).
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
-	bool
-
-# https://sourceware.org/bugzilla/show_bug.cgi?id=20006
-# Affect toolchains built with binutils 2.26 (fixed in binutils 2.26.1).
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
-	bool
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=21464
 # Affect toolchains built with binutils 2.31.1, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
