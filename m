Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44186C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5BF283748;
	Mon, 20 Feb 2023 23:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5BF283748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsUysp9MjNC2; Mon, 20 Feb 2023 23:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1042783750;
	Mon, 20 Feb 2023 23:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1042783750
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87B851BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90C58616BB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C58616BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRL_IPL-fvYG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE6061381
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE6061381
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CB1D828C8; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:02:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9b155e45faa9fb941c1a4fc51baea82b6496dff
X-Git-Newrev: 54a8cb19331c8e75f6a48cb529c18619379414d7
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.6CB1D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/multipath-tools: drop
 patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54a8cb19331c8e75f6a48cb529c18619379414d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop path and set SYSTEMD="" if needed following upstream feedback:
https://github.com/opensvc/multipath-tools/pull/34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...c-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch | 35 ----------------------
 package/multipath-tools/multipath-tools.mk         |  3 +-
 2 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
deleted file mode 100644
index 133094a7f7..0000000000
--- a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8370da992c752e4238de7a8b02ce0e179353c959 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar-dev@posteo.net>
-Date: Sun, 6 Sep 2020 10:37:41 +0200
-Subject: [PATCH] Makefile.inc: Enable systemd if ENABLE_SYSTEMD is defined
-
-systemd is disabled by default, to activate it set ENABLE_SYSTEMD.
-
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- Makefile.inc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index d4d1e0dd..32bc1846 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -35,6 +35,7 @@ ifndef RUN
- 	endif
- endif
- 
-+ifdef ENABLE_SYSTEMD
- ifndef SYSTEMD
- 	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
- 		SYSTEMD = $(shell pkg-config --modversion libsystemd)
-@@ -45,6 +46,7 @@ ifndef SYSTEMD
- 		endif
- 	endif
- endif
-+endif
- 
- ifndef SYSTEMDPATH
- 	SYSTEMDPATH=usr/lib
--- 
-2.28.0
-
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index df3d5138e8..d6abf68ca0 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -31,7 +31,8 @@ MULTIPATH_TOOLS_MAKE_OPTS = \
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MULTIPATH_TOOLS_DEPENDENCIES += systemd
-MULTIPATH_TOOLS_MAKE_OPTS += ENABLE_SYSTEMD=1
+else
+MULTIPATH_TOOLS_MAKE_OPTS += SYSTEMD=""
 endif
 
 define MULTIPATH_TOOLS_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
