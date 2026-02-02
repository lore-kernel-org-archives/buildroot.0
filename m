Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E19E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F79C60662;
	Mon,  2 Feb 2026 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvukQ6BiPddj; Mon,  2 Feb 2026 17:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225CD6076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054408;
	bh=9hq+iQ/PnEJfjENGrHfnsCHveq98tME74jOtqbCZJVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q7kjNr8H53mIaXy4j9vVssIoEjtIAOI5aokH4UFPNmTvTKOTUAyqxbLcmPEvxZ71Q
	 PkXo577n/Gp8g0SQ28XVX0U4pcM2xdSKVkcb/5kDSuSbnUep20u5X0EFtAudj5U/kQ
	 wUBDfSz7uOSoK97aak5Q+KCKYU75cZWb+2omsckxwBq4rYimBwk9D6ZSufqsjCBAlc
	 K14P5vc1K9xdnzJ83wBvdVkz4DDz7izouOrPH/1Vpxqs6YXLXVrV0KFBbpqpCqbyWU
	 178u+uvWH/cIjSl9cC+GG0ANaD3AShQCaQL6bE4hS785BP5ksFftyovuxoND3kKCbf
	 MABmbQ7d7qz2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225CD6076C;
	Mon,  2 Feb 2026 17:46:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0BF23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B6304034E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZWqPL6xMJXz for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4671940190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4671940190
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 280238645E; Mon,  2 Feb 2026 17:46:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:46:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba
X-Git-Newrev: 12472fe6fff968b8fb17ad7c1c166706c696479d
X-Patchwork-Hint: ignore
Message-Id: <20260202174645.280238645E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91bootstrap3: fix help of
 BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12472fe6fff968b8fb17ad7c1c166706c696479d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
