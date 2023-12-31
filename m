Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A36C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55EFF404A8;
	Sun, 31 Dec 2023 17:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55EFF404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHByL4117tZ2; Sun, 31 Dec 2023 17:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94DC1404D5;
	Sun, 31 Dec 2023 17:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DC1404D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E87C51BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF156810CC
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF156810CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1hYUvfcnh-E for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B841581063
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B841581063
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C31503535497; Sun, 31 Dec 2023 18:26:24 +0100 (CET)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 18:25:38 +0100
Message-Id: <20231231172538.1279608-7-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231231172538.1279608-1-wbx@openadk.org>
References: <20231231172538.1279608-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704043584; bh=0eIW5gSWhklEdzVM5pDDnoRM0QNPGX7VkBeY6qRM5MY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AgLMtKCuirGQvfe3fR+4YCZl7KdNfGeQlAD+T+Q9MGK0JLgOKAv7Q/oyhlIkkZc+F
 IUfXUU53+34P2ZuPAzh4ycKyt/rpZGCsL/AlAQf9gD1rNUd3lA4nm5WwmGdvBJNu12
 lKAkKO7SWSye62fUMp2+Y51sl2RHd6mSsHo4lLtuDaaGHcvObPjrDDM+LZ5iKhMLjw
 18p7r2RMRnu8781ILC1RmTD6VD2tiNFoufQ7dvbPq5B4mKBKFsYlTcQvPJADH0ZF2h
 kMG/RJ7h+SCracilBBuN/+/IMQm3P3wDlQqek9mX2GVvtDsimSmc8CFnGuz5Pi/Kby
 FWuVRcFdsHK3A==
Subject: [Buildroot] [PATCH 6/6] configs/snps_archs38_hsdk_defconfig: update
 kernel
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/snps_archs38_hsdk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 413ca5098c..0275d29d6e 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,7 +1,7 @@
 BR2_arcle=y
 BR2_archs38_full=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_PACKAGE_GLIBC_UTILS=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.69"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
