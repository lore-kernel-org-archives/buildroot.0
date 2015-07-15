From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 16:47:17 +0300
Subject: [Buildroot] [PATCH] qt: enable Script and WebKit modules for ARC
Message-ID: <1436968037-26800-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now when ARC toolchain also supports NPTL both Qt's Script and WebKit
modules could be successfully built and then executed on ARC.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 306fe1f..cadc784 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -412,7 +412,8 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64 || \
+		BR2_arc
 	# The CodeSourcery SuperH toolchain fails to build Webkit,
 	# with an assertion failure in binutils.
 	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
@@ -459,7 +460,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
-		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || BR2_arc
 
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
-- 
2.4.3
