Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A1DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7272D81419;
	Sun,  2 Jan 2022 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENRXnnY1Wz-x; Sun,  2 Jan 2022 16:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2901813FA;
	Sun,  2 Jan 2022 16:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1CFE1BF28F
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFF84813FA
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1RlcPhIAo1c for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 16:59:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B528813F4
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 16:59:13 +0000 (UTC)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.244.92.231]) by smtp-32.iol.local with ESMTPA
 id 44CMndfRO7xUJ44CMnjJca; Sun, 02 Jan 2022 17:59:10 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1641142750; bh=rmokAWmJKXKrz+CUD1c7XNTHCUX5Z3+HqswhLz8j6Js=;
 h=From;
 b=jcMz/R3dYniIE0mwzaQpca7MQDzyTrvy5AmlrtW49AcTB4FoQieQHHFm9ONrfm6+W
 U8DBwjvOxdq1sclS/3xLcYv2ZR5bpNmduG/25RAWSOl/4WKKh3tK24cNTWov/zxMEF
 z3p9tCMVmRV2aYniO21Fepqp8uO3D0tj5WeReVnmWDGh8gkDxee8mdTb5GenfYMYH8
 I1BEpEbzvYMdzVnlTtnSVVT8JD8nuB0wWlNBUOZMhcU5ABK7m7jebjnKprSe98StXB
 N0mEXlMggG/qP+n5VKx/+JWZVZRs4xaTSzslemNX/HX5goFVDZkwDf8dF0pK62Ks9q
 e4FZNeNpfKnEA==
X-CNFS-Analysis: v=2.4 cv=cLAlDnSN c=1 sm=1 tr=0 ts=61d1d9de cx=a_exe
 a=9deUd2gvNmZYn0kptk1X4w==:117 a=9deUd2gvNmZYn0kptk1X4w==:17
 a=wxuGSOuLWNGsfMj8k8YA:9
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 17:58:49 +0100
Message-Id: <20220102165849.1653228-2-dariobin@libero.it>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220102165849.1653228-1-dariobin@libero.it>
References: <20220102165849.1653228-1-dariobin@libero.it>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIvSCBLUPoTqMNM5mDyE8CvMvw1dg1GMG454WWGUHpVnRjsdM4jJFdLcIzfoyGMFrWVW3NsR/xjWNqXa5tX3naCxQlHuUGZ4Lex1Eq46MvWQrBWQ9msh
 zNiq8BZUjSYubuWJ8c2zWYuxzSPS3oNNtprjKwi09hdNqiwCXeHR7UPbdPvWJmd6MKoZ5YCHVwiia3uCaY2cTpxpvJFVfdH7IL4cqenG19GGUkbL/uPVqHSL
 7OvqQ0Wzmjm+1CTVakTmStOQ9Xi6nWUS+0a98rcObZZuSwcoa7h6c9U21UwmNOliPd4BCVmPmRMX5q/edSyCjnhCPwMweK/HuqcBti4O8fI=
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469_disco_xip: explicitly set
 the kernel version
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

The version of the kernel and its headers must be explicitly set because
if you keep the default setting, the kernel is continuously updated in
buildroot with the risk that its image + dtb grow so much that it again
exceeds the 2 MByte of the flash module.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 configs/stm32f469_disco_xip_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 6c4f227f582d..d95b7759f31a 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,9 +1,12 @@
 BR2_arm=y
 BR2_cortex_m4=y
+BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_GCC_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
