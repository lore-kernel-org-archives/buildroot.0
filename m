Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54945E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA854093D;
	Sat, 20 Dec 2025 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7u1Bi8iKGLji; Sat, 20 Dec 2025 18:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5CC40908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766257035;
	bh=ufGXx3lLMcDiuu86DO5LlRKdgJvGon72BlIobioHZLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lrkPDnrdrWFTzY10AIL3cpY/JXeokq/MAImaayOBlZmaCHProrfEoyS6aO+NJTJh1
	 6mndihcy0FGaMfHjJCAc16cZ8pc1n7xUuMFX3ZH9JMl97laVAaUWffsUIGgYuO4dIN
	 M5fGsyiXMqU2sLLsDKTQBjKaA5czssBsgSP9h/eiLxk59VD3md75StQTFwWIMw98el
	 WU27NAMYCXE6Q1Nx56YUPb4aDL7132BDrICXFx3sfGHWG48v8vB4Qt8v6VNkTwAe6L
	 A0y790Lyfrhd3PoEc36u2ICOeyQmpDP5vhWV/pn3wBF+IGBnloz2LH0pA8nb42ehIr
	 9yLYTLkQ3YjEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5CC40908;
	Sat, 20 Dec 2025 18:57:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F3C23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01296400F5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgP4vTv3lgiW for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0463040022
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0463040022
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01C0C87538; Sat, 20 Dec 2025 18:57:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 19:55:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f
X-Git-Newrev: 89b94252603ba10872e2ff65124caf7fb95dcf60
X-Patchwork-Hint: ignore
Message-Id: <20251220185712.01C0C87538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=89b94252603ba10872e2ff65124caf7fb95dcf60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update the device tree: since Linux v6.15-rc1 (510a6190cf5e "ARM:
dts: microchip: fix faulty ohci/ehci node names"), the USB nodes are
named "usb" instead of "ohci" or "ehci".

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
[Julien: update linux.hash comment to take hash from upstream]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts | 4 ++--
 board/acmesystems/acqua-a5/patches/linux/linux.hash             | 4 ++--
 configs/acmesystems_acqua_a5_256mb_defconfig                    | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig                    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 60be8a67cd..4754c3cf1c 100644
--- a/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -281,11 +281,11 @@
             status = "disabled";
         };
 
-        usb1: ohci@600000 {
+        usb1: usb@600000 {
             status = "okay";
         };
 
-        usb2: ehci@700000 {
+        usb2: usb@700000 {
             status = "okay";
         };
 		
diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 2c86a53263..427bcedae7 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f693ad9baf..74ce958cd3 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 3e243cd45e..d3912659db 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
