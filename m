Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD85C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D735560EE5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D735560EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A143240160;
	Sun, 17 Oct 2021 20:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pocrmLON7Fr; Sun, 17 Oct 2021 20:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFAFD4017C;
	Sun, 17 Oct 2021 20:15:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E55C1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 587C4606E7
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEDa0f5a2xYl for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B04606DA
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 806BA822C3; Sun, 17 Oct 2021 20:12:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 22:12:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 689b9ac439ab7b507c8982b6102bddf59d03efbf
X-Git-Newrev: b900a6335737a95199af05744b6dd5d68800b486
X-Patchwork-Hint: ignore
Message-Id: <20211017201216.806BA822C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: add option for the
 debug set of start/fixup boot files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b900a6335737a95199af05744b6dd5d68800b486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option for the debug set of start/fixup boot files.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 9e401829c6..f9fc0b0e5e 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
 	  The cut-down set of files for versions Zero/1/2/3 (only
 	  features required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
+	bool "rpi 0/1/2/3 (debug)"
+	help
+	  The debug set of files for versions Zero/1/2/3.
+
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	bool "rpi 4 (default)"
 	help
@@ -53,6 +58,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
 	  The cut-down set of files for versions 4 (only features
 	  required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
+	bool "rpi 4 (debug)"
+	help
+	  The debug set of files for versions 4.
+
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Path to a file stored as boot/config.txt"
 	help
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 84b8cd735a..ed49ded49e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -15,9 +15,11 @@ RPI_FIRMWARE_FILES = \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
-	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB), start4db.elf fixup4db.dat)
 
 define RPI_FIRMWARE_INSTALL_BIN
 	$(foreach f,$(RPI_FIRMWARE_FILES), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
