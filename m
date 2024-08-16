Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D0AC531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B54F81B23;
	Fri, 16 Aug 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAWSdqAWPzGA; Fri, 16 Aug 2024 16:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E4081C38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E4081C38;
	Fri, 16 Aug 2024 16:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22EE51BF5A7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 1D16560E06
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id I2hlhg1_yvLM for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 16:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.239;
 helo=out203-205-221-239.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1E0B60651
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E0B60651
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com
 [203.205.221.239])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id F1E0B60651
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 16:25:43 +0000 (UTC)
Received: from localhost.localdomain ([106.120.7.242])
 by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
 id 6608C0BD; Sat, 17 Aug 2024 00:25:32 +0800
X-QQ-mid: xmsmtpt1723825532tvbd9unp0
Message-ID: <tencent_92439641515553684D208B3331676FB36C05@qq.com>
X-QQ-XMAILINFO: NoSKVpKsmOWeFohbQD/g3+0HxYmqNQ/09imv5B9tEjwwqi0OTnlW96ELAaLITW
 54qz1SGy63myu4BCMCI7VUcTlEmHrrYdUD5SNK5QXwxgc2rcevb3bK3+gi6J0xSBkKTs5SNYJaK5
 pEXylwEnmcWuCPWSAhkKDy+KiYUUPpTsOTmWDynlzg5ieihvGi+BNxe2/ovP7Ctfv0tAHzcUfcGL
 cP24EkN52+83vd9SGjPVzSLBtkoC/XL091tmAqefIJ3xfwA55AZ0263TWNYBsm85RcAzCfxfLKiP
 zGBWm7fOlpMd0wJb4DZzJl4BarCr0DIWZFI50aE5ZRiJzR0cRAGA/4dUmOFvqrzubQPq4ChQJAVJ
 hXBcZLv7ysVo4nEHartezc/hTooGyKbfRjX4Q2xiUHI5Lf2IrS2mXb1D6zqHaQMGSFsGvCmJrjL/
 ffYrqQZ8ugzfnvyCvl6pQeTJyBoCAic45R73CFSsSFdUArmsudBXht7raz0ygUudW8f8xeRS7YS4
 69jhqPp9fZ5KgLViDm0MV/w5b1Y8IYAmy6gx3ztfJDf2VuixT9BHXsrix0PTLy4jL5f/KSjOwq4y
 Eemz2bTVF2jqJV6tiNn9pRyW3ZfLYQJmrlFaeTNXehgHhpbwX9OOFd+oXDnr8DQS4auoLlZjtQS+
 f8DxAcYRwWDq8HICWG+lh+q1jgO6B0U6WeejJjIGxp96kJTq/G1IJumhpz1VvLmHpYU+mLZycM1H
 QKNRq6cBUq9tUCg0LuEx3Remp6pKpIHrdseIYkRfrk5CtnEzKdZrKEhVjK90XFKkq0BdYq3D2DdK
 1Q6SbxRNAFQrdXhL7u5lJHjS64XKEkcG1ijvfRv/QWnP8Ng8zpZFtW/UQpKOaddS7NRllglUkzEK
 8pv9O+/jC0vjDb/zUISoOw8O7KEFSp5RVioyb6tuHSA14DFe6ppYEdtlRDmy8TUAfx6Vv8SDuu0s
 gFPcZ+UrJuZEnnZWreC05eZ1C1B1P51J9YtddqG9U2FOMF/1Qk5lPmW8TpRemyRHijNbaV0unk7h
 IGzia4dqfqCDajpPJ/xZOq6lx54GOewc9ZkC77OkOKTIxoc7B1I6xqJK2jECA=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 00:07:56 +0800
X-OQ-MSGID: <20240816160753.64519-1-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723825535;
 bh=4F3iFZbXENeh5k1CuWKvoF1OhUFOA0DyluuAh2oOk+I=;
 h=From:To:Cc:Subject:Date;
 b=mk1KC9i5Z5D5Lqnj7TierODwwbTgEgty16w20EGdzwkzBE37GevWhoZmc3PuL/7aX
 sqqdOlV/sIqkffbx8/vpW8CSMiSRTInAf4SGKlFgmRBUwRJp8KnsMZr7gI9ROuG7Yq
 nnsf5HBk+/lLmjvC0EUGedmObKlnCoAT6MFUXMoM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=mk1KC9i5
Subject: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: refine
 genimage.cfg
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the offset argument for rootfs partiton so that it's
aligned to a 1MiB boundary, instead of using the size of the previous
u-boot partition to achieve this.

Genimage will make sure no partitions overlap. So we don't need a size
argument to limit the size of the u-boot image.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---

This one looks a little bit neater.

 board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index 8d6bdd3295..6d57dd9088 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -7,11 +7,11 @@ image sdcard.img {
 		in-partition-table = false
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1016K # 1MB - 8KB(offset)
 	}
 
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
+		offset = 1M
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
