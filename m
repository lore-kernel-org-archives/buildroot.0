Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3E860D4F;
	Fri, 28 Jan 2022 21:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvsUoTlL5NDF; Fri, 28 Jan 2022 21:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA0860C0B;
	Fri, 28 Jan 2022 21:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB1ED1BF5DC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9BD9402E8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8_1CnfuuJnU for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1679A402A1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4742282B50; Fri, 28 Jan 2022 21:01:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:03:18 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 19bfe48a265e8dea3a2f18b24a70435470c48d08
X-Git-Newrev: 050acd180c5a256e2f8632a308ccb1ba687cda45
X-Patchwork-Hint: ignore
Message-Id: <20220128210100.4742282B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=050acd180c5a256e2f8632a308ccb1ba687cda45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
