From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:47:37 +0100
Subject: [Buildroot] [PATCH v2 13/17] arch: remove BR2_ARCH_HAS_ATOMICS
	option
In-Reply-To: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453934861-26364-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that BR2_ARCH_HAS_ATOMICS is no longer used anywhere, we can
remove it from arch/Config.in*, as well as from the documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in                            | 4 ----
 arch/Config.in.aarch64                    | 3 ---
 arch/Config.in.arc                        | 3 ---
 arch/Config.in.arm                        | 3 ---
 arch/Config.in.bfin                       | 3 ---
 arch/Config.in.m68k                       | 3 ---
 arch/Config.in.microblaze                 | 3 ---
 arch/Config.in.mips                       | 3 ---
 arch/Config.in.nios2                      | 3 ---
 arch/Config.in.powerpc                    | 3 ---
 arch/Config.in.sh                         | 3 ---
 arch/Config.in.x86                        | 3 ---
 arch/Config.in.xtensa                     | 3 ---
 docs/manual/adding-packages-directory.txt | 5 -----
 14 files changed, 45 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 4cdd54e..401bd28 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -284,10 +284,6 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_GCC_TARGET_MODE
 	string
 
-# If the architecture has atomic operations, select this:
-config BR2_ARCH_HAS_ATOMICS
-	bool
-
 # Must be selected by binary formats that support shared libraries.
 config BR2_BINFMT_SUPPORTS_SHARED
 	bool
diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 325bccc..34cd409 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -5,6 +5,3 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE" if BR2_aarch64
 	default "BIG"	 if BR2_aarch64_be
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 7e0ad08..7d341f3 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -21,9 +21,6 @@ config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
 	default y if BR2_arc770d || BR2_archs38
 
-config BR2_ARCH_HAS_ATOMICS
-	default y if BR2_ARC_ATOMIC_EXT
-
 config BR2_ARCH
 	default "arc"	if BR2_arcle
 	default "arceb"	if BR2_arceb
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 60cd3a7..2b34f42 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -426,9 +426,6 @@ config BR2_ENDIAN
 	default "LITTLE" if BR2_arm
 	default "BIG"	 if BR2_armeb
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_CPU
 	default "arm920t"	if BR2_arm920t
 	default "arm922t"	if BR2_arm922t
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 0783969..415fc89 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -68,9 +68,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_CPU
 	default bf606		if BR2_bf606
 	default bf607		if BR2_bf607
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 6b868a1..f40f97c 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -4,9 +4,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_ARCH
 	default "68000"		if BR2_m68k_68000
 	default "68010"		if BR2_m68k_68010
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 7c21dfc..2d4c1fe 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -9,6 +9,3 @@ config BR2_ENDIAN
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 1e5d24d..fda1a1d 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -67,9 +67,6 @@ config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_ARCH
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index 7807769..ed63898 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -3,6 +3,3 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8581a4d..09ac794 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -164,9 +164,6 @@ config BR2_ENDIAN
 	default "BIG"    if BR2_powerpc || BR2_powerpc64
 	default "LITTLE" if BR2_powerpc64le
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_CPU
 	default "401"		if BR2_powerpc_401
 	default "403"		if BR2_powerpc_403
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 9f8f79c..1bdea37 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -28,6 +28,3 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 771c20f..7be814b 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -245,9 +245,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
-config BR2_ARCH_HAS_ATOMICS
-	default y if !BR2_x86_i386
-
 config BR2_GCC_TARGET_ARCH
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index a0e18f1..fcb3dc9 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -54,6 +54,3 @@ config BR2_ENDIAN
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5329c10..aab24b2 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -274,11 +274,6 @@ use in the comment.
 ** Dependency symbol: +BR2_USE_MMU+
 ** Comment string: no comment to be added
 
-* Atomic instructions (whereby the architecture has instructions to
-  perform some operations atomically, like LOCKCMPXCHG on x86)
-** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
-** Comment string: no comment to be added
-
 * Gcc +__sync_*+ built-ins used for atomic operations. They are
   available in variants operating on 1 byte, 2 bytes, 4 bytes and 8
   bytes. Since different architectures support atomic operations on
-- 
2.6.4
