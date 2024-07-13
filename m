Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A4CC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8926076B;
	Sat, 13 Jul 2024 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjJXMkdlO-yX; Sat, 13 Jul 2024 15:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15998607A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15998607A6;
	Sat, 13 Jul 2024 15:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8412E1BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 710824018E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JSZkdr7zR2x for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DA140096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86DA140096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68F098658A; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:57:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f25676184fdbb3243c3709b925369679e7423a
X-Git-Newrev: 551b922d7149e5f7f1ec9ab9a2ca9a09d33e2735
X-Patchwork-Hint: ignore
Message-Id: <20240713155752.68F098658A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/linux-firmware: change
 Amlogic Bluetooth binary path"
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

commit: https://git.buildroot.net/buildroot/commit/?id=551b922d7149e5f7f1ec9ab9a2ca9a09d33e2735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 179dd69969a496eec11b31fa2b69398034ca5fc1.

This commit was merged while Buildroot was still using linux-firmware
20240410, which did not contain the path change for the Amlogic
Bluetooth firmware files.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 895f3952f4..d6b0157ed3 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,7 +53,7 @@ endif
 
 # Amlogic SoC Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
-LINUX_FIRMWARE_FILES += amlogic/*.bin
+LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
