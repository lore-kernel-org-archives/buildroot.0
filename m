Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C08C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8D3435FF;
	Wed, 10 Jan 2024 09:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8D3435FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZC4PJ6LVDcfZ; Wed, 10 Jan 2024 09:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4AB34366E;
	Wed, 10 Jan 2024 09:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4AB34366E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6071BF406
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E099943668
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E099943668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFRMHgBb2Dmz for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABF2B435FF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF2B435FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7B6D853BB; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:48:08 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5909f8eae3fd9ee4a04361a7ba9fffb4b5b524e6
X-Git-Newrev: 105ce13d2165a03ef821256d56f772fed8f301f1
X-Patchwork-Hint: ignore
Message-Id: <20240110095132.A7B6D853BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/ksmbd-tools:
 security bump to version 3.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=105ce13d2165a03ef821256d56f772fed8f301f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix potential NULL deference errors.

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.1
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66a77af985ee6e8be917abfe428fa381294115fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index 6f7064c6eb..c3e6ebefe5 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
+sha256  ab377b3044c48382303f3f7ec95f2e1a17592c774d70b2a11f32952099dbb214  ksmbd-tools-3.5.1.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c758c17bf2..c56c6e10bb 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.9
+KSMBD_TOOLS_VERSION = 3.5.1
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
