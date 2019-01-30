From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:12:22 +0100
Subject: [Buildroot] [PATCH 1/3] arch/mips: introduce mips32r3 and mips64r3
Message-ID: <20190130201224.6555-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

It's unclear why Buildroot only defined MIPS 32/64 releases 1, 2, 5 and 6
while 3 exists as well.

Interesting fact:
"Release 4 was skipped because the number four is perceived as unlucky in
many Asian cultures."
https://en.wikipedia.org/wiki/MIPS_architecture#MIPS32/MIPS64

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 arch/Config.in.mips | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index e45299f818..f28113df44 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -5,6 +5,9 @@ config BR2_MIPS_CPU_MIPS32
 config BR2_MIPS_CPU_MIPS32R2
 	bool
 	select BR2_MIPS_NAN_LEGACY
+config BR2_MIPS_CPU_MIPS32R3
+	bool
+	select BR2_MIPS_NAN_LEGACY
 config BR2_MIPS_CPU_MIPS32R5
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
@@ -18,6 +21,9 @@ config BR2_MIPS_CPU_MIPS64
 config BR2_MIPS_CPU_MIPS64R2
 	bool
 	select BR2_MIPS_NAN_LEGACY
+config BR2_MIPS_CPU_MIPS64R3
+	bool
+	select BR2_MIPS_NAN_LEGACY
 config BR2_MIPS_CPU_MIPS64R5
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
@@ -34,8 +40,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit cabable: 64, 64r2, 64r5, 64r6
-	  non-64bit capable: 32, 32r2, 32r5, 32r6
+	  64bit capable: 64, 64r2, 64r3, 64r5, 64r6
+	  non-64bit capable: 32, 32r2, 32r3, 32r5, 32r6
 
 config BR2_mips_32
 	bool "Generic MIPS32"
@@ -45,6 +51,10 @@ config BR2_mips_32r2
 	bool "Generic MIPS32R2"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
+config BR2_mips_32r3
+	bool "Generic MIPS32R3"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R3
 config BR2_mips_32r5
 	bool "Generic MIPS32R5"
 	depends on !BR2_ARCH_IS_64
@@ -95,6 +105,10 @@ config BR2_mips_64r2
 	bool "Generic MIPS64R2"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R2
+config BR2_mips_64r3
+	bool "Generic MIPS64R3"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R3
 config BR2_mips_64r5
 	bool "Generic MIPS64R5"
 	depends on BR2_ARCH_IS_64
@@ -213,6 +227,7 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_ARCH
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
+	default "mips32r3"	if BR2_mips_32r3
 	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
 	default "interaptiv"	if BR2_mips_interaptiv
@@ -222,6 +237,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r2"	if BR2_mips_xburst
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
+	default "mips64r3"	if BR2_mips_64r3
 	default "mips64r5"	if BR2_mips_64r5
 	default "mips64r6"	if BR2_mips_64r6
 	default "i6400"		if BR2_mips_i6400
-- 
2.19.2
