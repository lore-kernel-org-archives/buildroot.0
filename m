Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5399BEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DBE405B9;
	Fri, 14 Jul 2023 21:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DBE405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpFaS8xr_6rI; Fri, 14 Jul 2023 21:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46D354052F;
	Fri, 14 Jul 2023 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D354052F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7C71BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408ED418FC
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408ED418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KquRWIgmOXyj for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F844418F8
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F844418F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BEB7870B9; Fri, 14 Jul 2023 21:23:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7be241b49cc1f537963b708ea5f26694385626e8
X-Git-Newrev: f41fd3daf314ed84181d968ea7f5336d20ffde5b
X-Patchwork-Hint: ignore
Message-Id: <20230714212340.2BEB7870B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: fix old Mediatek
 WiFi firmware location
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

commit: https://git.buildroot.net/buildroot/commit/?id=f41fd3daf314ed84181d968ea7f5336d20ffde5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old Mediatek WiFi firmware was moved into a mediatek/
subdirectory, see
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb

Fixes:

  http://autobuild.buildroot.net/results/fd237455c59686d04a795af8b7e54e9f4678d073/

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9383b20c15..068de3859e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -348,7 +348,7 @@ endif
 
 # MT7601
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U),y)
-LINUX_FIRMWARE_FILES += mt7601u.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
@@ -360,13 +360,13 @@ endif
 
 # MT7650
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
-LINUX_FIRMWARE_FILES += mt7650.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7650.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT76x2e
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E),y)
-LINUX_FIRMWARE_FILES += mt7662.bin mt7662_rom_patch.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7662.bin mediatek/mt7662_rom_patch.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
