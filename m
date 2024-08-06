Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296A9C52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 17:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA27401CC;
	Tue,  6 Aug 2024 17:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKEPiL8ggRnF; Tue,  6 Aug 2024 17:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122AF401F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122AF401F3;
	Tue,  6 Aug 2024 17:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0A701BF3BF
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 17:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC8FD60842
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 17:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a487Kc0PtmCQ for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 17:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9139B60657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9139B60657
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 17:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F9C88423D; Tue,  6 Aug 2024 17:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 19:04:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bede54c774ef59640cc1b4d9fd1dabfc69e4ecdb
X-Git-Newrev: 69710addd121a18ff662c5a6dcb1d8f329f39d69
X-Patchwork-Hint: ignore
Message-Id: <20240806174237.3F9C88423D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69710addd121a18ff662c5a6dcb1d8f329f39d69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SWI-Prolog offers a comprehensive free Prolog environment. Since its
start in 1987, SWI-Prolog development has been driven by the needs of
real world applications. SWI-Prolog is widely used in research and
education as well as commercial applications.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/swipl/Config.in  | 43 +++++++++++++++++++++++++++++++++++++
 package/swipl/swipl.hash |  4 ++++
 package/swipl/swipl.mk   | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76f7fc5ed6..90c34e51f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1818,6 +1818,7 @@ F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
 F:	package/riscv-isa-sim/
+F:	package/swipl/
 F:	package/tig/
 F:	package/tinycompress/
 F:	package/z3/
@@ -1962,6 +1963,8 @@ F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_swipl.py
+F:	support/testing/tests/package/test_swipl/
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
diff --git a/package/Config.in b/package/Config.in
index 2ac351cce5..0d51c6af1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1476,6 +1476,7 @@ endmenu
 endif
 	source "package/quickjs/Config.in"
 	source "package/ruby/Config.in"
+	source "package/swipl/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
new file mode 100644
index 0000000000..84b6ace47f
--- /dev/null
+++ b/package/swipl/Config.in
@@ -0,0 +1,43 @@
+# swipl supports arch for which libc fenv.h provides all four macros:
+# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
+# See for example in glibc https://sourceware.org/git/glibc.git
+# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
+config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	# BR2_microblaze has only FE_TONEAREST
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# BR2_nios2 has only FE_TONEAREST
+	default y if BR2_or1k
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86_64
+	# BR2_xtensa supports only uclibc which does not have fenv.h
+
+config BR2_PACKAGE_SWIPL
+	bool "swipl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # __has_attribute()
+	depends on BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	# swipl needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ZLIB
+	help
+	  SWI-Prolog offers a comprehensive free Prolog
+	  environment. Since its start in 1987, SWI-Prolog development
+	  has been driven by the needs of real world
+	  applications. SWI-Prolog is widely used in research and
+	  education as well as commercial applications.
+
+	  https://www.swi-prolog.org
+
+comment "swipl needs a glibc or musl toolchain w/ gcc >= 5"
+	depends on BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
new file mode 100644
index 0000000000..9f980654ba
--- /dev/null
+++ b/package/swipl/swipl.hash
@@ -0,0 +1,4 @@
+# From https://www.swi-prolog.org/download/stable
+sha256  10d90b15734d14d0d7972dc11a3584defd300d65a9f0b1185821af8c3896da5e  swipl-9.2.0.tar.gz
+# Locally calculated
+sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
new file mode 100644
index 0000000000..d4263a6aa8
--- /dev/null
+++ b/package/swipl/swipl.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# swipl
+#
+################################################################################
+
+SWIPL_VERSION = 9.2.0
+SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
+SWIPL_LICENSE = BSD-2-Clause
+SWIPL_LICENSE_FILES = LICENSE
+
+SWIPL_DEPENDENCIES = host-swipl zlib
+
+# A host-swipl is needed to compile the target prolog boot
+# boot.prl file.
+HOST_SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_GMP=OFF \
+	-DUSE_TCMALLOC=OFF
+
+# swipl uses cmake macros try_run() and check_c_source_runs(), which
+# are not suitable for cross compilation. We add results in cache to
+# avoid running those tests. The SWIPL_NATIVE_FRIEND variable, is
+# meant to point to build directory of a host native swipl, rather
+# than the binary itself. The Cmake macro will append "src/swipl" to
+# the path set to this variable. Therefore, we cannot use the host
+# "swipl" binary installed in $(HOST_DIR)/usr/bin.
+SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DHAVE_WEAK_ATTRIBUTE=1 \
+	-DLLROUND_OK=1 \
+	-DMODF_OK=1 \
+	-DQSORT_R_GNU=1 \
+	-DSWIPL_NATIVE_FRIEND=$(HOST_SWIPL_SRCDIR) \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_TCMALLOC=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SWIPL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+SWIPL_CONF_OPTS += -DUSE_GMP=ON
+SWIPL_DEPENDENCIES += gmp
+else
+SWIPL_CONF_OPTS += -DUSE_GMP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+SWIPL_DEPENDENCIES += ncurses
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
