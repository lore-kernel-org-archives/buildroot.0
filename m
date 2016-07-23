From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:58:44 +0200
Subject: [Buildroot] [git commit] libunwind: needs ARM instruction support
Message-ID: <20160723210654.A1C6081D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a10967c7f0d29d600befc2c14a5859726ea6aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4cf/4cf517cd81d3aa5da26848edaba5df0bfbab2c77/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunwind/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 593172f..a70d9e8 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -10,13 +10,16 @@
 config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
-		(BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
+		(BR2_mips || BR2_mipsel || BR2_mips64 || \
 		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
-		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
+		(BR2_i386 || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64)
+		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
+		(BR2_i386 || BR2_x86_64)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
