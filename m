Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6FEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 832B883E1C;
	Sat, 22 Jan 2022 22:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qh8QWIeEMU0l; Sat, 22 Jan 2022 22:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A859083E17;
	Sat, 22 Jan 2022 22:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2353C1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1253B40871
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7F4blh8OoZ1 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 679A740529
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BA37182235; Sat, 22 Jan 2022 22:28:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:35:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d91f454117fafad219948bf1ea86b0d6e2301f76
X-Git-Newrev: bbb3e4615851cbd3c3c0ce4a72731347f006dc1f
X-Patchwork-Hint: ignore
Message-Id: <20220122222850.BA37182235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ksmbd-tools: bump to version 3.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbb3e4615851cbd3c3c0ce4a72731347f006dc1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix build failure with libkrb5 raised since the addition
of the package in commit 6be9913a7eeead7cdac804afc127791ba4b0e69e:

management/spnego.c:25:10: fatal error: spnego_mech.h: No such file or directory
   25 | #include "spnego_mech.h"
      |          ^~~~~~~~~~~~~~~

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.4

Fixes:
 - http://autobuild.buildroot.org/results/b4c3dba395327ab6ae28337efb962c99b2d5b922

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index ad507bfdb2..d146f36a0e 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd7218ebfeaa0d6a73c0a4beb9ea506228cd5695c1f8d3f9a9064e2346d52f0a  ksmbd-tools-3.4.3.tar.gz
+sha256  f42aec21515e34305bc07e1ce2c4926c87ea7bc8a675ca6d0a453f6b6be34e2b  ksmbd-tools-3.4.4.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index b3ffc3e768..b08845b581 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.3
+KSMBD_TOOLS_VERSION = 3.4.4
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
