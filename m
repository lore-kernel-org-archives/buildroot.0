Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A3EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DEA84770;
	Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SobvDy8Dd6HK; Fri, 13 Feb 2026 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CC484763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011485;
	bh=ox82KS1dgC7nljzjNEX0aCplSRAlEzmXDQi4DzWDWDs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cST/gG0p+aNgQEAM0VyKtPi5Vvf2coPOjm4//n1K64eOdl7BVL4Ch9/CCXIcVKykN
	 iuLcq7XxGgAcX2vKvpXH5vbbCkYWZu00L3WIcqiwAKozxyt3kf/A0ti/Bhy2dW46TR
	 s/tr7o3yHDojbzeZjlS7LiBSBUopM7VXuCeOeR5tLxRAK9ma7X9SUAO+cPN4uqjs+K
	 88hQMNI090QYTV/Q5bmP0oAqiWYTrnBStrNbPEfOswoqWNbqwow5cOiiPUAh/PZRRM
	 pSRUhTquh5cQVt2LZxiFZRSqyy0lTsYElVuMnSB6uVUV2CpSx4Zud3CP+qY7FzRyak
	 ow6lvk/N0px3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CC484763;
	Fri, 13 Feb 2026 19:38:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7A3769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDFD2413DB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH-79Tk6EGRj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29196412D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29196412D6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E55F7FA14; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:31:19 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: dfa22b574f346ed481728e1a5b9c5b2bf9c7e07c
X-Git-Newrev: bf3867231e97c4c034b4fff192e7bdff9e1763bf
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.1E55F7FA14@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] boot/at91bootstrap3: fix
 help of BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf3867231e97c4c034b4fff192e7bdff9e1763bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 12472fe6fff968b8fb17ad7c1c166706c696479d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b2f3e4e9b1..83d3a02121 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -74,7 +74,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
 	default "LICENSES/MIT.txt"
 	help
 	  A space-separated list of license files related to the
-	  AT91Bootstrap3 kernel package.
+	  AT91Bootstrap3 package.
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
