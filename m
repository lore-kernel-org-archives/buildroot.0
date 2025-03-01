Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A70C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 21:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE4860B3F;
	Sat,  1 Mar 2025 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZEKmd973DeK; Sat,  1 Mar 2025 21:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38E060B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38E060B60;
	Sat,  1 Mar 2025 21:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC903181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABA0E829EE
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUD5GKLa8Yvr for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 21:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CECB082117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CECB082117
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CECB082117
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:50:11 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee] (unknown
 [IPv6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 2860ABFBA5
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 22:50:08 +0100 (CET)
Message-ID: <3a67dae1-96c3-4b65-86f5-5b4c1d7cc4b9@grenoble.cnrs.fr>
Date: Sat, 1 Mar 2025 22:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
Content-Language: en-US, fr
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1740865808;
 bh=j/s5Wx4DVLYzFOxF0YSXiBGUnMArrh8hQa/KHgdqHzs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=QXPRkf1FFjDXIY6hhNjlRIZhQXuSq4VpVpGTg6JcQPCdrnp/4DQpFkloUxG91BXhl
 j7RdCbYp8lRts2WywKDqSwN5cjqdYeQCJCq/Gi9aHGt3tTM6CA2/T99eV+QZ7Hllnb
 HRdAxNEnWFgd23gU/XoxAXFQoc++KljvaM5FHEDuLZB4sR6PvxC2/d5CYcF+9IEh0P
 alpC2DpDGtXZmlDQ9tHIvsadZ+bilKhIg7mau+6vlxuU9igNRf/V58RF62esvOlAnm
 2LTASRqT9PqOvTFYo0pwRYfajPAToTBzl7uIK6P+axhNFK4fzhg+YvQ2m5MaZNC5Kw
 eJR0XvAw0n/2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=QXPRkf1F
Subject: [Buildroot] [PATCH 2/2] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Note: resending because I forgot that the patches should be sent as
replies to the cover lettre.
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 4 ++--
 configs/acmesystems_acqua_a5_512mb_defconfig        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 4b20a009a7..9d677e0758 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  5c205cd34f80974e4973e321cb008f5f6895a8aa8c2577f06a9448cd77de63b3  linux-6.12.17.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 870c46c963..dc1437609d 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.17"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-sama5d3_acqua"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 7061a5e863..75f0c9364a 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.17"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-sama5d3_acqua"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
