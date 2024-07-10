Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FC3C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8703760F12;
	Wed, 10 Jul 2024 21:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwxS5WRY-YsE; Wed, 10 Jul 2024 21:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5D561026
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A5D561026;
	Wed, 10 Jul 2024 21:29:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE5FD1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E874F40142
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0Dwk38zwOdn for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094EB40126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 094EB40126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4E7C846EC; Wed, 10 Jul 2024 21:29:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:28:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da51c91802d4ff5f071ae92c3bec8eae03802e2
X-Git-Newrev: 5654eca137b19e904391cf6e2745c980f6260760
X-Patchwork-Hint: ignore
Message-Id: <20240710212911.E4E7C846EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am64x-sk: update custom hashes
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
Content-Type: multipart/mixed; boundary="===============2939965538104593319=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2939965538104593319==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5654eca137b19e904391cf6e2745c980f6260760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
7efd75867cd84926b7aa6524e0a41c50c32b20e1 ("configs/ti_am64x_sk_defconfig:
update U-Boot to v2024.04") updated U-Boot and the ti-k3-r5-loader to
2024.04, but did not update the hash files in board/ti/am62x-sk/. It
ended up working for now, because the official versions of boot/uboot
and boot/ti-k3-r5-loader/ also use 2024.04 and therefore have this
hash, but it would have started failing as soon as boot/uboot and/or
boot/ti-k3-r5-loader official version were updated.

Signed-off-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash        | 3 ++-
 board/ti/am64x-sk/patches/uboot/uboot.hash                            | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8f60864fbf..7494e04ead 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
-# Locally computed:
+# Locally calculated
 sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index dbb4428738..97a2b4eaf9 100644
--- a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1 +1,2 @@
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
index 0e171c56f5..97a2b4eaf9 100644
--- a/board/ti/am64x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2

--===============2939965538104593319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2939965538104593319==--
