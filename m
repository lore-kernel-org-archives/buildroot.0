Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242BD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3A283196;
	Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EU9WUVmwEv5y; Wed,  7 Jan 2026 18:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E45383264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808966;
	bh=Z/Z2wYO/RX+eJ1jOjtzMo9DIjAPCrAN18TuALXRFow0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gjXR+CRARTUEx2YW10EgzHiJdj1gI3DUU65xS8JjUM1dPvhp2fqcJKPr0TV8mppLT
	 s2OJ/vunIDbzEAlYgMjA74OHopsCMvCLASVBGx0qneTIwOh2H3Jl7wAsMkrf/TZKOh
	 z4jWLrTInTH59Nr4j0UFaFL8J9J/ffmORAsRCvGZxTxdxqdt71i91iqWGtjZwWqccC
	 /5+nI55qS0UMRlbyhzgIyTXvsWLvYC56paTcrXNLhJJDi8xH3fEun/5r7Fm8ULKZJ1
	 90I6cwyRzdMqYfNbScrVqCEKOgRefPpIyPE++bx8F+PKSDHAVZnV1YcoOaY1M5Ln5r
	 jpWG2OcXO2Shg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E45383264;
	Wed,  7 Jan 2026 18:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13398A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EBA80FAC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt5zkkw184Mg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998B280C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 998B280C8D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98087873D4; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:35:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2853c71b319ad68082e2bdd4c38034faf1de0a9c
X-Git-Newrev: 8718e8be5ead0a4a3b53c5f3da21c079f501c281
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.98087873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rtl8822cs bump
 driver version to latest with support kernel 6.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8718e8be5ead0a4a3b53c5f3da21c079f501c281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Update rtl8822cs driver for Kernel 6.17/6.18
Fixes: https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe/

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 57395ccf91bc383770e7ba8e15cc3765c0a5fabd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 2a649fe493..ff2e5d3eaa 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
+sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index d10388c2e1..c6a541dd99 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
