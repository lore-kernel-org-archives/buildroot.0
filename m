Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F2C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB63360AD4;
	Mon,  6 Feb 2023 13:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB63360AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjuXlzulyqvW; Mon,  6 Feb 2023 13:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D02160AE8;
	Mon,  6 Feb 2023 13:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D02160AE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAE341BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A339B40459
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A339B40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeKWrsEkvYZc for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:19:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D601D40467
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D601D40467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD10883B3F; Mon,  6 Feb 2023 13:19:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:19:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3cab8f29eb9c7e573099a4a0e45f251e4f15f97
X-Git-Newrev: 0b42512f2f6c3957637d698de20c3930dfcd85e3
X-Patchwork-Hint: ignore
Message-Id: <20230206131937.BD10883B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: rewrap Config.in help text
 to fix check-package warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b42512f2f6c3957637d698de20c3930dfcd85e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

boot/optee-os/Config.in:140: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

which is a warning that was introduced by commit
46306d135e5aab14073eece713d38e8c827c58ae ("boot/optee-os: add
out-of-source OPTEE-OS device tree support").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/Config.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 617ff93c44..a3cb8390b4 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -134,12 +134,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
 	  Space-separated list of paths to device tree source files
-	  that will be copied to core/arch/arm/dts/ before starting the
-	  build.
+	  that will be copied to core/arch/arm/dts/ before starting
+	  the build.
 
-	  To use this device tree source file, the OP-TEE OS configuration
-	  must refer to it with the CFG_EMBED_DTB_SOURCE_FILE option and
-	  no platform flavor needs to be specified.
+	  To use this device tree source file, the OP-TEE OS
+	  configuration must refer to it with the
+	  CFG_EMBED_DTB_SOURCE_FILE option and no platform flavor
+	  needs to be specified.
 
 config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 	string "Additional build variables"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
