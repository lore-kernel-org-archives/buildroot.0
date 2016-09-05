From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:10:06 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng011
Message-ID: <20160905201009.3BB49821A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b77525c9a749a2dac57327257ac8ccb5dfe3d45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng011.

This engenering build contains the following updates:
1. rebase binutils on top of the latest upstream master
2. update GCC to version 6.2

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-eng010 => arc-2016.09-eng011}/0300-ld-makefile.patch   | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../301-missing-execinfo_h.patch                                        | 0
 .../gcc/{arc-2016.09-eng010 => arc-2016.09-eng011}/860-cilk-wchar.patch | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 12 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 86daa0c..8830329 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng010"	if BR2_arc
+	default "arc-2016.09-eng011"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.09-eng010/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng011/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng010/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng011/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng010/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng011/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng010/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng011/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng010/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng011/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng010/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng011/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng010/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng011/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng010/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng011/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 3979628..aedb045 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  32d2f04ec62ee0491fd711baf7e6f28052170b1fa4cb8f6046ca4709e03250335a65b362295c13c7c44f8a28d91d2c54b0ab7c8f0f2e2324ea8ba2c80cbee29a  binutils-arc-2016.09-eng010.tar.gz
+sha512  829e14152dbd18bad36d7e161bdde52e92e8b439ab9fbc18655172f0e2fae954885286e77ceaab9e13b68f3ca19506068c3b1808a2e88f12ad6674d421519b64  binutils-arc-2016.09-eng011.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 97daeff..71ea2b0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng010
+BINUTILS_VERSION = arc-2016.09-eng011
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6f6e582..0e2c1a7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -121,7 +121,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng010" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng011" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng010/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng011/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng010/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng011/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-eng010/860-cilk-wchar.patch b/package/gcc/arc-2016.09-eng011/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng010/860-cilk-wchar.patch
rename to package/gcc/arc-2016.09-eng011/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-eng010/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-eng011/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng010/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2016.09-eng011/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 2e11551..a18d1dd 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  a788737022c178a1e7704e4ecd3438937f2239bf27fd487db2b00e4bb5c6604535842e4d6798f120488bdbf0b226fa9c94f4b8aede4ce9d20b0add6bcec82927  gcc-arc-2016.09-eng010.tar.gz
+sha512  5fa11058adc0fc3d33bb860151660101bc20c7147cd92bc235057cd722e7fdb923ac0bdf27b09499b8587abb0c420867229bd782bc10bee0c76116c099b5a76c  gcc-arc-2016.09-eng011.tar.gz
