From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:45 +0200
Subject: [Buildroot] [PATCH 1/5] arch: re-enable m68k and add a few
	architecture variants
In-Reply-To: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bc2ee4c68e37835c1e9fd0a5d093126444ed967a.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |   41 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 40 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index a2c0037..7efd672 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -48,7 +48,6 @@ config BR2_i386
 
 config BR2_m68k
 	bool "m68k"
-	depends on BROKEN # ice in uclibc / inet_ntoa_r
 	help
 	  Motorola 68000 family microprocessor
 	  http://en.wikipedia.org/wiki/M68k
@@ -577,6 +576,40 @@ config BR2_powerpc_SPE
 	depends on BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
 endchoice
 
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_m68k
+	default BR2_generic_m68k
+	help
+	  Specific CPU variant to use
+config BR2_generic_m68k
+	bool "generic"
+config BR2_m68k_68000
+	bool "m68k 68000"
+config BR2_m68k_68010
+	bool "m68k 68010"
+config BR2_m68k_68020
+	bool "m68k 68020"
+config BR2_m68k_68030
+	bool "m68k 68030"
+config BR2_m68k_68040
+	bool "m68k 68030"
+config BR2_m68k_68060
+	bool "m68k 68030"
+config BR2_m68k_5206
+        bool "coldfire 5206"
+config BR2_m68k_51qe
+        bool "coldfire 51qe"
+config BR2_m68k_5206e
+        bool "coldfire 5206e"
+config BR2_m68k_5208
+        bool "coldfire 5208"
+config BR2_m68k_5307
+        bool "coldfire 5307"
+config BR2_m68k_5407
+        bool "coldfire 5407"
+endchoice
+
 config BR2_ARCH
 	string
 	default "arm"		if BR2_arm
@@ -845,3 +878,9 @@ config BR2_GCC_TARGET_CPU
 	default sparchfleonv8	if BR2_sparc_sparchfleonv8
 	default sparcsfleon	if BR2_sparc_sparcsfleon
 	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
+	default 5206		if BR2_m68k_5206
+	default 51qe		if BR2_m68k_51qe
+	default 5206e		if BR2_m68k_5206e
+	default 5208		if BR2_m68k_5208
+	default 5307		if BR2_m68k_5307
+	default 5407		if BR2_m68k_5407
-- 
1.7.4.1
