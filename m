Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6147C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E794861AC5;
	Sat, 23 Jul 2022 14:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E794861AC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSjk-sVVT6gH; Sat, 23 Jul 2022 14:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92F861ACF;
	Sat, 23 Jul 2022 14:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92F861ACF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 329EA1BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9D4606DC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9D4606DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qECFF4ZIkWRJ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:36:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47F0F60644
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F0F60644
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A545844EA; Sat, 23 Jul 2022 14:22:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:35:56 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 838a6e86c86ebd673f729dcf04f949eabd93b5bc
X-Git-Newrev: 6b7efdd0409fb60282f32cbef229982ad35d7851
X-Patchwork-Hint: ignore
Message-Id: <20220723142242.3A545844EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uboot-tools: fix
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b7efdd0409fb60282f32cbef229982ad35d7851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The help section of "BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT"
refers to U-Boot configuration option "CONFIG_ENV_SIZE_REDUND" which is
removed since U-Boot v2020.01, so remove this reference.

We may replace this with a reference to "CONFIG_ENV_OFFSET_REDUND" as
another indicator that a redundant environment image should be created.

This also fixes a minor typo in the same file.

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c3ebeca4409d5848480cb7cf7b1d0c07b344ce96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 431cc8631d..622070405d 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -45,7 +45,7 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 	  Generate a valid binary environment image from a text file
 	  describing the key=value pairs of the environment.
 
-	  This option can be useful to build enviornment configurations
+	  This option can be useful to build environment configurations
 	  as part of a Linux / rootfs only defconfig instead of using
 	  post scripts. This supports a hardware use case of a single
 	  bootloader only defconfig but multiple Linux / rootfs
@@ -81,8 +81,8 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
 	  Some platforms define in their U-Boot configuration that the
 	  U-Boot environment should be duplicated in two locations (for
 	  extra safety). Check your U-Boot configuration for the
-	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_SIZE_REDUND settings to
-	  see if this is the case for your platform.
+	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_OFFSET_REDUND settings
+	  to see if this is the case for your platform.
 
 	  If it is the case, then you should enable this option to
 	  ensure that the U-Boot environment image generated by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
