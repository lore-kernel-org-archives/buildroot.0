Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37F3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478EE60EFD
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 478EE60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE87A4056B;
	Sat,  9 Oct 2021 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPof8TRXlpRk; Sat,  9 Oct 2021 20:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B924041B;
	Sat,  9 Oct 2021 20:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B101BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E5960720
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APqU48zuY080 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B13760626
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:47:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E92C894E7F; Sat,  9 Oct 2021 20:44:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:46:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff0e0678560bee05f1ee7ec9c516586cc3c1b6da
X-Git-Newrev: 9aaba203689cfe24aa102512d1326a44cc65af6c
X-Patchwork-Hint: ignore
Message-Id: <20211009204416.E92C894E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 2ef3800
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aaba203689cfe24aa102512d1326a44cc65af6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 2ef3800 (past [1] which fixes the boot starvation
  introduced by [2] as reported by Vincent Fazio <vfazio@xes-inc.com>
  see [3] and [4])

[1] https://github.com/raspberrypi/firmware/commit/b5257da58c0e652633592c6fce09a7f3b100a2eb
[2] https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
[3] http://lists.busybox.net/pipermail/buildroot/2021-September/623659.html
[4] http://lists.busybox.net/pipermail/buildroot/2021-September/624550.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7127b2d824..0ff7a73a37 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
+sha256  80af5efb51677edb7af6746a553dc2d8ad3f532ff44e4b7263f1e12d4bf72ffd  rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 181650fa08..d74f7155c7 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
+RPI_FIRMWARE_VERSION = 2ef3800b1b71c0e30c2a61ecad6e007ae96ea342
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
