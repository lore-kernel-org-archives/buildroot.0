Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC2FC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C90822C6;
	Mon,  6 May 2024 20:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApS1r1VZ7ThI; Mon,  6 May 2024 20:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A4A8234C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A4A8234C;
	Mon,  6 May 2024 20:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC911BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DA5414A0
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxdkKLdiOcHL for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E6E414B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E6E414B9
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:06:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5DC7868B6; Mon,  6 May 2024 20:06:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:04:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff2c03287302213968e00b54e5b7a4e79238fcb
X-Git-Newrev: ae6d1f7375534351440b2b151721cb9eb8d5bca8
X-Patchwork-Hint: ignore
Message-Id: <20240506200643.C5DC7868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-boot-firmware: bump to version
 09.02.00.009
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae6d1f7375534351440b2b151721cb9eb8d5bca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 09.02.00.009 release of ti-linux-firmware has the latest updates to
TI's TIFS, DM and DMSC firmware needed for the K3 generation of
processors. Update to pull in these latest updates.

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 95131180ef..2398d02da2 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
+sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 1f8ade207c..9332732ad4 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
-# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
-TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
