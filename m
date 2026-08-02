Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E95C55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3259A405F0;
	Sun,  2 Aug 2026 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZpsvkQabEUA; Sun,  2 Aug 2026 19:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12BAD405E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700126;
	bh=64bdcEgpHTOENN6rY53r6xhr8pPuvJ02nGoN3rAeEB0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hKSCmUMgj8OqgWu68j6Ew5TBbBAjKWwxBmiuJ/TcgH0+79/1dyYRqeUbV3REXglrt
	 rcVNeYVML4OmMmWpZgZP7+F7KXD51l4W4GZBTlAWS3/+MuzulQnOhtEHDNiC5mDK/O
	 XoNpi2d61x+XaL5+xvh3radP+y9BdLlLML1GHHYaoBmxW7kgbPpgA4/2E3Pq1/tgOM
	 xMn99p5npMXY/jumm7ocuyVwsp6fw/vXyEWCWf+aYQPn7cNW47iHradtJGDokhjmT6
	 dOXe0XRx5b4mzgSG5fLX5yeZuQ6bRI0ueXVtYyGSVFCqVJbzL6IWXmCJH46daUyXqX
	 j/Vj+ijR6uPvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BAD405E2;
	Sun,  2 Aug 2026 19:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 314FD1295
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ECDF40029
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy6zRawuULjK for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235D540015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 235D540015
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D44868B833; Sun,  2 Aug 2026 19:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 21:13:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46525eb25f8144014ddbb5224770f25609a646d0
X-Git-Newrev: 1ef62a9d332fd855c927bbf9830c8213148633d7
X-Patchwork-Hint: ignore
Message-Id: <20260802194757.D44868B833@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 26.07.00
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ef62a9d332fd855c927bbf9830c8213148633d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See release announce [1].

This commit also removes the package patch, which was accepted upstream
in [2]. The comment before "FWTS_AUTORECONF = YES" is changed to
"No configure in tarball", because the patch 0001 is removed, but the
autoreconf is still needed.

[1] https://lists.ubuntu.com/archives/fwts-devel/2026-July/014207.html
[2] https://github.com/fwts/fwts/commit/3bf8a5f3932239f76f2eb245265172ffc8f29323

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../fwts/0001-build-allow-disabling-Werror.patch   | 98 ----------------------
 package/fwts/fwts.hash                             |  4 +-
 package/fwts/fwts.mk                               |  4 +-
 3 files changed, 4 insertions(+), 102 deletions(-)

diff --git a/package/fwts/0001-build-allow-disabling-Werror.patch b/package/fwts/0001-build-allow-disabling-Werror.patch
deleted file mode 100644
index 685ed5b923..0000000000
--- a/package/fwts/0001-build-allow-disabling-Werror.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 35689cd692c4181d4f1faf21bc5f83d59ec70511 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sat, 16 May 2026 11:03:22 +0200
-Subject: [PATCH] build: allow disabling -Werror
-
-BugLink: https://bugs.launchpad.net/fwts/+bug/2152793
-
-Enforcing "-Werror" in CFLAGS can be helpful from the package
-development point of view. It can also become problematic for
-distribution maintainers. When updating compilers, those newer
-compilers may have different warnings included in "-Wall" or
-"-Wextra", or their code analysis just improved.
-
-It is unlikely the fwts developers will update their toolchains
-at the same pace as other projects. There is a recent example
-with the release of gcc 16 breaking with fwts V26.03.00. Gcc 16
-is included in mainstream distributions like Fedora 44 and Arch Linux.
-
-In order to have smoother toolchain transitions, this commit
-introduces a new autoconf option "--disable-werror" which will remove
-the "-Werror" from the CFLAGS. In that case, the rest of the CFLAGS
-are preserved, which means the warning messages will still be reported,
-but the build will not fail.
-
-This commit also preserves the original project behavior, to have
-"-Werror" enabled by default with a simple "./configure" invocation.
-
-The motivation of this commit is to upstream a package patch that
-Buildroot carried over for a decade. See:
-https://gitlab.com/buildroot.org/buildroot/-/commit/a9a7a05f39a5cf720822a87c9ac6fa9cf27eaa0e
-
-Upstream: Proposed: https://lists.ubuntu.com/archives/fwts-devel/2026-May/014180.html
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- configure.ac              | 5 +++++
- src/Makefile.am           | 2 +-
- src/lib/src/Makefile.am   | 2 +-
- src/utilities/Makefile.am | 2 +-
- 4 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fbf487c5..62e43d75 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -9,6 +9,11 @@
- 	  LT_INIT
- 	  AC_C_INLINE
- 	  AM_PROG_CC_C_O
-+	  AC_ARG_ENABLE([werror],
-+	  AS_HELP_STRING([--disable-werror], [disable use of -Werror]),
-+		[enable_werror=$enableval], [enable_werror=yes])
-+	  AS_IF([test x$enable_werror = xyes], [WERROR="-Werror"])
-+	  AC_SUBST([WERROR])
-   	  AC_CHECK_FUNCS([localtime_r])
- 	  AC_CHECK_FUNCS([dup2])
- 	  AC_CHECK_FUNCS([getcwd])
-diff --git a/src/Makefile.am b/src/Makefile.am
-index a98a75a1..0e7ba401 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
- 	-I$(top_srcdir)/smccc_test			\
- 	-pthread					\
--	-Wall -Werror -Wextra				\
-+	-Wall $(WERROR) -Wextra				\
- 	-Wno-address-of-packed-member			\
- 	-Wfloat-equal -Wmissing-declarations		\
- 	-Wno-long-long -Wredundant-decls -Wshadow	\
-diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 6534f38f..20b01d1e 100644
---- a/src/lib/src/Makefile.am
-+++ b/src/lib/src/Makefile.am
-@@ -23,7 +23,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
- 	-I$(top_srcdir)/smccc_test                      \
- 	-DDATAROOTDIR=\"$(datarootdir)\"		\
--	-Wall -Werror -Wextra				\
-+	-Wall $(WERROR) -Wextra				\
- 	-Wno-address-of-packed-member
- 
- pkglib_LTLIBRARIES = libfwts.la
-diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index 92c135d1..76a5cdcc 100644
---- a/src/utilities/Makefile.am
-+++ b/src/utilities/Makefile.am
-@@ -16,7 +16,7 @@
- # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
- #
- 
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
-+AM_CPPFLAGS = -Wall $(WERROR) -Wextra -DDATAROOTDIR=\"$(datarootdir)\"	\
- 	-I$(srcdir)/../lib/include
- 
- bin_PROGRAMS = kernelscan
--- 
-2.54.0
-
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 526b7ccb4f..89ee2a5e6f 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://github.com/fwts/fwts/releases/tag/V26.03.00
-sha256  368fc4dbfde7f5c551de5d352d2f70f1a4d3aa20d7a7df0d4b162535e6e9cef9  fwts-V26.03.00.tar.gz
+# Hash from: https://github.com/fwts/fwts/releases/tag/V26.07.00
+sha256  ccee3375fe905a30311ea45f8baefc10af2517669f724f09f8df788bb8b4cbec  fwts-V26.07.00.tar.gz
 
 # Hash for license file
 sha256  1ec8cffc8cf213afc5d854027d746c80e638a13b1688f2a352221490c681c54f  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 02acdaa9dd..1f135c72c9 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-FWTS_VERSION = 26.03.00
+FWTS_VERSION = 26.07.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://github.com/fwts/fwts/releases/download/V$(FWTS_VERSION)
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
-# 0001-build-allow-disabling-Werror.patch
+# No configure in tarball
 FWTS_AUTORECONF = YES
 FWTS_CONF_OPTS = --disable-werror
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
