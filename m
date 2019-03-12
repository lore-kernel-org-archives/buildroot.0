From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Mar 2019 20:48:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgpg-error: bump to version 1.35
Message-ID: <75e9564144a18c8b6b7a8a2527ac5a41719a8a10.1552416535.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release 1.34 added riscv32 support.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpg-error/Config.in         | 8 +++++---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index dbb554989e6b..415cd015cf3e 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
 		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
 		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_RISCV_64	|| \
-		BR2_sh4		|| BR2_sh4eb		|| BR2_sh4a	|| \
-		BR2_sh4aeb	|| BR2_sparc		|| BR2_sparc64	|| \
-		BR2_x86_64
+		BR2_RISCV_32	|| BR2_sh4		|| BR2_sh4eb	|| \
+		BR2_sh4a	|| BR2_sh4aeb		|| BR2_sparc	|| \
+		BR2_sparc64	|| BR2_x86_64
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
@@ -40,6 +40,8 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_powerpc
 	default "powerpc64-unknown-linux-gnu" \
 		if BR2_powerpc64 || BR2_powerpc64le
+	default "riscv32-unknown-linux-gnu" \
+		if BR2_RISCV_32
 	default "riscv64-unknown-linux-gnu" \
 		if BR2_RISCV_64
 	default "sh4-unknown-linux-gnu" \
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index b18ab7e6b6e8..1b1ea4e7ef8f 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.33.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.35.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a56813612bf03ff  libgpg-error-1.33.tar.bz2
+sha256 cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067  libgpg-error-1.35.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index d26d92fb0555..f081ee48131b 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.33
+LIBGPG_ERROR_VERSION = 1.35
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.20.1
