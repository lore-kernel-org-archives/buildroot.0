Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2589409EF;
	Wed, 26 Jan 2022 21:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWOBSFkH11tK; Wed, 26 Jan 2022 21:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D808540A14;
	Wed, 26 Jan 2022 21:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 969AC1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E3B83123
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MEufWa2_CmX for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:05:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D452983104
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:05:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7AB4181906; Wed, 26 Jan 2022 20:58:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:05:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd35a0578eeadaedf9b634086c9c979193aaa21f
X-Git-Newrev: 07a0d71657323d137bfb33e29311bff29ac58539
X-Patchwork-Hint: ignore
Message-Id: <20220126205832.7AB4181906@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=07a0d71657323d137bfb33e29311bff29ac58539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RK3399_ROCKPRO64 has been picked from pine64/rockpro64 but here we deal
with orangepi-rk3399, so let's change the label to RK3399_ORANGEPI.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
