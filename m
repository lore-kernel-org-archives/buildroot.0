Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB3CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F01180CC4;
	Fri,  6 Sep 2024 20:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKgCqH5usn3O; Fri,  6 Sep 2024 20:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1726080C61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1726080C61;
	Fri,  6 Sep 2024 20:11:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA991BF983
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06EC40B4F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNbRyo6v7t2U for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABAC408D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABAC408D6
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24D9E85FEB; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:42:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97d2040a30616cd34835bdcf85a1ee8b73574e48
X-Git-Newrev: f35edfe7f1aa6f2a235ba597f37c5138b7fd65b4
X-Patchwork-Hint: ignore
Message-Id: <20240906195901.24D9E85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ulpico: also install QCA9377
 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=f35edfe7f1aa6f2a235ba597f37c5138b7fd65b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of the imx6ulpico board come populated with QCA9377
Wifi chip instad of BRCM4339.

Also install the QCA9377 firmware so that Wifi can work by default
on the newer board revisions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6ulpico_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index a77eac5c58..f01ab19752 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -22,9 +22,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-pico-pi nxp/imx/imx6ul-pico-hob
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
-# wifi firmware for brcm4339
+# wifi firmware for brcm4339 and qca9377
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377=y
 
 # For automatic firmware loading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
