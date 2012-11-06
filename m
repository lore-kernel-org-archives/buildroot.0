From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:18 +0100
Subject: [Buildroot] [git commit] toolchain-external: add Sourcery CodeBench
	SuperH 2012.03
Message-ID: <20121106072429.200DD99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d85c0ba48a2d6e1ff024b3a1167a980cf7d08f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   20 ++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ad72de0..9ed3b3b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -422,6 +422,25 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	    - 970 glibc hard-float, 64 bits
 	      Set BR2_TARGET_OPTIMIZATION to -m64
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
+	bool "Sourcery CodeBench SH 2012.03"
+	depends on BR2_sh4a || BR2_sh4aeb
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the SuperH architecture,
+	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
+	  glibc 2.15, uClibc 0.9.30, gdb 7.2.50 and kernel headers
+	  3.2.10. It has support for the following variants:
+            - SH4A, glibc, little endian
+              Default.
+            - SH4A, glibc, big endian
+              Add -mb to BR2_TARGET_OPTIMIZATION
+            - SH4A, uClibc, little endian
+              Not usable in Buildroot yet.
+            - SH4A, uClibc, big endian
+              Not usable in Buildroot yet.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -682,6 +701,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
+	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index f05d9eb..4f6ca4a 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -226,6 +226,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/sgpp/lite/superh/portal/package8759/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
+TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package10148/public/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
