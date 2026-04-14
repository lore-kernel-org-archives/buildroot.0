Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD8F9D0ED
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3C9683D1D;
	Tue, 14 Apr 2026 17:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SKbEb7A_F_b; Tue, 14 Apr 2026 17:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB91084A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188949;
	bh=aw5rekqj3VoP1QMuHdd8uAac+4Yo42Ft4HHxVrDKmMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dECtasZol7QKnLSD9WnNgzjvXQ4XY31/PdGxomuDSNHqX2K57dtyqhlF6aIAdMWrw
	 YCIgtWoDNQj2CHMay1BADUIkmiDA1Tv41KvA4tdhpSn5jBU0siWcilILZ9DiGH+9DC
	 HZkVkRtmIO59KEIqzeY59hGjbwD0VtoR2TOXmChqvx+XkEQHqOTeWSqtFyHW/eALAJ
	 hxLAgKuBQ83lCZ0hvsaWbX8RBUVZyB856pxlVzQIZydojjU2Fd4OE9Jl2rK82p0EAM
	 G7s7sMj0f/phLd2jxotO1dqLN1tZ6wV2bHtSAHZAuUlJ1vUpPXf8uZtvSwkHRyMJD7
	 3HTEv83G45p9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB91084A7B;
	Tue, 14 Apr 2026 17:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 318FA283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F666F4D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfOlBmAOOAu1 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FBC6ECE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FBC6ECE9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4877F7FB24; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a71efc10e052eff225907cc65c00fe9f46ccbc4
X-Git-Newrev: bbae39d4c715cf1e71b64c6bcb28f31cfb154aed
X-Patchwork-Hint: ignore
Message-Id: <20260414174852.4877F7FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre: remove package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbae39d4c715cf1e71b64c6bcb28f31cfb154aed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Quoting https://www.pcre.org/
"The older, but still widely deployed PCRE library, originally released
 in 1997, is at version 8.45. This version of PCRE is now at end of
 life, and is no longer being actively maintained. Version 8.45 is
 expected to be the final release of the older PCRE library, and new
 projects should use PCRE2 instead. [...]"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                             |  2 --
 Config.in.legacy                                |  7 ++++
 package/Config.in                               |  1 -
 package/pcre/0001-Kill-compatibility-bits.patch | 46 -------------------------
 package/pcre/0002-Disable-C-unit-tests.patch    | 42 ----------------------
 package/pcre/Config.in                          | 34 ------------------
 package/pcre/pcre.hash                          |  4 ---
 package/pcre/pcre.mk                            | 31 -----------------
 8 files changed, 7 insertions(+), 160 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2c186ab7e0..f313e9ba10 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -742,8 +742,6 @@ package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch lib_patch.Upstream
 package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch lib_patch.Upstream
-package/pcre/0001-Kill-compatibility-bits.patch lib_patch.Upstream
-package/pcre/0002-Disable-C-unit-tests.patch lib_patch.Upstream
 package/pdmenu/0001-autoconf-makeinfo.in-link-with-INTLLIBS-if-needed.patch lib_patch.Upstream
 package/pdmenu/0002-Makefile-autoconf-makeinfo.in-support-build-install-.patch lib_patch.Upstream
 package/perl-net-ssleay/0001-fix-build-system.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 078e2fdeac..af093ff3e1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PCRE
+	bool "pcre removed"
+	select BR2_LEGACY
+	help
+	  pcre was no longer maintained upstream, so it has been
+	  dropped. Look at pcre2 for an alternative.
+
 config BR2_PACKAGE_SNORT
 	bool "snort removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 71501cea53..bd2e06dc0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2326,7 +2326,6 @@ menu "Text and terminal handling"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
 	source "package/oniguruma/Config.in"
-	source "package/pcre/Config.in"
 	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
 	source "package/re2/Config.in"
diff --git a/package/pcre/0001-Kill-compatibility-bits.patch b/package/pcre/0001-Kill-compatibility-bits.patch
deleted file mode 100644
index d2cf76bf8d..0000000000
--- a/package/pcre/0001-Kill-compatibility-bits.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e180a4085d8d2f82a05f037e465708cfc16bd2bf Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 14 Jun 2016 20:31:12 -0300
-Subject: [PATCH] Kill compatibility bits
-
-Kill ABI compatibility bits, we don't need them.
-Fixes build failures on non-ELF targets.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Fabrice: update for 8.44]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pcrecpp.cc | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/pcrecpp.cc b/pcrecpp.cc
-index d09c9ab..6910db0 100644
---- a/pcrecpp.cc
-+++ b/pcrecpp.cc
-@@ -58,23 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  // results + PCRE workspace
- // Special object that stands-in for no argument
- Arg RE::no_arg((void*)NULL);
- 
--// This is for ABI compatibility with old versions of pcre (pre-7.6),
--// which defined a global no_arg variable instead of putting it in the
--// RE class.  This works on GCC >= 3, at least.  It definitely works
--// for ELF, but may not for other object formats (Mach-O, for
--// instance, does not support aliases.)  We could probably have a more
--// inclusive test if we ever needed it.  (Note that not only the
--// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
--// gnu-specific.)
--#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) \
--       && !defined(__INTEL_COMPILER) && !defined(__LCC__)
--# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
--# define ULP_AS_STRING_INTERNAL(x)   #x
--# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
--extern Arg no_arg
--  __attribute__((alias(USER_LABEL_PREFIX_STR "_ZN7pcrecpp2RE6no_argE")));
--#endif
--
- // If a regular expression has no error, its error_ field points here
- static const string empty_string;
- 
--- 
-2.7.3
-
diff --git a/package/pcre/0002-Disable-C-unit-tests.patch b/package/pcre/0002-Disable-C-unit-tests.patch
deleted file mode 100644
index 1c9f26eb2e..0000000000
--- a/package/pcre/0002-Disable-C-unit-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e3c636b8c7f9912d8d3a9fabdaa0a96ba69f7b29 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 14 Jun 2016 20:32:44 -0300
-Subject: [PATCH] Disable C++ unit tests
-
-They fail to build on static targets and they're not installed anyway.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.in | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6d03912..2c42b3e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -133,12 +133,6 @@ noinst_PROGRAMS = $(am__EXEEXT_2) $(am__EXEEXT_3) $(am__EXEEXT_4)
- @WITH_PCRE8_TRUE@am__append_20 = libpcreposix.la
- @WITH_GCOV_TRUE@@WITH_PCRE8_TRUE@am__append_21 = $(GCOV_CFLAGS)
- @WITH_PCRE_CPP_TRUE@am__append_22 = libpcrecpp.la
--@WITH_PCRE_CPP_TRUE@am__append_23 = pcrecpp_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
--@WITH_PCRE_CPP_TRUE@am__append_24 = pcrecpp_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_25 = $(GCOV_CXXFLAGS)
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_26 = $(GCOV_LIBS)
- @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE@am__append_27 = $(GCOV_LIBS)
-@@ -190,9 +184,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
- 	"$(DESTDIR)$(includedir)"
- @WITH_REBUILD_CHARTABLES_TRUE@am__EXEEXT_2 = dftables$(EXEEXT)
- @WITH_JIT_TRUE@am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
--@WITH_PCRE_CPP_TRUE@am__EXEEXT_4 = pcrecpp_unittest$(EXEEXT) \
--@WITH_PCRE_CPP_TRUE@	pcre_scanner_unittest$(EXEEXT) \
--@WITH_PCRE_CPP_TRUE@	pcre_stringpiece_unittest$(EXEEXT)
- PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
- am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
- am__vpath_adj = case $$p in \
--- 
-2.7.3
-
diff --git a/package/pcre/Config.in b/package/pcre/Config.in
deleted file mode 100644
index 9d3a143365..0000000000
--- a/package/pcre/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_PCRE
-	bool "pcre"
-	help
-	  Perl Compatible Regular Expressions. By default, only the
-	  8-bits libpcre is built. To get the 16-bits and/or 32-bits
-	  variants libpcre16/libpcre32, use the package sub-options.
-
-	  http://www.pcre.org/
-
-if BR2_PACKAGE_PCRE
-
-config BR2_PACKAGE_PCRE_16
-	bool "16-bit pcre"
-	help
-	  This option builds the 16-bits pcre library, i.e 'libpcre16'
-
-config BR2_PACKAGE_PCRE_32
-	bool "32-bit pcre"
-	help
-	  This option builds the 32-bits pcre library, i.e 'libpcre32'
-
-config BR2_PACKAGE_PCRE_UTF
-	bool "UTF-8/16/32 support in pcre"
-	help
-	  This option builds the pcre library with UTF-8/16/32 support
-
-config BR2_PACKAGE_PCRE_UCP
-	bool "Unicode properties support in pcre"
-	select BR2_PACKAGE_PCRE_UTF
-	help
-	  This option builds the pcre library with Unicode properties
-	  support (implies UTF-8/16/32 support)'
-
-endif
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
deleted file mode 100644
index 6150303e24..0000000000
--- a/package/pcre/pcre.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
-# License files, locally calculated
-sha256  51b3dea44f63338b84b9c97b3d793826a8397309068cf9379a423216ab8ea5b2  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
deleted file mode 100644
index 59750c28e7..0000000000
--- a/package/pcre/pcre.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# pcre
-#
-################################################################################
-
-PCRE_VERSION = 8.45
-PCRE_SITE = http://downloads.sourceforge.net/project/pcre/pcre/$(PCRE_VERSION)
-PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
-PCRE_LICENSE = BSD-3-Clause
-PCRE_LICENSE_FILES = LICENCE
-PCRE_CPE_ID_VENDOR = pcre
-PCRE_INSTALL_STAGING = YES
-PCRE_CONFIG_SCRIPTS = pcre-config
-
-# They're required for host-libglib2
-HOST_PCRE_CONF_OPTS = --enable-unicode-properties
-
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-# pcre will use the host g++ if a cross version isn't available
-PCRE_CONF_OPTS += --disable-cpp
-endif
-
-PCRE_CONF_OPTS += --enable-pcre8
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
-PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
