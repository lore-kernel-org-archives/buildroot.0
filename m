Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06910ED64D
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D8E612C1;
	Fri, 27 Mar 2026 09:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqhBbvFzsKHy; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B20F612A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605560;
	bh=IbItr0+M9tOfFAtbPdeFqVdrpw06/8NW9B4Fjuuzasg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R7rtMCVSuHPmLuRGKp6RHBI1ilY36iXDCSjeO7lJ2dKcEkPCr+C1ywS3Ir4PKQhJ2
	 /oe245TIy7IDZajRaFwgFblyMX8Y1kGtWlF9GNcB4BPvFVSQ0+CMKe6jGOl/Kct4fm
	 VNLnhkrBdMSibKsEnkhlfGryXY/FgnZskdmrIXohcNsX56Ulk1mFp4m1jZjzN3oEBe
	 RQ8EDIIBK/TxHqaOWuYi0gFxNb9BzoRQGMVYCjA3xJgAwenFUMv8bJifqdJN3oj+ex
	 BdsDxBYSWtSiDHYUlT8vcA2Bj9tsjapBqyY1xb53Ltv/+5Sujl1oC2mx7QmU7BN1MS
	 s6H+ZMlhJsIng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B20F612A8;
	Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4456A353
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3647583D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuKRJGW_6HUS for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB4B83D7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB4B83D7F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B283B7FB6C; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2a441430a747fdbd4bfcfb643657280bba4d282
X-Git-Newrev: 5fb844a9d19930a198d13882c187d100adeeb611
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.B283B7FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpd: enforce tcp
 for options using http
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fb844a9d19930a198d13882c187d100adeeb611
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Prevent disabling of TCP if some option is selected that uses HTTP.

Fixes:
https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ee324c5babe52ec24ee1569557b2be3509bf2830)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 03ceaa1e00..df19281fc8 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -220,6 +220,7 @@ config BR2_PACKAGE_MPD_CDIO_PARANOIA
 
 config BR2_PACKAGE_MPD_CURL
 	bool "curl"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Enable curl streaming (http) support.
@@ -274,6 +275,7 @@ config BR2_PACKAGE_MPD_AO
 
 config BR2_PACKAGE_MPD_HTTPD_OUTPUT
 	bool "httpd output"
+	select BR2_PACKAGE_MPD_TCP
 	help
 	  Enable httpd output support.
 
@@ -357,6 +359,7 @@ comment "io_uring support needs a toolchain w/ headers >= 5.1"
 
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBMPDCLIENT
 	help
 	  Enable libmpdclient support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
