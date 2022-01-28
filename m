Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710C2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FC784C15;
	Fri, 28 Jan 2022 11:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XYCaeA7oZFe; Fri, 28 Jan 2022 11:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B9284C10;
	Fri, 28 Jan 2022 11:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E70561BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E344141517
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Q_ulS1laPB7 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:05:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03CBA41504
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:05:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DP4anjjgTc6LXDP4anuiI9; Fri, 28 Jan 2022 12:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643367946; bh=OrkMd4YdttfTCkUkNcdQAJPkOjKndXqdmUi5HpBxZhk=;
 h=From:To:Subject:Date:MIME-Version;
 b=AzFt3CazE92GcN9idNCE95yqBmicB86OscdY6BNB2rPlnW39oRG+ZkNo8asC0MZEE
 0IUPCTDnoMmeey1BIplkUw+MkBwx7RXhqaJvFSIKZCcdjGYVvh2Ca5/0JfMxxLbfvW
 9MIidAOfsNB1QwudZC7eoTmtbyeiGo4HQ2jnjow4ZmLgp8O1Tl28RP0N1FXcZM3L2m
 lZ5qpUekvskeJWFlFWVhyRt7n0RHT1rua/goEw6+hQ4egrLph302VHt52lqNw+acQu
 oKCvQz05J0G3MEgkC0D3x56ys+6H1bjOf9o0EhoFs0a9IeapzkVKmJ6VQ/O4KZlgdX
 ZDur4DkGoLb2g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:05:40 +0100
Message-Id: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPjVGYSujVgPPbDQrgVzdxD2IPUDYZr3P1YFH8zAx5hS0iS0JU8VdTawB5cJNofezdHDdw3cODKHtpoA3UqP9mUViux2Mkun0Gp3xXIOEbVztTf62KLY
 ZAdnucxeuRlHdr56eMl+j/+IMcGj0vQbe4eITe+zrbVPN6Z/qf7GyF/40639Gu7u+l9i2xD9aVfJsnIhFeqZu+bLv2kIWFlCVbRFkQg6XxJMTBYKiSSEq3qN
 1S+LlomipzyuooMuXHCUjRJsBAvvk6nOPUjQI3+oJkapxOI1vy94BbZRrryTnkttgvk5TssnMpmxOF0Mg4td+YCZG+jovg4pjPpL6drxGsU6E/LSM3SmCZSL
 JxvWXODZ
Subject: [Buildroot] [PATCH] package/kf5/kf5-kcoreaddons: add missing
 comment dependency for binutils-bug-27597
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 02bd38e395..eef43101a2 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -13,3 +13,6 @@ config BR2_PACKAGE_KF5_KCOREADDONS
 	  on top of QtCore to perform various tasks.
 
 	  https://api.kde.org/frameworks/kcoreaddons/html/index.html
+
+comment "kf5-kcoreaddons needs a toolchain w/o bug 27597"
+	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
