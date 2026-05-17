Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FCCD4F3C
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517CB40DB2;
	Sun, 17 May 2026 21:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGclQilN43tl; Sun, 17 May 2026 21:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E984240E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779054566;
	bh=b7gY0uqAcnKw4fEyap1RogxPcIjRUsvtcaC8y7cWpA0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BIT5OkC/NoNajG/YgLMBWKdU7QO1aVcOSMeS1JINluMt5uDnKO43plgytnIrL4U6f
	 ndnoui7ZwynQ1D6t7cVd9rKECJHmnkQnIyDUkHgOVvFPAFITxyyxs95414akXDuicD
	 3tEEuJc9sJtfDMDr1rALjr7sLb7DpgJOvpwXcRJzAqD7tj7bvuMyoluMOfgBZLJWPZ
	 TwLAeoOq4zwXaBimxZck4PK4uk5bp7RcuIr7RG5+26P68otL/OEANc/u8YeCh8VwHL
	 pV50NDpGHCbi/LTGrxrHznvJhiTm9fu1zVBPpSUXlvbXuLB8hY/r4ITHpzIzVbrHaK
	 AUJsqf5ANnOjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E984240E8B;
	Sun, 17 May 2026 21:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 707AE390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6118A40634
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrjCnQWWRA7e for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECD3B40629
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECD3B40629
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:49:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25D0E8655C; Sun, 17 May 2026 21:49:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 23:47:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56ff67b50b27e54296af0c2ebc572f55b8e9703c
X-Git-Newrev: ec694f8f6d817033a096e1bd4d73e33b3b8ceaa2
X-Patchwork-Hint: ignore
Message-Id: <20260517214915.25D0E8655C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 26.03.00
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7640955681052506811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7640955681052506811==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec694f8f6d817033a096e1bd4d73e33b3b8ceaa2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See release announces:
26.01.00: https://lists.ubuntu.com/archives/fwts-devel/2026-January/014129.html
26.03.00: https://lists.ubuntu.com/archives/fwts-devel/2026-March/014171.html

The website [1] is no longer working. This commit updates FWTS_SITE
to use Github [2], which is now the primary download site in the
release announce.

This commit also rewrote the package patch (to add a new
--disable-werror configure option), which was proposed upstream.
This new option is added in FWTS_CONF_OPTS. With this patch now
proposed upstream, the corresponding .checkpackageignore entry
is also removed.

The license hash is also updated, after a year update in [3].

The fwts efi_runtime kernel module has been removed upstream,
in commit [4]. It is replaced by the Kernel driver efi_test, present
since Kernel v4.9, introduced in commit [5]. This commit removes the
option and updates the runtime test accordingly. A note is added in the
Config.in package help.

Fixes:
https://autobuild.buildroot.org/results/859390dbd2a1d7b3bf43588a461a2ff7dc66f92b/

[1] https://fwts.ubuntu.com/
[2] https://github.com/fwts/fwts
[3] https://github.com/fwts/fwts/commit/b3cd64e61d50956fe498b09e22d5d13e6bbe4a5c
[4] https://github.com/fwts/fwts/commit/6d52a621694be9ab3b83a44a449700205b48c598
[5] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ff6301dabc3ca20ab8f50f8d0252ac05da610d89

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Romain: add a comment for FWTS_AUTORECONF = YES]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  8 ++
 DEVELOPERS                                         |  1 +
 .../fwts/0001-build-allow-disabling-Werror.patch   | 98 ++++++++++++++++++++++
 package/fwts/0001-build-do-not-use-Werror.patch    | 79 -----------------
 package/fwts/Config.in                             | 15 +---
 package/fwts/fwts.hash                             |  6 +-
 package/fwts/fwts.mk                               | 11 +--
 support/testing/tests/package/test_fwts.py         |  6 +-
 .../package/test_fwts/linux-efi-test.fragment      |  1 +
 10 files changed, 122 insertions(+), 104 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b2d5320045..691e2b8138 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -353,7 +353,6 @@ package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch
 package/frr/S50frr Shellcheck
 package/fstrcmp/0001-disable-rpath.patch lib_patch.Upstream
 package/ftop/0001-overflow.patch lib_patch.Upstream
-package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ead9ceaa08..ef952ed524 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+	bool "fwts efi_runtime kernel module removed"
+	select BR2_LEGACY
+	help
+	  The fwts efi_runtime module has been removed in V26.01.00.
+	  The Kernel efi_test (Kernel CONFIG_EFI_TEST) should be used
+	  instead.
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d849fa828a..f2060c7101 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1896,6 +1896,7 @@ F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_fwts.py
+F:	support/testing/tests/package/test_fwts/
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_ghostscript.py
 F:	support/testing/tests/package/test_ghostscript/
diff --git a/package/fwts/0001-build-allow-disabling-Werror.patch b/package/fwts/0001-build-allow-disabling-Werror.patch
new file mode 100644
index 0000000000..685ed5b923
--- /dev/null
+++ b/package/fwts/0001-build-allow-disabling-Werror.patch
@@ -0,0 +1,98 @@
+From 35689cd692c4181d4f1faf21bc5f83d59ec70511 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 16 May 2026 11:03:22 +0200
+Subject: [PATCH] build: allow disabling -Werror
+
+BugLink: https://bugs.launchpad.net/fwts/+bug/2152793
+
+Enforcing "-Werror" in CFLAGS can be helpful from the package
+development point of view. It can also become problematic for
+distribution maintainers. When updating compilers, those newer
+compilers may have different warnings included in "-Wall" or
+"-Wextra", or their code analysis just improved.
+
+It is unlikely the fwts developers will update their toolchains
+at the same pace as other projects. There is a recent example
+with the release of gcc 16 breaking with fwts V26.03.00. Gcc 16
+is included in mainstream distributions like Fedora 44 and Arch Linux.
+
+In order to have smoother toolchain transitions, this commit
+introduces a new autoconf option "--disable-werror" which will remove
+the "-Werror" from the CFLAGS. In that case, the rest of the CFLAGS
+are preserved, which means the warning messages will still be reported,
+but the build will not fail.
+
+This commit also preserves the original project behavior, to have
+"-Werror" enabled by default with a simple "./configure" invocation.
+
+The motivation of this commit is to upstream a package patch that
+Buildroot carried over for a decade. See:
+https://gitlab.com/buildroot.org/buildroot/-/commit/a9a7a05f39a5cf720822a87c9ac6fa9cf27eaa0e
+
+Upstream: Proposed: https://lists.ubuntu.com/archives/fwts-devel/2026-May/014180.html
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ configure.ac              | 5 +++++
+ src/Makefile.am           | 2 +-
+ src/lib/src/Makefile.am   | 2 +-
+ src/utilities/Makefile.am | 2 +-
+ 4 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fbf487c5..62e43d75 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -9,6 +9,11 @@
+ 	  LT_INIT
+ 	  AC_C_INLINE
+ 	  AM_PROG_CC_C_O
++	  AC_ARG_ENABLE([werror],
++	  AS_HELP_STRING([--disable-werror], [disable use of -Werror]),
++		[enable_werror=$enableval], [enable_werror=yes])
++	  AS_IF([test x$enable_werror = xyes], [WERROR="-Werror"])
++	  AC_SUBST([WERROR])
+   	  AC_CHECK_FUNCS([localtime_r])
+ 	  AC_CHECK_FUNCS([dup2])
+ 	  AC_CHECK_FUNCS([getcwd])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a98a75a1..0e7ba401 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
+ 	-I$(top_srcdir)/smccc_test			\
+ 	-pthread					\
+-	-Wall -Werror -Wextra				\
++	-Wall $(WERROR) -Wextra				\
+ 	-Wno-address-of-packed-member			\
+ 	-Wfloat-equal -Wmissing-declarations		\
+ 	-Wno-long-long -Wredundant-decls -Wshadow	\
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index 6534f38f..20b01d1e 100644
+--- a/src/lib/src/Makefile.am
++++ b/src/lib/src/Makefile.am
+@@ -23,7 +23,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
+ 	-I$(top_srcdir)/smccc_test                      \
+ 	-DDATAROOTDIR=\"$(datarootdir)\"		\
+-	-Wall -Werror -Wextra				\
++	-Wall $(WERROR) -Wextra				\
+ 	-Wno-address-of-packed-member
+ 
+ pkglib_LTLIBRARIES = libfwts.la
+diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
+index 92c135d1..76a5cdcc 100644
+--- a/src/utilities/Makefile.am
++++ b/src/utilities/Makefile.am
+@@ -16,7 +16,7 @@
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ #
+ 
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
++AM_CPPFLAGS = -Wall $(WERROR) -Wextra -DDATAROOTDIR=\"$(datarootdir)\"	\
+ 	-I$(srcdir)/../lib/include
+ 
+ bin_PROGRAMS = kernelscan
+-- 
+2.54.0
+
diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
deleted file mode 100644
index c6a84537ed..0000000000
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From feb05271b484b158c14611839f968109e9cf3082 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 12 Aug 2016 23:11:56 +0200
-Subject: [PATCH] fwts: do not use -Werror
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Warnings come and go with various compiler versions, so using -Werror is
-prone to cause build failures with various compiler versions, especially
-newer versions that introduce new warnings.
-
-Remove use of -Werror.
-
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
-[Fabrice: updated for 20.08.00]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Vincent: rebased onto V21.05.00]
-Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
----
- configure.ac              | 2 +-
- src/Makefile.am           | 2 +-
- src/lib/src/Makefile.am   | 2 +-
- src/utilities/Makefile.am | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ca2f54e2..ed584abf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,5 +1,5 @@
- 	  AC_INIT([fwts],[0.1],[fwts-devel@lists.ubuntu.com])
--          AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])
-+          AM_INIT_AUTOMAKE([-Wall foreign subdir-objects])
-           m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
- 	  AC_CANONICAL_HOST
- 	  AC_CONFIG_MACRO_DIR([m4])
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3bb35e5c..e9fe92fe 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -13,7 +13,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/efi_runtime			\
- 	-I$(top_srcdir)/smccc_test			\
- 	-pthread					\
--	-Wall -Werror -Wextra				\
-+	-Wall -Wextra				\
- 	-Wno-address-of-packed-member			\
- 	-Wfloat-equal -Wmissing-declarations		\
- 	-Wno-long-long -Wredundant-decls -Wshadow	\
-diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index d5d53dd7..76c48d4d 100644
---- a/src/lib/src/Makefile.am
-+++ b/src/lib/src/Makefile.am
-@@ -22,7 +22,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/include	\
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
- 	-DDATAROOTDIR=\"$(datarootdir)\"		\
--	-Wall -Werror -Wextra				\
-+	-Wall -Wextra					\
- 	-Wno-address-of-packed-member
- 
- pkglib_LTLIBRARIES = libfwts.la
-diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index de38f070..785975ff 100644
---- a/src/utilities/Makefile.am
-+++ b/src/utilities/Makefile.am
-@@ -16,7 +16,7 @@
- # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
- #
- 
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
-+AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
- 	-I$(srcdir)/../lib/include
- 
- bin_PROGRAMS = kernelscan
--- 
-2.36.1
-
diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 2eebd111b0..2d9b09a53d 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -26,19 +26,10 @@ config BR2_PACKAGE_FWTS
 
 	  dtc (libfdt) is an optional dependency for fdt related tests.
 
-	  https://wiki.ubuntu.com/FirmwareTestSuite
-
-if BR2_PACKAGE_FWTS
-config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
-	bool "efi_runtime module"
-	depends on BR2_LINUX_KERNEL
-	help
-	  Firmware Test Suite (FWTS) provides a EFI runtime kernel
-	  module required to run UEFI tests.
+	  For testing EFI runtime services, the Kernel config must
+	  have CONFIG_EFI_TEST=y (since Kernel v4.9).
 
-comment "efi_runtime module needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-endif
+	  https://wiki.ubuntu.com/FirmwareTestSuite
 
 comment "fwts needs a glibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_PACKAGE_FWTS_ARCH_SUPPORTS
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 6725c9492d..526b7ccb4f 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  77d71524feb310236ccdb8b39dd39c6ca73acce5944f3cd54fc05d85a23d6d44  fwts-V25.11.00.tar.gz
+# Hash from: https://github.com/fwts/fwts/releases/tag/V26.03.00
+sha256  368fc4dbfde7f5c551de5d352d2f70f1a4d3aa20d7a7df0d4b162535e6e9cef9  fwts-V26.03.00.tar.gz
 
 # Hash for license file
-sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
+sha256  1ec8cffc8cf213afc5d854027d746c80e638a13b1688f2a352221490c681c54f  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index cdbf1c0366..02acdaa9dd 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.11.00
+FWTS_VERSION = 26.03.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
-FWTS_SITE = https://fwts.ubuntu.com/release
+FWTS_SITE = https://github.com/fwts/fwts/releases/download/V$(FWTS_VERSION)
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
+# 0001-build-allow-disabling-Werror.patch
 FWTS_AUTORECONF = YES
+FWTS_CONF_OPTS = --disable-werror
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
@@ -18,9 +20,4 @@ ifeq ($(BR2_OPTIMIZE_0),y)
 FWTS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O1"
 endif
 
-ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
-FWTS_MODULE_SUBDIRS = efi_runtime
-$(eval $(kernel-module))
-endif
-
 $(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 90bf086a58..a58f9ccb80 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -4,8 +4,10 @@ import infra.basetest
 
 
 class TestFwts(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/package/test_fwts/linux-efi-test.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_neoverse_n2=y
         BR2_TOOLCHAIN_EXTERNAL=y
@@ -21,6 +23,7 @@ class TestFwts(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
         BR2_TARGET_EDK2=y
         BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
         BR2_TARGET_GRUB2=y
@@ -31,7 +34,6 @@ class TestFwts(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_FWTS=y
-        BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE=y
         BR2_PACKAGE_HOST_GENIMAGE=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/support/testing/tests/package/test_fwts/linux-efi-test.fragment b/support/testing/tests/package/test_fwts/linux-efi-test.fragment
new file mode 100644
index 0000000000..f4baa2ab0f
--- /dev/null
+++ b/support/testing/tests/package/test_fwts/linux-efi-test.fragment
@@ -0,0 +1 @@
+CONFIG_EFI_TEST=y

--===============7640955681052506811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7640955681052506811==--
