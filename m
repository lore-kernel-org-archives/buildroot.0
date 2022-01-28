Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5183CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F36224163F;
	Fri, 28 Jan 2022 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2iR-k6aWnd4; Fri, 28 Jan 2022 21:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5936641CD4;
	Fri, 28 Jan 2022 21:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA2E31BF5DC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B888F84C9C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZlAQl2jdqgL for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE2784C75
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50E0F82B50; Fri, 28 Jan 2022 21:01:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:03:30 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e9c5056288c8d1214f421b2d1ce181211218a711
X-Git-Newrev: eebadec5d158bb53614c170486c53850cf6e4bad
X-Patchwork-Hint: ignore
Message-Id: <20220128210105.50E0F82B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 board/orangepi/orangepi-rk3399/extlinux.conf: fix label name
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eebadec5d158bb53614c170486c53850cf6e4bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

RK3399_ROCKPRO64 has been picked from pine64/rockpro64 but here we deal
with orangepi-rk3399, so let's change the label to RK3399_ORANGEPI.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07a0d71657323d137bfb33e29311bff29ac58539)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-rk3399/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-rk3399/extlinux.conf b/board/orangepi/orangepi-rk3399/extlinux.conf
index 5109625160..157c6a715e 100644
--- a/board/orangepi/orangepi-rk3399/extlinux.conf
+++ b/board/orangepi/orangepi-rk3399/extlinux.conf
@@ -1,4 +1,4 @@
-label RK3399_ROCKPRO64 linux
+label RK3399_ORANGEPI linux
   kernel /Image
   devicetree /rk3399-orangepi.dtb
   append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
