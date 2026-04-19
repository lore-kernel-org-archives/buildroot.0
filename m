Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C08EA71AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C652E4103F;
	Sun, 19 Apr 2026 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8nEu5QhQ6g4; Sun, 19 Apr 2026 21:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B594102F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776635200;
	bh=q922sih7/9nf+uxUiXLDITJg33r1ycTcL8TUtmDxDQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FnJkehZWacqsXGlgqGazmGXlsxnxO/6nsOzsXP2bdb+ShP8luC4Qo6teGUNGySp1r
	 ihB/NUkfacT0+wddz93ZRBaWMrVQGwZtnp7rBMRBlZYiPuzGh6Y1uvtGOWYZQMuXzP
	 E8blzrJC2NrYrWBEbJBJG4cMXNTfl+t7i0rTCNH2qO/Rs/lRLw/EzDYYFCBMSHef5m
	 zKICE5M5W15oStaB/dWQ71F+FT2WFI4iG1pGf+2lEzGcY6o2bwpn9dn9V067cZOlxw
	 Kb0RIWyq3SnYOZbl/LPeR+XIy57rtQvwTDQWEEymgw1EyezNuXw4CJvAMOPQMO+BLK
	 tzC5Eca42zPTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B594102F;
	Sun, 19 Apr 2026 21:46:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D66B62B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC24E404A6
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhWbA5goxlps for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938334041C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 938334041C
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:46:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 486CE81F98; Sun, 19 Apr 2026 21:46:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 23:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf7c35d4f799cacc382633b01f9b934ea59af21a
X-Git-Newrev: a37d904419b1ab56c722c629184072709f54b499
X-Patchwork-Hint: ignore
Message-Id: <20260419214637.486CE81F98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: bump to 0.21.00
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a37d904419b1ab56c722c629184072709f54b499
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index f91aa76054..81123b3587 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe9e5161ac186c6ada22963251ff701fe3275fac2c5b87bdb59c4cab08aaeaae  stress-ng-0.20.00.tar.gz
+sha256  1339cbc6ccbff7e2ee2177bf0fd67e7b94e8ff7b07fe89bcfaec0280d800cf34  stress-ng-0.21.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 32ac21b540..4181c5ed1a 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.20.00
+STRESS_NG_VERSION = 0.21.00
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
