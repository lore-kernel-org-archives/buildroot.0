Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F20E9537E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C7E40C7C;
	Wed,  4 Feb 2026 11:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9Yqbw5A_O5y; Wed,  4 Feb 2026 11:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8287640BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203244;
	bh=knN1IMEA5vA88AyEUkxHOjC7JQmDf8X0xyNRHzjswtU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mrF6vstfVAl6GtKKh5VSQ0wa4a8vlBvaiVXBP5/oNG3hLW1RxwI/K/F1W7ldhajaB
	 2uI99vvC2hJ7LLdBL9I88JtkKHo4mdFsVXV6KV58f7HFCOMu0fGlLIxac+gz4p+iMd
	 IyKMAkEA2aig3CGpdEIPO6l3M2cPp0sa0rZSDTBB2Df6EFDj1BuorSMqjyX2h/suwj
	 MF7lShczo6aoKy2r5rkUiod6sltY9plMkrLCxbhsi6xjKXuZkMACLYdDmen6+WiV3x
	 l30CpCQPjE19oTf5LxDDcjWVnMtkImFwn5eWOOP2FeR+azuG3lV20ZRTX3XJxCMsOu
	 TZiPQeRP/BBSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8287640BD5;
	Wed,  4 Feb 2026 11:07:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E75D2F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C993360AA4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3Cp5HjADYRm for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38D760AA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F38D760AA0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7A7284598; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 12:03:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e55131778c46abceebadfbf1a3f57b7f61b7d3
X-Git-Newrev: 27fed8e7ba87671161c6ae9ab4aeb20533ede93d
X-Patchwork-Hint: ignore
Message-Id: <20260204110718.E7A7284598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] beaglev_fire: remove fdt set from boot
 script
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/27fed8e7ba87671161c6ae9ab4aeb20533ede93d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With the latest U-Boot update, U-Boot now handles this step in the
board setup removing the need to set this from a custom boot script.
Remove redundant fdt set command from boot script.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/beagleboard/beaglev_fire/boot.cmd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/beagleboard/beaglev_fire/boot.cmd b/board/beagleboard/beaglev_fire/boot.cmd
index 1402458d8b..80b44592c7 100644
--- a/board/beagleboard/beaglev_fire/boot.cmd
+++ b/board/beagleboard/beaglev_fire/boot.cmd
@@ -11,6 +11,5 @@ bootm loados ${scriptaddr};
 # Try to load a ramdisk if available inside fitImage
 bootm ramdisk;
 bootm prep;
-fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr0};
 run design_overlays;
 bootm go;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
