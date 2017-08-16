From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 22:30:25 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
Message-ID: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All patches continue to apply with no changes. 7.2.0 is a bugfix
release of the 7.x branch.

The only change that is not a simple bump is that the 7.2.0 tarball is
now available xz-compressed instead of bz2-compressed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
I'm not sure whether we want this for master or next. I've built 71
toolchains with GCC 7.2.0 for toolchains.free-electrons.com, the vast
majority of them being then used to build and boot a Linux kernel +
minimal userspace under Qemu.

Unfortunately, the tag gcc-7_2_0-release has still not appeared in
git://gcc.gnu.org/git/gcc.git, so it's hard to see the amount of
changes between gcc 7.1.0 and gcc 7.2.0.

According to the release e-mail at
https://gcc.gnu.org/ml/gcc/2017-08/msg00129.html:

"""
GCC 7.2 is a bug-fix release from the GCC 7 branch
containing important fixes for regressions and serious bugs in
GCC 6.1 with more than 95 bugs fixed since the previous release.
"""

Perhaps the safest is to take this in next.
---
 package/gcc/{7.1.0 => 7.2.0}/0100-uclibc-conf.patch                 | 0
 package/gcc/{7.1.0 => 7.2.0}/0810-arm-softfloat-libgcc.patch        | 0
 .../gcc/{7.1.0 => 7.2.0}/0860-cilk-fix-build-without-wchar.patch    | 0
 package/gcc/{7.1.0 => 7.2.0}/0891-fix-m68k-uclinux.patch            | 0
 package/gcc/{7.1.0 => 7.2.0}/0892-microblaze-Revert.patch           | 0
 package/gcc/{7.1.0 => 7.2.0}/0900-remove-selftests.patch            | 0
 package/gcc/Config.in.host                                          | 2 +-
 package/gcc/gcc.hash                                                | 4 ++--
 package/gcc/gcc.mk                                                  | 6 +++---
 9 files changed, 6 insertions(+), 6 deletions(-)
 rename package/gcc/{7.1.0 => 7.2.0}/0100-uclibc-conf.patch (100%)
 rename package/gcc/{7.1.0 => 7.2.0}/0810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{7.1.0 => 7.2.0}/0860-cilk-fix-build-without-wchar.patch (100%)
 rename package/gcc/{7.1.0 => 7.2.0}/0891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{7.1.0 => 7.2.0}/0892-microblaze-Revert.patch (100%)
 rename package/gcc/{7.1.0 => 7.2.0}/0900-remove-selftests.patch (100%)

diff --git a/package/gcc/7.1.0/0100-uclibc-conf.patch b/package/gcc/7.2.0/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/7.1.0/0100-uclibc-conf.patch
rename to package/gcc/7.2.0/0100-uclibc-conf.patch
diff --git a/package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch b/package/gcc/7.2.0/0810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/7.1.0/0810-arm-softfloat-libgcc.patch
rename to package/gcc/7.2.0/0810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch b/package/gcc/7.2.0/0860-cilk-fix-build-without-wchar.patch
similarity index 100%
rename from package/gcc/7.1.0/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/7.2.0/0860-cilk-fix-build-without-wchar.patch
diff --git a/package/gcc/7.1.0/0891-fix-m68k-uclinux.patch b/package/gcc/7.2.0/0891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/7.1.0/0891-fix-m68k-uclinux.patch
rename to package/gcc/7.2.0/0891-fix-m68k-uclinux.patch
diff --git a/package/gcc/7.1.0/0892-microblaze-Revert.patch b/package/gcc/7.2.0/0892-microblaze-Revert.patch
similarity index 100%
rename from package/gcc/7.1.0/0892-microblaze-Revert.patch
rename to package/gcc/7.2.0/0892-microblaze-Revert.patch
diff --git a/package/gcc/7.1.0/0900-remove-selftests.patch b/package/gcc/7.2.0/0900-remove-selftests.patch
similarity index 100%
rename from package/gcc/7.1.0/0900-remove-selftests.patch
rename to package/gcc/7.2.0/0900-remove-selftests.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a2e02d7..b33dc60 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -93,7 +93,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
-	default "7.1.0"     if BR2_GCC_VERSION_7_X
+	default "7.2.0"     if BR2_GCC_VERSION_7_X
 	default "arc-2017.03" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index c3e5ffb..f35a2e2 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683
 sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
 sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.1.0/sha512.sum
-sha512  b5d952be9a10f0e0926bb2868877d10544039d6d2f35ba0a08f51231dd622a007650764a03e173194701467547789ad7d2d9cbc10adcdf118d619cdedbd14aec  gcc-7.1.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.2.0/sha512.sum
+sha512  f853cd6530b4055d8d8289da74687cb4c6d5f363598d386332d31852b581bac76c3adb7d61889edec3b779f63d8646f0122840f12965ce4a4389ba535dbbb6e1  gcc-7.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  282f76b8b63372f5b4426092b80d36da96cd0bda2a8588405b9ec22806c69fafb696b0e0df65bc36c3c3aa8ce5befc24246fd5c6ddb21dcde01f45f7b11ff7c4  gcc-arc-2017.03.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6ee840e..49ccccf 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,9 +18,9 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-# From version 6.4.0 a bz2 release tarball is not provided anymore. Use the xz
-# tarball instead.
-ifeq ($(BR2_GCC_VERSION_6_X),y)
+# From version 6.4.0 and 7.2.0 a bz2 release tarball is not provided
+# anymore. Use the xz tarball instead.
+ifeq ($(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 else
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
-- 
2.9.4
