Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4D3C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25C9414B6;
	Thu, 10 Aug 2023 22:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25C9414B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0LCZ5idsoC8; Thu, 10 Aug 2023 22:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B0F40A70;
	Thu, 10 Aug 2023 22:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B0F40A70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB221BF4DB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7390C40A70
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7390C40A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxbKnXl_fN5G for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:01:55 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98962400DC
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98962400DC
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UDj5q0O7AXI7yUDj5qsdYf; Fri, 11 Aug 2023 00:01:52 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 00:01:46 +0200
Message-Id: <20230810220146.11261-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808231421.7f94494d@windsurf>
References: <20230808231421.7f94494d@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGKwqx5HzN0Pm4vi7HxtSLNS4LmM+UrkOrXNRYVnaVleVAJFRXDgrIIPHcmFUsPgKj9OvfmTaQqbRf9JVPTnb1vKkJ71Scslgwan3bxRv53uGg8u0ylz
 IcaPSrYRJXq4GD7TYONulMQ/+jJu1EnyXNfRo2AJK0TINDEyxLi1K2dlOoZursa0hAbbh+NEPY2n8SrLffpO291uXpS/DBoyjct6DBZ8r7l25FQq4CHSrneK
 9t5tqkSTk8S9/A0x7cSo17gNVejMm+JG+v7gN+thC+4fnVEtV1vmLH8p2VjOX4A+29kTYThjNHYf43DvjcD0Ww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691704912; bh=V8+HjDfEdV2+ImwDOqAXguZIUlqjN+qAelW4uq1YU+k=;
 h=From:To:Subject:Date:MIME-Version;
 b=h9i3s0mZZhvVwFykDOO2mXochlHGZ+ADVeGqLHEOilfdnaBdrnP17ztjwLq3a1hcK
 7VyuSuvoZM2xfrC0j4FH8nQtS3usoMdDYqNM/cMeexPbi7MhEr09ijK9cwHwRhNpD8
 ieaSvIDHPUHRAUGr1lR46m3ZF0eFli7TjNJltUXF1krW2BPM1/0K+iv7Pglx7j3hAm
 Af+2FSswX+zyFzImb/c2wKXAs06y9JBMthPCOqJrw4u9dQJZCWAF+7NXUDaA+UHcl2
 nPtacWjMrhu1ZbeOVpLjlBIMIfHxTCuYN0YL4HESKNbG0VWze71v4fePpXN7ATe+O6
 78gOegK2vIV6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h9i3s0mZ
Subject: [Buildroot] [PATCH] configs/asus_tinker_rk3288_defconfig: switch to
 zImage and bump Linux to 6.1.44, U-Boot to 2023.07
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uImage is almost deprecated so let's switch to zImage. Let's also bump
Linux version to 6.1.44, U-Boot to 2023.07 and remove
BR2_TARGET_UBOOT_NEEDS_PYTHON3 since it's selected by
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/asus_tinker_rk3288_defconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 40f4125880..b3e4502a45 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -10,10 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
@@ -23,10 +22,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
