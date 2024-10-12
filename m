Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0802CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DCA76069F;
	Sat, 12 Oct 2024 15:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBunmITMKG_6; Sat, 12 Oct 2024 15:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBA160B53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBA160B53;
	Sat, 12 Oct 2024 15:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE9B1BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8980B60687
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtO3W8vQYd5l for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1C160679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1C160679
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A63AD835E6; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:08 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 427efc1cd1128b7df531ea12c27cb9419d2ee7a3
X-Git-Newrev: 9f7e74ca533cb4d4b66c2a780938a639a8ae6edd
X-Patchwork-Hint: ignore
Message-Id: <20241012150252.A63AD835E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/rpi-firmware: fix
 'partition' typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f7e74ca533cb4d4b66c2a780938a639a8ae6edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0dffd8ab1ce0d7d2b47f5c1f1320265a0e5d4cb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a9aeaed745..f99c116ca2 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -66,14 +66,14 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Path to a file stored as boot/config.txt"
 	help
-	  Path to a file stored as config.txt in the boot partiton
+	  Path to a file stored as config.txt in the boot partition
 	  of the generated SD card image.
 
 config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
 	string "Path to a file stored as boot/cmdline.txt"
 	default "board/raspberrypi/cmdline.txt"  # legacy
 	help
-	  Path to a file stored as cmdline.txt in the boot partiton
+	  Path to a file stored as cmdline.txt in the boot partition
 	  of the generated SD card image.
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
