From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Jun 2014 18:00:50 -0300
Subject: [Buildroot] [PATCH] gcc: bump 4.7.x series to version 4.7.4
Message-ID: <1402606850-26736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../4.7.3/850-xtensa-libgcc-linker-script.patch    | 29 ----------------------
 package/gcc/{4.7.3 => 4.7.4}/100-uclibc-conf.patch |  0
 .../{4.7.3 => 4.7.4}/301-missing-execinfo_h.patch  |  0
 .../gcc/{4.7.3 => 4.7.4}/302-c99-snprintf.patch    |  0
 .../305-libmudflap-susv3-legacy.patch              |  0
 .../810-arm-softfloat-libgcc.patch                 |  0
 .../{4.7.3 => 4.7.4}/830-arm_unbreak_armv4t.patch  |  0
 .../843-gcc-4.7.3-Fix-PR-target-58595.patch        |  0
 .../gcc/{4.7.3 => 4.7.4}/900-musl-support.patch    |  0
 .../powerpc-link-with-math-lib.patch.conditional   |  0
 package/gcc/Config.in.host                         |  2 +-
 11 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
 rename package/gcc/{4.7.3 => 4.7.4}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/302-c99-snprintf.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/843-gcc-4.7.3-Fix-PR-target-58595.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/900-musl-support.patch (100%)
 rename package/gcc/{4.7.3 => 4.7.4}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch b/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
deleted file mode 100644
index 6ffa897..0000000
--- a/package/gcc/4.7.3/850-xtensa-libgcc-linker-script.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a89db366b98fffc61b20074e658c7285fb302776 Mon Sep 17 00:00:00 2001
-Message-Id: <a89db366b98fffc61b20074e658c7285fb302776.1392126646.git.baruch@tkos.co.il>
-From: sterling <sterling@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 21 Jan 2014 19:29:23 +0000
-Subject: [PATCH] 2014-01-21  Baruch Siach <barch@tkos.co.il>
-
-	* config.host (tmake_file): add t-slibgcc-libgcc for xtensa*-*-linux*.
-
-Patch status: upstream (4.7 branch commit r206898)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff --git a/libgcc/config.host b/libgcc/config.host
-index e18e1d25021d..a6f7c450d702 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1127,7 +1127,7 @@ xtensa*-*-elf*)
- 	extra_parts="$extra_parts crti.o crtn.o"
- 	;;
- xtensa*-*-linux*)
--	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux"
-+	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
- 	md_unwind_header=xtensa/linux-unwind.h
- 	;;
- am33_2.0-*-linux*)
--- 
-1.8.5.3
-
diff --git a/package/gcc/4.7.3/100-uclibc-conf.patch b/package/gcc/4.7.4/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.7.3/100-uclibc-conf.patch
rename to package/gcc/4.7.4/100-uclibc-conf.patch
diff --git a/package/gcc/4.7.3/301-missing-execinfo_h.patch b/package/gcc/4.7.4/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.7.3/301-missing-execinfo_h.patch
rename to package/gcc/4.7.4/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.7.3/302-c99-snprintf.patch b/package/gcc/4.7.4/302-c99-snprintf.patch
similarity index 100%
rename from package/gcc/4.7.3/302-c99-snprintf.patch
rename to package/gcc/4.7.4/302-c99-snprintf.patch
diff --git a/package/gcc/4.7.3/305-libmudflap-susv3-legacy.patch b/package/gcc/4.7.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.7.4/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/4.7.3/810-arm-softfloat-libgcc.patch b/package/gcc/4.7.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.7.3/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.7.4/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.7.3/830-arm_unbreak_armv4t.patch b/package/gcc/4.7.4/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.7.3/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.7.4/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch b/package/gcc/4.7.4/843-gcc-4.7.3-Fix-PR-target-58595.patch
similarity index 100%
rename from package/gcc/4.7.3/843-gcc-4.7.3-Fix-PR-target-58595.patch
rename to package/gcc/4.7.4/843-gcc-4.7.3-Fix-PR-target-58595.patch
diff --git a/package/gcc/4.7.3/900-musl-support.patch b/package/gcc/4.7.4/900-musl-support.patch
similarity index 100%
rename from package/gcc/4.7.3/900-musl-support.patch
rename to package/gcc/4.7.4/900-musl-support.patch
diff --git a/package/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b6d4b5e..3bdfffc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -111,7 +111,7 @@ config BR2_GCC_VERSION
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
-	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
+	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
 	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
-- 
1.8.5.5
