Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3303C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888048143A;
	Wed,  6 Jul 2022 21:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888048143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdQCJxqSKhBW; Wed,  6 Jul 2022 21:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B2481429;
	Wed,  6 Jul 2022 21:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B2481429
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27C991BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D0AF40C3D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D0AF40C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-cjEx1zjjtd for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:43:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34D234011D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D234011D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4BA3782DF5; Wed,  6 Jul 2022 21:30:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:42:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d780b828fcbe2b4a1f125d3460f28379d5c27b8e
X-Git-Newrev: c3ebeca4409d5848480cb7cf7b1d0c07b344ce96
X-Patchwork-Hint: ignore
Message-Id: <20220706213020.4BA3782DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3ebeca4409d5848480cb7cf7b1d0c07b344ce96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The help section of "BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT"
refers to U-Boot configuration option "CONFIG_ENV_SIZE_REDUND" which is
removed since U-Boot v2020.01, so remove this reference.

We may replace this with a reference to "CONFIG_ENV_OFFSET_REDUND" as
another indicator that a redundant environment image should be created.

This also fixes a minor typo in the same file.

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
