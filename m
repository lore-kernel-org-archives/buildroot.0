Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C260C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 16:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78057813FA;
	Sun,  2 Jan 2022 16:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJBy9GdW4kyh; Sun,  2 Jan 2022 16:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47A881461;
	Sun,  2 Jan 2022 16:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E50341BF3FC
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B78401B7
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yb4Rl01X06cI for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 16:59:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C061401B5
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 16:59:13 +0000 (UTC)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.244.92.231]) by smtp-32.iol.local with ESMTPA
 id 44CMndfRO7xUJ44CMnjJcO; Sun, 02 Jan 2022 17:59:10 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1641142750; bh=voR1hFtEKwhsZJ0SvqXrYiorPcYY7zANo/IwerWu0MA=;
 h=From;
 b=dUgtCVywSj5XHwjs6u3MoO1MwExj28S1kDUGFM1s3vvi4/89NZ9uEl1MBQinvkSXC
 jvsTpOBigZrgYUpaGHklAdQ5Ph3fLh8O00pga/fTFjIyxYMspdBvjUwkogTIXRdqqx
 VAGqMrV8GuX7SQo2ztzthyZL9gHNvpgnWjJfl2Q/USH22ifTE8MTUg25mvKNgTWrRc
 /1OCzfiznQr0snoSVJtFjLXhrlZmMkZfTla5Swb2Ef8zC5VDGqgJxTyjBjYDsVW6lq
 5v/9ifm7vIMaHkE5F5H6roGZ2rsrDDQku17R4JYKAZfXYyCx5kt4/uW2UU21ihIy5c
 vI/ml+COgg7rQ==
X-CNFS-Analysis: v=2.4 cv=cLAlDnSN c=1 sm=1 tr=0 ts=61d1d9de cx=a_exe
 a=9deUd2gvNmZYn0kptk1X4w==:117 a=9deUd2gvNmZYn0kptk1X4w==:17
 a=FXjyczMD9opS754iHDYA:9
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 17:58:48 +0100
Message-Id: <20220102165849.1653228-1-dariobin@libero.it>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIvSCBLUPoTqMNM5mDyE8CvMvw1dg1GMG454WWGUHpVnRjsdM4jJFdLcIzfoyGMFrWVW3NsR/xjWNqXa5tX3naCxQlHuUGZ4Lex1Eq46MvWQrBWQ9msh
 zNiq8BZUjSYubuWJ8c2zWYuxzSPS3oNNtprjKwi09hdNqiwCXeHR7UPbdPvWJmd6MKoZ5YCHVwiia3uCaY2cTpxpvJFVfdH7IL4cqenG19GGUkbL/uPVqHSL
 7OvqQ0Wzmjm+1CTVakTmStOQ9Xi6nWUS+0a98rcObZZuSwcoa7h6c9U21UwmNOliPd4BCVmPmRMX5q/edSyCjnhCPwMweK/HuqcBti4O8fI=
Subject: [Buildroot] [PATCH 1/2] configs/stm32f469_disco_xip: remove
 BR2_LINUX_KERNEL_XZ
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a XIP kernel, so it shouldn't be compressed.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 configs/stm32f469_disco_xip_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index f3d333278a53..6c4f227f582d 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -7,7 +7,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_XZ=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
