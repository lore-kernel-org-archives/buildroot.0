Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88CDC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B85E40C5F;
	Thu, 15 Aug 2024 17:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5MciEQidxmw; Thu, 15 Aug 2024 17:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F5A40C63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F5A40C63;
	Thu, 15 Aug 2024 17:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 895BA1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 7638240253
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id i_qjH0KzeteP for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.236;
 helo=out203-205-221-236.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 515B640243
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515B640243
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com
 [203.205.221.236])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 515B640243
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:38:33 +0000 (UTC)
Received: from localhost.localdomain ([106.120.7.242])
 by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
 id 78D2589A; Fri, 16 Aug 2024 01:30:13 +0800
X-QQ-mid: xmsmtpt1723743013t5vgohpjy
Message-ID: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
X-QQ-XMAILINFO: NDRJhlKLIrRLAnnNlzdZV3K36Kb6/KvwHwykjOmoRuW3iZvGhxjEpue42+7NHy
 0vFysdaJNlxrgGawCjxVDEvKxkD9M1O/orrfWA3vgEJov0XsFI7UQIdSjGRgiEVLp3ykJVn2+CuH
 El7iXEAIVKREW7GPufeJXT0DEYc8M9CVQssbDkWrDKDrpfp44AzP8X+kcUO+MVuAvsWwxNCs/8ba
 FrQ00tIuQ3HOb9OX7aVt+V1h68Qne5yjHLGtrNS8byI6PN/kw1BNTwI0x1ueaMjgirNWabOZgu1Q
 5wVSF3yaLOHLhQFK/i6KfUdBLNrkDa0AKVVCy8U2u8enjlRUCRlEfI82mEZLlDSTIGqz6zfrUK0M
 MxzGV2ICjxnmS8dUhUrDzM72Ng/sV/4rkcCxTt8p6AFZLKt89iQlv3Omkg800EoBNgruLz+4Y2wV
 G2dLOsSm2/nBcm+18oPwLhT+m/j33tV+FxGqdk5h+KplfNOymzRyP/AqMqc8TT2K+jnyHa2A9nru
 h+33H9qkDvzsBWeSvZmXRM9BskwpqCNiOcoenf7ZLcGQclwKLJlXiIcBxTTmz/P4mjW0AdjA+OOX
 M3mBQ5FSxS6GF2oIe+c2eC4LAF+Ejuh7MS41pGU7kbvpxcPnpGUIhVNvuZ8hvUAo3EhMKvU9zd7n
 8IEAOz1nlAInpvvghxuktqXRH7HegEqEGFQ9Eec0fTRN/qgQHSPd+sfHvur5eKScgQFLx/fzB+/E
 b60dB23nHFy5BXODDJ2izMWR5zzWpXmoHt71xB5ZnWI1kH0pWtqSZRchgRz7KXp+rDbuyaIIIPtC
 5lDOcoVQctiRKjYN3pmqwqE25NETzTwycpsTfOV3hNPs6WM0klEHh0bbwmH+7TppmNLxbEv7oS/4
 RjsDmx677TnoIcBXFKzDHTlPFyGFP9oh02/y8sUyH2P02xQNhopmr8xwyAze5HOYoeIMTqw2r4FI
 QQVzZp5J4hmJUQKcDaqxVm500610pDjNBOdaET1PA9FdAzEZsNENW+n5RTLPIIXLJm83sdFLM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 01:28:26 +0800
X-OQ-MSGID: <20240815172823.1250256-1-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723743511;
 bh=thVNqp8SJ1Z2bQT0fb3V8vu3cnMpnsx79Fl7zJfBvE4=;
 h=From:To:Cc:Subject:Date;
 b=HLs14ezvu1my1020lWP4FroyvA609Y4gO0FLrUTVQHGylfydn8dgqjSWmTOM7Kkox
 R7IgGlRhnsJQvoYCGv86C7jWNLK6pcJEuqeN2e/48YeMv/pNBzZY+fKH+0GAEwLTjS
 BZ/ZCql8xEL3KRxHDt5pK0AzzeN9AUBkl2DPdioI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=HLs14ezv
Subject: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix uboot
 partition size
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
Cc: Dong Wang <wangdong115@foxmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the wrongly calculated uboot partition size in
genimage.cfg. The size should be 1016K, which is
1MB (typical partition start) - 8K(offset dictated by the bootrom).

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---
 board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index ec78fd0e56..8d6bdd3295 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -7,7 +7,7 @@ image sdcard.img {
 		in-partition-table = false
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+		size = 1016K # 1MB - 8KB(offset)
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
