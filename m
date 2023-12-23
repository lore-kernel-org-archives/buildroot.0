Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F27C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 12:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECA04400CE;
	Sat, 23 Dec 2023 12:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA04400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Oh1bo9K5TLR; Sat, 23 Dec 2023 12:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0043404C9;
	Sat, 23 Dec 2023 12:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0043404C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743E51BF2A9
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC23821F3
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC23821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IWHC_MT0QB1 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 12:47:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EC0580C3F
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 12:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC0580C3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BFDB87CE6; Sat, 23 Dec 2023 12:47:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 13:45:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32da4422f9d2a7cdd66cde4404f7dc5d61841c3e
X-Git-Newrev: e0c8c162597733282f692bb1712ef3e5ff9b30fe
X-Patchwork-Hint: ignore
Message-Id: <20231223124744.8BFDB87CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] iputils/iputils: remove note about fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0c8c162597733282f692bb1712ef3e5ff9b30fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After 10 years we don't have to justify the fork anymore, as it has been
the new upstream for that long now.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iputils/iputils.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 783ed9a0e7..a8f93488bb 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,13 +4,6 @@
 #
 ################################################################################
 
-# The original upstream was forked to the github repository in 2014 to
-# pull fixes from other distribution and centralize the changes after
-# the upstream seemed to have gone dormant.  The fork contains the
-# latest changes including musl support, removing a libsysfs dependency
-# and IPv6 updates.
-# http://www.spinics.net/lists/netdev/msg279881.html
-
 IPUTILS_VERSION = 20231222
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
