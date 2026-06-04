Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C74CD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E025460AD0;
	Fri,  5 Jun 2026 12:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIA6vYIQn-Ch; Fri,  5 Jun 2026 12:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE25160B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663099;
	bh=mOAOj3Zbr74xlBRJvK8hkAegitVY6UCO3Fbn6FERiBY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ofH6pS0dzpN03oOTrwk7V4sLrEoCtaM76ABuI9NL+GF1B1znjaw2a1hvI2ueL0Th3
	 hzNXJRbpHFew7nN6NrSTCrO1tOaDg1dhrEtto7rhjSEPsd/maTi+hatBe+s3gn5Zxv
	 u0GT4uftjTmrK0nw2oSb6Z1XJqx2cY/UWW1n+H7cXckjGBGvG2tK4mVppwBLHf4Boo
	 yhd7+/XCz5/3DTztiXMUrRwsA5jVXrbeTE8YNVCccYySQdxGuR0Xdi3WNmRkwdu28J
	 dltMTYV1t00+UteS/TFWf35q1Mg3SIm0ww0/hRN6ygdb+6D2uGiule4i8aeYxrXamE
	 HCebM+qUA6vNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE25160B09;
	Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE15F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255DF81E50
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUj3hyv-lFBz for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F369D81E5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F369D81E5A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2923587B3F; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:03:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5e59db94430713a64ee16c6c4859fa05c1abb450
X-Git-Newrev: 4835cac7891c96524c7d21434c14c1995f98d360
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.2923587B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4835cac7891c96524c7d21434c14c1995f98d360
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
