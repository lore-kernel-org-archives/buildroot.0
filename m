From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 23:28:57 +0100
Subject: [Buildroot] [git commit] package/glibc: drop ARC-specific version
Message-ID: <20201229221233.131B98353E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40258a3f395fd4c285e7ded27b25edd71f5c33b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're now using 2.32 as the default glibc version, so we no longer
need to use a special version for the ARC architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash    | 7 -------
 package/glibc/glibc.mk                                             | 6 +-----
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
deleted file mode 100644
index c6259a4745..0000000000
--- a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5cc20e763b..b5c70a3007 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,11 +11,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-ifeq ($(BR2_arc),y)
-# ARC support in upstream was merged in 2.32 release
-# This can be removed once BR upgrades to 2.32 or later
-GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
-else ifeq ($(BR2_RISCV_32),y)
+ifeq ($(BR2_RISCV_32),y)
 # RISC-V 32-bit (RV32) requires glibc 2.33 or newer
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
