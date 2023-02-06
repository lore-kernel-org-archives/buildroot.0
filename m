Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E776C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A15E6FB57;
	Tue, 21 Feb 2023 01:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A15E6FB57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmWRBQtgZeSr; Tue, 21 Feb 2023 01:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDF06FBD8;
	Tue, 21 Feb 2023 01:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDF06FBD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE941BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEE536FC05
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE536FC05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mnPrDUiY6Mz for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 002E66FBEF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002E66FBEF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DD4828C8; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:19:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3cab8f29eb9c7e573099a4a0e45f251e4f15f97
X-Git-Newrev: 0b42512f2f6c3957637d698de20c3930dfcd85e3
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.E2DD4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/optee-os: rewrap
 Config.in help text to fix check-package warning
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
