Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2497FC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DFF961026;
	Wed, 10 Jul 2024 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnV_jC-cfwTA; Wed, 10 Jul 2024 21:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECDE6106A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECDE6106A;
	Wed, 10 Jul 2024 21:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 218141BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E73941306
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofKDAsvCkyhF for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0D141305
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0D141305
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:29:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0849847B6; Wed, 10 Jul 2024 21:29:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:26:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc9c09d18944c14b3544279adb72634128e9d004
X-Git-Newrev: 3da51c91802d4ff5f071ae92c3bec8eae03802e2
X-Patchwork-Hint: ignore
Message-Id: <20240710212911.D0849847B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am62x-sk: update custom hashes
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
Content-Type: multipart/mixed; boundary="===============5098379700448735169=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5098379700448735169==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3da51c91802d4ff5f071ae92c3bec8eae03802e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
cc2910a7dbd331ae0ad6a8f06ce7cd0559a1ebe1 ("configs/ti_am62x_sk_defconfig:
update U-Boot to v2024.04") updated U-Boot and the ti-k3-r5-loader to
2024.04, but did not update the hash files in board/ti/am62x-sk/. It
ended up working for now, because the official versions of boot/uboot
and boot/ti-k3-r5-loader/ also use 2024.04 and therefore have this
hash, but it would have started failing as soon as boot/uboot and/or
boot/ti-k3-r5-loader official version were updated.

Signed-off-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash        | 4 ++--
 board/ti/am62x-sk/patches/uboot/uboot.hash                            | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8f60864fbf..7494e04ead 100644
--- a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
-# Locally computed:
+# Locally calculated
 sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 0e171c56f5..97a2b4eaf9 100644
--- a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 0e171c56f5..97a2b4eaf9 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2

--===============5098379700448735169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5098379700448735169==--
