From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] toolchain/gcc: bump 4.4.x version
	to 4.4.4
Message-ID: <20100502220948.5A44A8A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4439d388907066ab58fc1753eb07c40dcc98fcf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 +++---
 .../gcc/{4.4.3 => 4.4.4}/100-uclibc-conf.patch     |    0
 .../{4.4.3 => 4.4.4}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.3 => 4.4.4}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 toolchain/gcc/Config.in                            |    2 +-
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/gcc/{4.4.3 => 4.4.4}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.4.3 => 4.4.4}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.4.3 => 4.4.4}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.4.3 => 4.4.4}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.4.3 => 4.4.4}/810-arm-softfloat-libgcc.patch (100%)

diff --git a/CHANGES b/CHANGES
index deabb09..4ef1fc7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,9 +3,9 @@
 	Cleaned up / restructured package menu.
 
 	Toolchain: uClibc 0.9.30.3 / 0.9.31, older 0.9.30.x removed.
-	2.6.33 kernel headers, binutils 2.20.1, removed broken nios2
-	support, ppc e300cX/e500mc support, improved external
-	toolchain support, GDB 7.x support.
+	2.6.33 kernel headers, binutils 2.20.1, GCC 4.4.4,
+	removed broken nios2 support, ppc e300cX/e500mc support,
+	improved external toolchain support, GDB 7.x support.
 
 	X.org updated to 7.5.
 
diff --git a/toolchain/gcc/4.4.3/100-uclibc-conf.patch b/toolchain/gcc/4.4.4/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.3/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.4/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.3/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.4/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.3/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.4/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.3/302-c99-snprintf.patch b/toolchain/gcc/4.4.4/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.3/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.4/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.3/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.3/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.4/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.3/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.3/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.4/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 73edd38..c25a152 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -86,7 +86,7 @@ config BR2_GCC_VERSION
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
-	default "4.4.3"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.4"     if BR2_GCC_VERSION_4_4_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_TOOLCHAIN_SYSROOT
-- 
1.6.3.3
