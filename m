Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A872C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC5F6083C;
	Sat, 19 Apr 2025 21:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-nbJkb_LWon; Sat, 19 Apr 2025 21:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1FD607EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1FD607EC;
	Sat, 19 Apr 2025 21:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81C2422F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F87D80BCD
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97z5JELpisFn for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F56C80B80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F56C80B80
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B1DD8035D; Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:43:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bedc44c073972a70274c103704c58044365ecf96
X-Git-Newrev: eb685196cdf557e6e7554852be31b6189ede368e
X-Patchwork-Hint: ignore
Message-Id: <20250419214550.4B1DD8035D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.37.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb685196cdf557e6e7554852be31b6189ede368e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.37.1.1-1/debian/changelog

This commit removes the package patch, included in upstream version.
HOST_FAKEROOT_AUTORECONF = YES is also removed, because it is no longer
needed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile.am-fix-parallel-build.patch      | 97 ----------------------
 package/fakeroot/fakeroot.hash                     |  6 +-
 package/fakeroot/fakeroot.mk                       |  6 +-
 3 files changed, 5 insertions(+), 104 deletions(-)

diff --git a/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch b/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch
deleted file mode 100644
index 2f21f84349..0000000000
--- a/package/fakeroot/0001-Makefile.am-fix-parallel-build.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 29e9322e6a8238205780107e731a51b48845f9c7 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Mon, 10 Feb 2025 22:59:04 +0100
-Subject: [PATCH] Makefile.am: fix parallel build
-
-When building fakeroot on host with large number of CPUs, compilation
-can randomly fail. Failures were observed on hosts with 24 CPUs.
-
-Build logs show errors such as:
-
-    make -j$(nproc)
-    ...
-    awk -f ./wrapawk < ./wrapfunc.inp
-    awk -f ./wrapawk < ./wrapfunc.inp
-    ...
-    In file included from libfakeroot.c:265:
-    wraptmpf.h:607: error: unterminated #ifdef
-      607 | #ifdef __APPLE__
-          |
-    wraptmpf.h:601: error: unterminated #ifdef
-      601 | #ifdef HAVE_FTS_CHILDREN
-          |
-    wraptmpf.h:2: error: unterminated #ifndef
-        2 | #ifndef WRAPTMPF_H
-          |
-    ...
-
-The issue was observed in the builders of Buildroot Linux [1], which
-is using fakeroot. Examples of build failures are [2], [3], [4].
-
-It is important to note that in all failing cases, there is
-more that one parallel invocation of the "wrapawk" script [5].
-
-This script is meant to generate many output files (wrapped.h,
-wrapdef.h, wrapstruct.h, wraptmpf.h) from a single invocation.
-
-The Makefile.am file is using multiple targets in an attempt to
-reflect that generation of multiple outputs at once. See [6].
-
-This use of multiple targets in this rule is incorrect here. See
-the Make manual [7]. This construct, used in Makefile.am, incorrectly
-assumes all those targets are independant (so they can be executed in
-parallel). They are not. In the current failing case, parallel
-invocations will generates all their respective output files,
-overwriting each other. This could lead to incomplete generated
-files, resulting to the observed compilation failures.
-
-Note that GNU Make 4.3 introduced "Grouped Targets" for that purpose.
-See "Rules with Grouped Targets" section in [7]. But this would add a
-requirement on Make >= 4.3.
-
-For that reason, this commit fixes the issue by using a simpler
-construct, working with all Make versions: the first output file
-"wrapped.h" is kept as a target, and it is devlared as a
-dependency of the three other generated files. This change makes sure
-that only one invocation of "wrapawk" will happen at a time,
-disregarding the number of parallel jobs requiring those generated
-files. This has the effect of completely solving the parallel build
-for all GNU Make versions.
-
-[1] https://buildroot.org/
-[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451831
-[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451244
-[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451198
-[5] https://salsa.debian.org/clint/fakeroot/-/blob/master/wrapawk
-[6] https://salsa.debian.org/clint/fakeroot/-/blob/upstream/1.37/Makefile.am#L54
-[7] https://www.gnu.org/software/make/manual/html_node/Multiple-Targets.html
-
-Upstream: Proposed: https://salsa.debian.org/clint/fakeroot/-/merge_requests/33
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile.am | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 46f01eb..ff71a8d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -48,12 +48,13 @@ EXTRA_DIST=wrapawk wrapawk_macosx wrapfunc.inp           \
- CLEAN_FILES=fakerootconfig.h
- 
- if MACOSX
--wrapped.h wrapdef.h wrapstruct.h wraptmpf.h:wrapawk_macosx wrapfunc.inp
-+wrapped.h: wrapawk_macosx wrapfunc.inp
- 	awk -f $(srcdir)/wrapawk_macosx < $(srcdir)/wrapfunc.inp
- else !MACOSX
--wrapped.h wrapdef.h wrapstruct.h wraptmpf.h:wrapawk wrapfunc.inp
-+wrapped.h: wrapawk wrapfunc.inp
- 	awk -f $(srcdir)/wrapawk < $(srcdir)/wrapfunc.inp
- endif !MACOSX
-+wrapdef.h wrapstruct.h wraptmpf.h: wrapped.h
- 
- libfakeroot.lo:libfakeroot.c wrapdef.h wrapstruct.h wraptmpf.h
- 
--- 
-2.48.1
-
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 0d78d71235..e8506672d8 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.36-1.dsc
-sha1  ea895c6632fcf1b38cc84987d1b4daf833ffd430  fakeroot_1.36.orig.tar.gz
-sha256  7fe3cf3daf95ee93b47e568e85f4d341a1f9ae91766b4f9a9cdc29737dea4988  fakeroot_1.36.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.1-1.dsc
+sha1  baec51fadb0900cd4ed095c9efcff59699261623  fakeroot_1.37.1.1.orig.tar.gz
+sha256  86b0b75bf319ca42e525c098675b6ed10a06b76e69ec9ccf20ef5e03883b3a14  fakeroot_1.37.1.1.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index f557161770..8f85fe16a6 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.36
+FAKEROOT_VERSION = 1.37.1.1
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20241022T144244Z/pool/main/f/fakeroot/
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250329T150348Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -15,8 +15,6 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
-# 0001-Makefile.am-fix-parallel-build.patch
-HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
