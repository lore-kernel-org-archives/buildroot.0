Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D86BCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA5D60C0F;
	Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeGtMHQNRq3K; Fri,  5 Jun 2026 12:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61B160C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663162;
	bh=TE0U970YUmS5EN71WTa6d84c9BpMI6jRoa2JWqAsK5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IQdM2pw1M7KVJ1hC+2TltZKF1UrF8m9hx3Jwlri/syXBPokuYvHO46jrKXPIqoHP8
	 2YUGcqw1uyCxu8IOud1MNgEC7OI+xs5SiLEPMF9Krw4vC4d9x1wKdeRV83RVcAk7Gw
	 +W2IwNG37ZPULtJk6R9dob0J1GSL0JZlObHtH4x6vBD5wSIXO6Zrn6s0jgBGznNrEo
	 jmn31a1D75Yqboe4PFIpQMDB/qrbaogk5RmDYLCd6sDk/Qu4XoRGRvUrzNPh31QxAZ
	 jdD4Job/Us2alaaNaqR8BdWCQNFph08cIu7J8VPGZhkRJFm8W3u9H7eaWBGOIzhKTE
	 e+UAU81IDHttQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61B160C29;
	Fri,  5 Jun 2026 12:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BC0388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1985D41021
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KANDB4MT0fuI for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48D741017
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E48D741017
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19BA587B39; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:03:55 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: df418f0675f9da16fc5f88377be2084465813b2a
X-Git-Newrev: ed86091d62f5eb96abcc1f237f363f407829ce40
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.19BA587B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/cve-check: add indication how to run
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed86091d62f5eb96abcc1f237f363f407829ce40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Always run this script from the output of 'generate-cyclonedx'. Do not re-run
this script over an already analysed SBOM.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 646356162b321df8bf20f622c98e0b8495ed86fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 5047523ade..0d0ad833a2 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -29,6 +29,9 @@ database.
 
 The NVD database is cloned using a mirror of it and the content is compared
 locally.
+
+Always run this script from the output of 'generate-cyclonedx'. Do not re-run
+this script over an already analysed SBOM.
 """
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
