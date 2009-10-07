From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:29 +0200
Subject: [Buildroot] [PATCH 06/14] allow for testing gcc-4.5
In-Reply-To: <df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 toolchain/gcc/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index db7e32e..26b531c 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -65,10 +65,10 @@ choice
 		depends on !BR2_avr32 && !BR2_nios2
 		bool "gcc 4.4.x"
 
-#	config BR2_GCC_VERSION_4_3
-#		depends on !BR2_avr32 && !BR2_nios2
-#		select BR2_GCC_IS_SNAP
-#		bool "gcc 4.3"
+	config BR2_GCC_VERSION_4_5
+		depends on !BR2_avr32 && !BR2_nios2
+		select BR2_GCC_IS_SNAP
+		bool "gcc 4.5"
 endchoice
 
 config BR2_GCC_IS_SNAP
@@ -87,7 +87,7 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20070921"
+	default ""
 	depends on BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
 	default "4.4.1"     if BR2_GCC_VERSION_4_4_X
-	default "4.3"       if BR2_GCC_VERSION_4_3
+	default "4.5"       if BR2_GCC_VERSION_4_5
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
-- 
1.6.3.3
