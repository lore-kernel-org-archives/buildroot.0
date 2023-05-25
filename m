Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C24CC77B7E
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 21:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7C0E42C70;
	Thu, 25 May 2023 21:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C0E42C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRQfD_MUI3O5; Thu, 25 May 2023 21:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8024242C66;
	Thu, 25 May 2023 21:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8024242C66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F70F1BF360
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1542D616FC
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1542D616FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNftZLFBgx4F for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 21:51:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0743E6168F
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0743E6168F
 for <buildroot@buildroot.org>; Thu, 25 May 2023 21:51:23 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id C85B65FD51;
 Fri, 26 May 2023 00:51:21 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Fri, 26 May 2023 00:51:21 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Fri, 26 May 2023 00:51:02 +0300
Message-ID: <20230525215103.37218-2-svromanov@sberdevices.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525215103.37218-1-svromanov@sberdevices.ru>
References: <20230525215103.37218-1-svromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/25 11:25:00 #21349968
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685051481;
 bh=3kHUFU4yd1tzLdwPEqUmy+dL42sPW3r8ZkaInc1OlRs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=bySo+7fhrFMUHCXw1sO435mgRY7gpbfUXNn92c45RZENSKl2u/vdWOKyQbNJRpbPz
 7gDfx8ko3f98OV+jv9a50/SnZrl70wIxsH6SFrY38foRp4bW80j/uKMPERG6EwglrW
 KDQU57LSVC0zmCr9KsUiUzfUTBbYexwaKB6DLJg1ICIipZAgWv+L40oSywyB9/y7lB
 NxOTvMMXnHEqozyMo8i5nHfBTujk70fdE6L1EN7orFF61MEKTIqA9loMk9ctpi1Jyx
 ulSF3VdILFGzxsIil4twb4IjApkv+BoCAIPIoDfRxPJ5m18hI1evfivitUfyN+UFke
 gV+GzTi/BarsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=bySo+7fh
Subject: [Buildroot] [RFC PATCH v1 1/2] package/ck: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Sergey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Romanov <svromanov@sberdevices.ru>
Cc: svromanov@sberdevices.ru, chip-club@ya.ru, akopytov@gmail.com,
 sbahra@repnop.org, thomas.petazzoni@bootlin.com,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Concurrency primitives, safe memory reclamation
mechanisms and non-blocking data structures
for the research, design and implementation
of high performance concurrent systems.

https://github.com/concurrencykit/ck.git

Signed-off-by: Sergey Romanov <svromanov@sberdevices.ru>
---
 .checkpackageignore                           |   1 +
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...oid-buildroot-s-influence-on-LDFLAGS.patch | 191 ++++++++++++++++++
 package/ck/Config.in                          |  23 +++
 package/ck/ck.hash                            |   3 +
 package/ck/ck.mk                              |  42 ++++
 7 files changed, 264 insertions(+)
 create mode 100644 package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index f2dea0dfd9..1be4e79a2b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -286,6 +286,7 @@ package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch Upstream
 package/chrony/S49chrony Indent Shellcheck Variables
+package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch Upstream
 package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
 package/cmake/0001-rename-cmake-rootfile.patch Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index e76717e845..4accefb251 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2626,6 +2626,9 @@ F:	package/rtl8189fs/
 F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
+N:	Sergey Romanov <svromanov@sberdevices.ru>
+F:	package/ck/
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..c81ddc81f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -92,6 +92,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
 	source "package/cache-calibrator/Config.in"
+	source "package/ck/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
diff --git a/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch b/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
new file mode 100644
index 0000000000..7e2cc85ba6
--- /dev/null
+++ b/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
@@ -0,0 +1,191 @@
+From 0b30b184538c0de485fe292e2ebb6bfea3c255bc Mon Sep 17 00:00:00 2001
+From: Sergey Romanov <svromanov@sberdevices.ru>
+Date: Thu, 25 May 2023 19:01:28 +0300
+Subject: [PATCH] Avoid buildroot's influence on LDFLAGS
+
+Upstream-status: Pending
+
+Signed-off-by: Sergey Romanov <svromanov@sberdevices.ru>
+---
+ build/ck.build.in          |  2 +-
+ build/ck.build.ppc64       |  2 +-
+ build/ck.build.x86_64      |  2 +-
+ build/regressions.build.in |  2 +-
+ configure                  | 28 +++++++++++++++-------------
+ src/Makefile.in            |  2 +-
+ 6 files changed, 20 insertions(+), 18 deletions(-)
+
+diff --git a/build/ck.build.in b/build/ck.build.in
+index 1d6bfe3..f68b5b7 100644
+--- a/build/ck.build.in
++++ b/build/ck.build.in
+@@ -3,7 +3,7 @@ MAKE=make
+ SRC_DIR=@SRC_DIR@
+ BUILD_DIR=@BUILD_DIR@
+ CFLAGS+=@CFLAGS@ -I$(SRC_DIR)/include -I$(BUILD_DIR)/include
+-LDFLAGS+=@LDFLAGS@
++LDFLAGS_CK+=@LDFLAGS_CK@
+ ALL_LIBS=@ALL_LIBS@
+ LD=@LD@
+ 
+diff --git a/build/ck.build.ppc64 b/build/ck.build.ppc64
+index 51003f4..7e25f10 100644
+--- a/build/ck.build.ppc64
++++ b/build/ck.build.ppc64
+@@ -1,2 +1,2 @@
+ CFLAGS+=-m64 -D__ppc64__
+-LDFLAGS+=-m64
++LDFLAGS_CK+=-m64
+diff --git a/build/ck.build.x86_64 b/build/ck.build.x86_64
+index 81b378a..160c4f1 100644
+--- a/build/ck.build.x86_64
++++ b/build/ck.build.x86_64
+@@ -1,2 +1,2 @@
+ CFLAGS+=-m64 -D__x86_64__
+-LDFLAGS+=-m64
++LDFLAGS_CK+=-m64
+diff --git a/build/regressions.build.in b/build/regressions.build.in
+index 6d79a8b..f1c7515 100644
+--- a/build/regressions.build.in
++++ b/build/regressions.build.in
+@@ -3,7 +3,7 @@ MAKE=make
+ CORES=@CORES@
+ CFLAGS=@CFLAGS@ -I../../../include -DCORES=@CORES@
+ LD=@LD@
+-LDFLAGS=@LDFLAGS@
++LDFLAGS_CK=@LDFLAGS_CK@
+ PTHREAD_CFLAGS=@PTHREAD_CFLAGS@
+ BUILD_DIR=@BUILD_DIR@
+ 
+diff --git a/configure b/configure
+index 340e05c..f73104a 100755
+--- a/configure
++++ b/configure
+@@ -112,7 +112,7 @@ generate()
+ 	    -e "s#@ALL_LIBS@#$ALL_LIBS#g"			\
+ 	    -e "s#@INSTALL_LIBS@#$INSTALL_LIBS#g"		\
+ 	    -e "s#@LD@#$LD#g"					\
+-	    -e "s#@LDFLAGS@#$LDFLAGS#g"				\
++	    -e "s#@LDFLAGS_CK@#$LDFLAGS_CK#g"				\
+ 	    -e "s#@PTHREAD_CFLAGS@#$PTHREAD_CFLAGS#g"		\
+ 	    -e "s#@MANDIR@#$MANDIR#g"				\
+ 	    -e "s#@GZIP@#$GZIP#g"				\
+@@ -156,7 +156,7 @@ generate_stdout()
+ 	echo "            LDNAME = $LDNAME"
+ 	echo "    LDNAME_VERSION = $LDNAME_VERSION"
+ 	echo "      LDNAME_MAJOR = $LDNAME_MAJOR"
+-	echo "           LDFLAGS = $LDFLAGS"
++	echo "        LDFLAGS_CK = $LDFLAGS_CK"
+ 	echo "        STATIC_LIB = $DISABLE_STATIC"
+ 	echo "              GZIP = $GZIP"
+ 	echo "             CORES = $CORES"
+@@ -222,7 +222,7 @@ for option; do
+ 		echo "   AR       AR archiver command"
+ 		echo "   CC       C compiler command"
+ 		echo "   CFLAGS   C compiler flags"
+-		echo "   LDFLAGS  Linker flags"
++		echo "   LDFLAGS_CK  Linker flags"
+ 		echo "   GZIP     GZIP compression tool"
+ 		echo
+ 		echo "Report bugs to ${MAINTAINER}."
+@@ -376,15 +376,15 @@ case "$SYSTEM" in
+ 		;;
+ 	MINGW32*|MSYS_NT*)
+ 		SYSTEM=mingw32
+-		LDFLAGS="-mthreads $LDFLAGS"
++		LDFLAGS_CK="-mthreads $LDFLAGS_CK"
+ 		;;
+ 	MINGW64*)
+ 		SYSTEM=mingw64
+-		LDFLAGS="-mthreads $LDFLAGS"
++		LDFLAGS_CK="-mthreads $LDFLAGS_CK"
+ 		;;
+ 	CYGWIN_NT*)
+ 		SYSTEM=cygwin
+-		LDFLAGS="-mthreads $LDFLAGS"
++		LDFLAGS_CK="-mthreads $LDFLAGS_CK"
+ 		;;
+ 	*)
+ 		SYSTEM=
+@@ -413,7 +413,7 @@ case $PLATFORM in
+ 		MM="${MM:-"CK_MD_RMO"}"
+ 		PLATFORM=ppc
+ 		ENVIRONMENT=32
+-		LDFLAGS="-m32 $LDFLAGS"
++		LDFLAGS_CK="-m32 $LDFLAGS_CK"
+ 		;;
+ 	"sun4u"|"sun4v"|"sparc64")
+ 		RTM_ENABLE="CK_MD_RTM_DISABLE"
+@@ -421,7 +421,7 @@ case $PLATFORM in
+ 		MM="${MM:-"CK_MD_TSO"}"
+ 		PLATFORM=sparcv9
+ 		ENVIRONMENT=64
+-		LDFLAGS="-m64 $LDFLAGS"
++		LDFLAGS_CK="-m64 $LDFLAGS_CK"
+ 		;;
+ 	i386|i486|i586|i686|i586_i686|pentium*|athlon*|k5|k6|k6_2|k6_3)
+ 		LSE_ENABLE="CK_MD_LSE_DISABLE"
+@@ -474,7 +474,7 @@ case $PLATFORM in
+ 		LSE_ENABLE="CK_MD_LSE_DISABLE"
+ 		PLATFORM=x86_64
+ 		ENVIRONMENT=64
+-		LDFLAGS="-m64 $LDFLAGS"
++		LDFLAGS_CK="-m64 $LDFLAGS_CK"
+ 		MM="${MM:-"CK_MD_TSO"}"
+ 		;;
+ 	"i86pc")
+@@ -686,6 +686,8 @@ $CC -o .1 .1.c
+ COMPILER=`./.1 2> /dev/null`
+ r=$?
+ rm -f .1.c .1
++COMPILER="gcc"
++r=0
+ 
+ if test "$r" -ne 0; then
+ 	assert "" "update compiler"
+@@ -695,7 +697,7 @@ fi
+ 
+ if test "$COMPILER" = "suncc"; then
+ 	LD=/bin/ld
+-	LDFLAGS="-G -z text -h libck.so.$VERSION_MAJOR $LDFLAGS"
++	LDFLAGS_CK="-G -z text -h libck.so.$VERSION_MAJOR $LDFLAGS_CK"
+ 	CFLAGS="-xO5 $CFLAGS"
+ 	PTHREAD_CFLAGS="-mt -lpthread"
+ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER" = "mingw32" || test "$COMPILER" = "mingw64"; then
+@@ -711,9 +713,9 @@ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER"
+ 		CC_WL_OPT="-soname"
+ 	fi
+ 
+-	LDFLAGS="-Wl,$CC_WL_OPT,$SONAME $LDFLAGS"
++	LDFLAGS_CK="-Wl,$CC_WL_OPT,$SONAME $LDFLAGS_CK"
+ 	if test "$WANT_PIC" = "yes"; then
+-		LDFLAGS="$LDFLAGS -shared -fPIC"
++		LDFLAGS_CK="$LDFLAGS_CK -shared -fPIC"
+ 		CFLAGS="$CFLAGS -fPIC"
+ 
+ 		if [ "$DISABLE_STATIC" -eq 1 ]; then
+@@ -724,7 +726,7 @@ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER"
+ 			INSTALL_LIBS="install-so install-lib"
+ 		fi
+ 	else
+-		LDFLAGS="$LDFLAGS -fno-PIC"
++		LDFLAGS_CK="$LDFLAGS_CK -fno-PIC"
+ 		CFLAGS="$CFLAGS -fno-PIC"
+ 		if [ "$DISABLE_STATIC" -eq 1 ]; then
+ 			echo "Error: You have choosen to disable PIC, yet you also disabled the static lib." 1>&2
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 7378849..ee6f9ee 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -22,7 +22,7 @@ OBJECTS=ck_barrier_centralized.o	\
+ all: $(ALL_LIBS)
+ 
+ libck.so: $(OBJECTS)
+-	$(LD) $(LDFLAGS) -o $(TARGET_DIR)/libck.so $(OBJECTS)
++	$(LD) $(LDFLAGS_CK) -o $(TARGET_DIR)/libck.so $(OBJECTS)
+ 
+ libck.a: $(OBJECTS)
+ 	$(AR) rcs $(TARGET_DIR)/libck.a $(OBJECTS)
+-- 
+2.25.1
+
diff --git a/package/ck/Config.in b/package/ck/Config.in
new file mode 100644
index 0000000000..d88eaa8413
--- /dev/null
+++ b/package/ck/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_CK_ARCH_SUPPORTS
+	bool
+	default y if ((BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && \
+		!BR2_ARM_CPU_ARMV7M) || BR2_aarch64 || \
+		BR2_powerpc || BR2_powerpc64 || BR2_RISCV_64 || \
+		BR2_s390x || BR2_sparc_v9 || BR2_x86 || BR2_x86_64)
+
+config BR2_PACKAGE_CK_TOOLCHAIN_SUPPORTS
+	bool
+	default y if ((BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_GLIBC) && \
+		!BR2_TOOLCHAIN_USES_UCLIBC)
+
+config BR2_PACKAGE_CK
+	bool "concurrency kit"
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_CK_TOOLCHAIN_SUPPORTS
+	help
+	  Concurrency primitives, safe memory reclamation
+	  mechanisms and non-blocking data structures
+	  for the research, design and implementation
+	  of high performance concurrent systems.
+
+	  https://github.com/concurrencykit/ck.git
diff --git a/package/ck/ck.hash b/package/ck/ck.hash
new file mode 100644
index 0000000000..6d77ae4bee
--- /dev/null
+++ b/package/ck/ck.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97d2a21d5326ef79b4668be2e6eda6284ee77a64c0981b35fd9695c736c3d4ac  ck-0.7.1.tar.gz
+sha256  21a861f554f8f97047815e63ff5cbd57707b4c53dc1dd1b0f2dd43e6ca193464  LICENSE
diff --git a/package/ck/ck.mk b/package/ck/ck.mk
new file mode 100644
index 0000000000..ecdeadb057
--- /dev/null
+++ b/package/ck/ck.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# ck
+#
+################################################################################
+
+CK_VERSION = 0.7.1
+CK_SITE = $(call github,concurrencykit,ck,$(CK_VERSION))
+CK_LICENSE = Apache-2.0
+CK_LICENSE_FILES = LICENSE
+
+CK_INSTALL_STAGING = YES
+
+CK_PROFILE_PARAMS += --platform=$(BR2_ARCH)
+CK_PROFILE_PARAMS += --prefix="/usr"
+
+define CK_CONFIGURE_CMDS
+	( cd $(@D); \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(CK_PROFILE_CONF_ENV) \
+	./configure $(CK_PROFILE_PARAMS) )
+endef
+
+define CK_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(CK_PROFILE_CONF_ENV) \
+	$(MAKE) -C $(@D)
+endef
+
+define CK_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(CK_PROFILE_CONF_ENV) \
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define CK_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(CK_PROFILE_CONF_ENV) \
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
