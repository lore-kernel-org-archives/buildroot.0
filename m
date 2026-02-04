Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C00FE9537B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494C940AF2;
	Wed,  4 Feb 2026 10:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buM829GFlunq; Wed,  4 Feb 2026 10:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528924073B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770202710;
	bh=Do+sOIWoeeHJVDB8XlIoED2Y+4yy/s+A+ouRMPH3H9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PyU1fcqGxiuKMmbEJAyVwDCNnYL5bOOpCj02Hg3hysGZod/MgiQDkCbnLdu5DuHfe
	 mRfht8GSjQmbr/tdAlQBM0JFyuGWEQWu9ZHAyqHCa57LT8kXIdfRVuSTMWNwLkcrwK
	 47gcXAkcTo9sswPqZGyd4kCke8+znnnz3OfShqgsQ6QEzQZ2kUq7A9hCFP6Fu9D799
	 GgSLvt/Jgn3gY0ZAjbrZC2tMm6QhHlbMFMaHzw96ImOD02sjrheQkPtwjcckggWnjj
	 6Zop7iZK5TCQZ+0MQEh4k8EUbbbVwh3WAR9gqMEWkD4ildNKqTxkjAXvFlL6qR87D1
	 0hvh0+UXsKYjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528924073B;
	Wed,  4 Feb 2026 10:58:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBD5F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E19A840109
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fpV0GcrkGZg for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 164EB4007B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 164EB4007B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEFA986876; Wed,  4 Feb 2026 10:58:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 11:57:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21311f79c61050bbb289fba1328bd4df1abdd52d
X-Git-Newrev: 8c5214f6d424c46e6e25d24cbc0c86034cfcdbed
X-Patchwork-Hint: ignore
Message-Id: <20260204105827.EEFA986876@busybox.osuosl.org>
Subject: [Buildroot] [git commit] rpi-firmware: support installing extra
 files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c5214f6d424c46e6e25d24cbc0c86034cfcdbed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There are several use cases for installing additional files in the boot
partition that is read by the RPi firmware.

- autoboot.txt is an optional configuration file for the RPi
  firmware [1]. Supporting several autoboot files will enable A/B
  setups, as using the renameat2() system call with the RENAME_EXCHANGE
  flag will let users atomically replace one autoboot configuration
  file with the other. This improves reliability in the case of an
  update which could potentially be interrupted.

- Multiple cmdline.txt files are useful in the context of a new
  [boot_partition] conditional filter introduced in config.txt in
  commit [2]. This is useful for A/B systems to have identical BootFS
  partitions on both slots, and not have to edit the kernel command line
  to ensure the kernel will load the right rootFS after update of the
  BootFS.

- rpi-firmware contains DTB overlays for many "standard" hats, but a
  custom hat may require a custom overlay.

Although it is possible to install additional files in the boot
partition in the post-image script, it is very convenient to be able to
use the standard RPi post-image script in
board/raspberrypi/post-image.sh. That script looks in
$BINARIES_DIR/rpi-firmware, so it is convenient to be able to place
additional files there.

Add the option BR2_PACKAGE_RPI_FIRMWARE_EXTRA_FILES which is simply a
list of files to be copied to $BINARIES_DIR/rpi-firmware, which will
eventually end up as the boot partition. Make sure that this is done as
the last step of RPI_FIRMWARE_INSTALL_IMAGES_CMDS, so the files can
override files installed by earlier steps.

[1] https://www.raspberrypi.com/documentation/computers/config_txt.html#autoboot-txt
[2] https://github.com/raspberrypi/rpi-eeprom/commit/d50b2b32f162292ab6e235932075ce00bddda4ae

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/rpi-firmware/Config.in       | 9 +++++++++
 package/rpi-firmware/rpi-firmware.mk | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 4dda33a713..625f0ccf67 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -100,4 +100,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	  overlays, to support HATs (Hardware Attached on Top, add-on
 	  modules).
 
+config BR2_PACKAGE_RPI_FIRMWARE_EXTRA_FILES
+	string "List of path(s) to additional file(s) in boot partition"
+	help
+	  Space-separated path(s) to file(s) that should be stored
+	  in the boot partition. They will be stored under their own
+	  name in rpi-firmware. They can override any of the other
+	  files. Use cases include autoboot configuration,
+	  alternative cmdline.txt files, additional DTB overlays.
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 83d0808990..f1b1b110ce 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -62,12 +62,20 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+RPI_FIRMWARE_EXTRA_FILES = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_EXTRA_FILES))
+define RPI_FIRMWARE_INSTALL_EXTRA_FILES
+	$(foreach f,$(RPI_FIRMWARE_EXTRA_FILES), \
+		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/rpi-firmware/$(notdir $(f))
+	)
+endef
+
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_CMDLINE)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
+	$(RPI_FIRMWARE_INSTALL_EXTRA_FILES)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
