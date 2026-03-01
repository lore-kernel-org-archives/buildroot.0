Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481FDFD005C
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FAEA41C7A;
	Sun,  1 Mar 2026 11:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1BcieNHHYKZ; Sun,  1 Mar 2026 11:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B967A40BD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772363766;
	bh=S/VtcL3WzGvBhYWdwyNvrDlOpXGwz7XsMDJkndQr4G0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=deg0pa5Fj+LIt1WFCnzTLx/G1x8KhQ7zBtv6f63p/99VAQB4NN4bfxAHVEz7KKyxH
	 Req3+rnzuEZn4XFr9HwcFponpxKQSinq9Qp+5NyyFMWF3mn1is2c8mtp3K3elDhkwC
	 vFfRoUuRldow3E4JcmrTH10BfFv14mqZZUhaGJZ7+AURozBnpp79wb5+fvyE7EPccJ
	 pckbiQeHmmBDNM/SOxa9yTSvT6y+yhBwgDBwUGGrHII5FmERX38jNMD5K0nB6aJQQq
	 E2Ftn9F4g21w/d2MAl6/FzAGhnXD8axAy+2+ia3TIeh7nEJXXaX1wHgABqMj0/kbd3
	 zXj/covrj/iCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B967A40BD2;
	Sun,  1 Mar 2026 11:16:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 369D324E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283D3404EF
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHBQ61RpW9Lb for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 11:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4980240396
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4980240396
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:16:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AFFD85CBF; Sun,  1 Mar 2026 11:16:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 12:12:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a773d00904f9ae543c54b44ba02a2e8b0190adb8
X-Git-Newrev: 43a931ec5f4f565bbafcecf3b7d3833e99bb03a2
X-Patchwork-Hint: ignore
Message-Id: <20260301111604.3AFFD85CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/minicom: bump to
 version 2.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43a931ec5f4f565bbafcecf3b7d3833e99bb03a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Release Notes:
https://salsa.debian.org/minicom-team/minicom/-/releases/2.11.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 92a50d010c..8d5f646dd2 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538  minicom-2.10.tar.bz2
+sha256  87cf0da91af0531357cd61b8e1906b907edd2c9ef82f9ae74c277e1893d0f98c  minicom-2.11.1.tar.bz2
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 0c9b1ae434..c799fcd23a 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.10
+MINICOM_VERSION = 2.11.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.bz2
 MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
