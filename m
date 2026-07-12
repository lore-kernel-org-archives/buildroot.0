Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E228C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803DC4093E;
	Sun, 12 Jul 2026 15:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyZ83_BSHlqM; Sun, 12 Jul 2026 15:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A6D40752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783869965;
	bh=+pj8R2QV0amohYA4MEXh1IbIu6wmHcKVSsEDfDekZXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ad79Etrv4dj1Fqq76zo4bAv0y0/qHVIEFxBYW9PjJNdUg525Bf3+qV1a//qKPjOES
	 0oAEEpp2uG/hJM6N16oxtCLrLDDlA9CWW5msTlD6TtY/dbtGPjL4O23ywu8uyOsmQu
	 7q/FrPH27v8oINdaXWsopttfHTkjcbzXW3VAmyyuNRTW6KtHNWdp1nXF4Wiu8zg7Kz
	 EQCxWnzxlqupJr3q+T5HkiTQz0/ZKmeNKLbA7LxDdl5TDjRqCcR/SKLa9uCI4wG9dE
	 HtAy1mG2RCBtEOO5Ll7Y86oKkYqVHHCG8k52w+QeJ0fEC/4Z128toTSD4+X0WsCCJh
	 t/wvyOBE14TtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A6D40752;
	Sun, 12 Jul 2026 15:26:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F24ED359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3D7E60643
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP08TaRfRd00 for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE48605EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CE48605EA
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:26:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61F468873B; Sun, 12 Jul 2026 15:25:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:47:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a01bc94fba8bb2d5e40274ce1563040e81470f03
X-Git-Newrev: cddb8e59e8be11255ded02cba376a59f7022b705
X-Patchwork-Hint: ignore
Message-Id: <20260712152529.61F468873B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ci20: bump Linux to 6.18.38 and
 U-Boot to 2026.07
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cddb8e59e8be11255ded02cba376a59f7022b705
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.18.38 and U-Boot to
version 2026.07.

Tested on ci20.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ci20_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index bb4863cb1d..4fd7d48c38 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -1,14 +1,14 @@
 BR2_mipsel=y
 BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
