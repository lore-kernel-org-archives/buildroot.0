From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Oct 2011 21:20:11 +0200
Subject: [Buildroot] [PATCH 3/9] ext-toolchain: Add CodeSourcery SH uClinux
	2011.03
In-Reply-To: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7df62abce8712a5f72cccb2cc77f44c99b96c251.1317583191.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b6fa9bd..ac712ba 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -152,6 +152,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
             - SH4A, uClibc, little endian
             - SH4A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
+	bool "CodeSourcery SH 2011.03"
+	depends on BR2_sh2a
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_LARGEFILE
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the SuperH architecture, from CodeSourcery. It
+	  uses gcc 4.5.2, binutils 2.20, uClibc 0.9.30, gdb 7.2.50 and
+	  kernel headers 2.6.38. It has support for
+	  the following variants:
+            - SH2A, uClibc, big endian
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh2a
@@ -223,6 +239,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
+	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index bac39cf..48c11eb 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -191,6 +191,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package8749/public/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
-- 
1.7.4.1
