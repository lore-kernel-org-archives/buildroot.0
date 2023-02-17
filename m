Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B4C05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 15:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9CD82162;
	Fri, 17 Feb 2023 15:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9CD82162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n1nM7SF0qF0; Fri, 17 Feb 2023 15:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD21182133;
	Fri, 17 Feb 2023 15:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD21182133
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257CB1BF976
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D1414051F
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1414051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUGxGobr47Be for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 15:08:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0372340191
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 15:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0372340191
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E63F986002; Fri, 17 Feb 2023 15:08:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 16:02:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5357f650d7e58043a5b8ab820972984eb07fef4
X-Git-Newrev: c674014c1744dd6db3dd8717efca51fe7ceb1038
X-Patchwork-Hint: ignore
Message-Id: <20230217150858.E63F986002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openipmi: bump to version 2.0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=c674014c1744dd6db3dd8717efca51fe7ceb1038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so also drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Avoid-searching-host-library-path.patch   | 53 ----------------------
 package/openipmi/openipmi.hash                     |  6 +--
 package/openipmi/openipmi.mk                       |  4 +-
 3 files changed, 4 insertions(+), 59 deletions(-)

diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
deleted file mode 100644
index 15b4510f67..0000000000
--- a/package/openipmi/0001-Avoid-searching-host-library-path.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 22 Jul 2015 07:04:33 +0300
-Subject: [PATCH] Avoid searching host library path
-
-The $(libdir) variable points to the location of the directory on the target
-system, /usr/lib by default. When cross compiling this directory contains the
-host libraries which may be different than target libraries. Don't use
-$(libdir) in the library search path.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Joel Stanley <joel@jms.id.au>
-[Fabrice: refresh patch for 2.0.32]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/openipmi/patches/35]
----
- cmdlang/Makefile.am | 3 +--
- unix/Makefile.am    | 6 ++----
- 2 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 264ee12be79f..0b3843784656 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -15,7 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
- 	$(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- bin_PROGRAMS = openipmish
- 
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index 5128839dad13..bd0f897ba8d6 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -10,12 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB) $(RT_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- noinst_HEADERS = heap.h
- 
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index eded076ade..fc3cf1a520 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1  73d7dce4312b006983b11367e4a43d4ec52cf888  OpenIPMI-2.0.32.tar.gz
-md5  532404c9df7d0e8bde975b95b9e6775b  OpenIPMI-2.0.32.tar.gz
+sha1  4387f227aad92756e296d1c9421e83231d355dbd  OpenIPMI-2.0.33.tar.gz
+md5  923d2914dbbc3307712f8c58401bab0f  OpenIPMI-2.0.33.tar.gz
 # Locally computed
-sha256  f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945  OpenIPMI-2.0.32.tar.gz
+sha256  fb53e9ea5e2681cf8af7cda024b1a0044c675f84116ca27ae9616c8b7ad95b49  OpenIPMI-2.0.33.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 81492ec131..ccf86f93cd 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.32
+OPENIPMI_VERSION = 2.0.33
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses readline host-pkgconf
 OPENIPMI_INSTALL_STAGING = YES
-# Patching Makefile.am
-OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
 	--with-glib=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
