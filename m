From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 16:42:45 -0600
Subject: [Buildroot] GCC-mips configuration options
Message-ID: <200911281642.47923.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just FYI 
(no tuning for fp implementation yet - whitespace trashed on purpose):

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 1e3c78c..e9bde2a 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -156,6 +156,8 @@ config BR2_mips_32
        bool "mips 32"
 config BR2_mips_32r2
        bool "mips 32r2"
+config BR2_mips_24kc
+    bool "mips 24Kc"
 config BR2_mips_64
        bool "mips 64"
 config BR2_mips_64r2
@@ -177,10 +179,10 @@ config BR2_MIPS_OABI32
        bool "o32"
 config BR2_MIPS_ABI32
        bool "n32"
-       depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
+       depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_24kc || BR2_mips_64 || BR2_mips_64r2 || BR2
 config BR2_MIPS_EABI
        bool "eabi"
-       depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
+       depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_24kc || BR2_mips_64 || BR2_mips_64r2 || BR2
 config BR2_MIPS_ABI64
        bool "n64"
        depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
@@ -625,6 +627,7 @@ config BR2_GCC_TARGET_TUNE
        default mips4           if BR2_mips_4
        default mips32          if BR2_mips_32
        default mips32r2        if BR2_mips_32r2
+       default 24kc        if BR2_mips_24kc
        default mips64          if BR2_mips_64
        default mips64r2        if BR2_mips_64r2
        default mips16          if BR2_mips_16
@@ -724,6 +727,16 @@ config BR2_GCC_TARGET_ARCH
        default 68030           if BR2_m68k_68030
        default 68040           if BR2_m68k_68040
        default 68060           if BR2_m68k_68060
+       default mips1           if BR2_mips_1
+       default mips2           if BR2_mips_2
+       default mips3           if BR2_mips_3
+       default mips4           if BR2_mips_4
+       default mips32          if BR2_mips_32
+       default mips32r2        if BR2_mips_32r2
+       default 24kc        if BR2_mips_24kc
+       default mips64          if BR2_mips_64
+       default mips64r2        if BR2_mips_64r2
+       default mips16          if BR2_mips_16

 config BR2_GCC_TARGET_ABI
        string

Ref: http://gcc.gnu.org/onlinedocs/gcc-4.3.3/gcc/MIPS-Options.html#MIPS-Options
