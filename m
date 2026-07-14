Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922CFC44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 18:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3594B409C7;
	Tue, 14 Jul 2026 18:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RYhsNnsHapg; Tue, 14 Jul 2026 18:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FAF2409D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784052010;
	bh=Om6cSfB9smzyBpWNgsg++PVKWLBKhXr7QZRWe4H1nwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ksjf4HRQCQpMgNuORw9k8qrnxhEOpufGHXzb4Ovukhq9CuvWyfQTmtBy8IjLflq7F
	 2jfkp9z+D5ehheOhWWRFgJNukgLkdp9U7kKKXYGosrG9NCbbSSVrlR7H2vpbaVaJsW
	 wwsLQ4a0M3LdObmjPenQ6v4RNBRwkH0j1V9iT1mI/k3IiWfrQG6CLacnimlUk5mDsY
	 pSt/lAoO3e/b3PdgWPasE4OR9RI23yUEsg/0yD9M71G61u0L7Uez0uV9jQGXi9JRCc
	 EvOiFVTj5cJuaaAWgNpRMJULEgQEsFlaxg52RlQcqKmJDSaFTbk+Vf8+1nsSTwNJMX
	 dF8yp+qFWWkMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FAF2409D5;
	Tue, 14 Jul 2026 18:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6808D49D
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 654728111E
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMl9T4KNAlKa for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 18:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D60810FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D60810FC
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 18:00:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B222888B8; Tue, 14 Jul 2026 17:59:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 19:31:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c912c6b4a52761ff98251251ec14b10cc4907bc8
X-Git-Newrev: 643f480f4379afe5677ec399c802b8d33734b601
X-Patchwork-Hint: ignore
Message-Id: <20260714175932.6B222888B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: bump to version 3.0.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/643f480f4379afe5677ec399c802b8d33734b601
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch 0002-Makefile.am-fix-build-without-makeinfo.patch is not longer
needed since it builds even if 'makeinfo' is not installed, so it's removed.

For release annoucne, see:
https://lists.gnu.org/archive/html/info-gnu/2025-12/msg00002.html

Changelog:
Changes are detailed in the git repo logs:
$ git clone git://git.sv.gnu.org/guile.git
$ git whatchanged

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[Julien:
 - remove .checkpackageignore entry to fix check-package error
 - add link to release announce
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...02-Makefile.am-fix-build-without-makeinfo.patch | 51 ----------------------
 package/guile/guile.hash                           |  2 +-
 package/guile/guile.mk                             |  2 +-
 4 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4ec39f9f36..e502d52138 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -407,7 +407,6 @@ package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch lib_patch.Upstream
 package/guile/0001-calculate-csqrt_manually.patch lib_patch.Upstream
-package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch lib_patch.Upstream
 package/gutenprint/0001-use-pregen-xmli18n-header.patch lib_patch.Upstream
 package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch lib_patch.Upstream
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch lib_patch.Upstream
diff --git a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
deleted file mode 100644
index 0d16f92387..0000000000
--- a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 9304ad88a5f4b083d348563c5de00da53b34cf46 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 6 Mar 2020 23:20:39 +0100
-Subject: [PATCH] Makefile.am: fix build without makeinfo
-
-Don't build doc subdir if makeinfo is not available otherwise build
-fails on:
-
-make[4]: Entering directory '/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/doc/ref'
-  MAKEINFO guile.info
-/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/build-aux/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <http://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <http://www.gnu.org/software/make/>
-
-Fixes:
- - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to bug-guile@gnu.org]
----
- Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ebbf6d476..2270afb9f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -38,8 +38,12 @@ SUBDIRS =					\
- 	test-suite				\
- 	benchmark-suite				\
- 	gc-benchmarks				\
--	am					\
-+	am
-+
-+if HAVE_MAKEINFO
-+SUBDIRS +=					\
- 	doc
-+endif
- 
- DIST_SUBDIRS = $(SUBDIRS) prebuilt
- 
--- 
-2.25.0
-
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index b671edad9d..4db8b1855b 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
+sha256  818c79d236657a7fa96fb364137cc7b41b3bdee0d65c6174ca03769559579460  guile-3.0.11.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 82daaf5ad4..467a21f5a2 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.9
+GUILE_VERSION = 3.0.11
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
