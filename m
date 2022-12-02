Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E26C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 03:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BCED81346;
	Fri,  2 Dec 2022 03:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCED81346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eFz1Xekkaor; Fri,  2 Dec 2022 03:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72224812FE;
	Fri,  2 Dec 2022 03:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72224812FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C93741BF95D
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 03:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B15B3812BF
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 03:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B15B3812BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tH5_7IC54qmT for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 03:48:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058E581284
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [20.232.28.96]) by smtp1.osuosl.org (Postfix) with SMTP id 058E581284
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 03:48:49 +0000 (UTC)
Received: from E0005128LT.eswin.cn (unknown [10.12.98.229])
 by app2 (Coremail) with SMTP id EggMCgC3iC2bdYljV+IUAA--.28394S5;
 Fri, 02 Dec 2022 11:48:44 +0800 (CST)
From: Zikui Zhao <zhaozikui@eswincomputing.com>
To: buildroot@buildroot.org
Date: Fri,  2 Dec 2022 11:48:41 +0800
Message-Id: <20221202034841.1172-2-zhaozikui@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20221202034841.1172-1-zhaozikui@eswincomputing.com>
References: <20221202034841.1172-1-zhaozikui@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: EggMCgC3iC2bdYljV+IUAA--.28394S5
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1kGF1UGFWDtw48WrWxZwb_yoW3trg_Aa
 yxXFn5WrZ8Ar17tF4Ska1xuFy09w4xCw1DZF13t3y8Zas5Kw1DJF9rKrZ0kr15CFyfAFyr
 Kwn8Wr4UJanrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbqkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
 0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUq
 Ap5UUUUU=
X-CM-SenderInfo: p2kd06plnxxqphvzx0xfrp13pwlqwhhfrp/
Subject: [Buildroot] [PATCH v2 1/1] docs/manual: fixed some spelling mistakes
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
Cc: jinyanjiang@eswincomputing.com, zhengyu@eswincomputing.com,
 zhuwenjun@eswincomputing.com, Zikui Zhao <zhaozikui@eswincomputing.com>,
 zhangdongdong@eswincomputing.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed some spelling mistakes of countable nouns.

Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/customize-directory-structure.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index a3a7ad4cb9..1249421da2 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -27,10 +27,10 @@ to you.
 |           +-- post_image.sh
 |           +-- rootfs_overlay/
 |           |   +-- etc/
-|           |   +-- <some file>
+|           |   +-- <some files>
 |           +-- patches/
 |               +-- foo/
-|               |   +-- <some patch>
+|               |   +-- <some patches>
 |               +-- libbar/
 |                   +-- <some other patches>
 |
-- 
2.31.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
