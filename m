Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19551C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E7440904;
	Sat, 23 Jul 2022 14:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E7440904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3o10QhuF0Gi; Sat, 23 Jul 2022 14:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 689964164E;
	Sat, 23 Jul 2022 14:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689964164E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7151BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F2260759
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F2260759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeLldrqeXD2V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:36:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D489060644
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D489060644
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF1BF844ED; Sat, 23 Jul 2022 14:22:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:35:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2436051a7d07a0a932dd441a3c9104e55f481d1d
X-Git-Newrev: d619fa054bff76afb424731136630a015d8ee2d8
X-Patchwork-Hint: ignore
Message-Id: <20220723142247.CF1BF844ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uboot-tools: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=d619fa054bff76afb424731136630a015d8ee2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
