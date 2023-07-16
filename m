Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A018DEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56306405CF;
	Sun, 16 Jul 2023 16:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56306405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSZ7-M-vby5s; Sun, 16 Jul 2023 16:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958654049A;
	Sun, 16 Jul 2023 16:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958654049A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50C8B1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37C5481882
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C5481882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ez15tx5t5Ea2 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:28:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACBF481886
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBF481886
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BF8A86F3D; Sun, 16 Jul 2023 16:28:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:26:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ca8d533b478fa6fdbc37268a285d855dd5e7a5ea
X-Git-Newrev: 2927ab2135001b9bfb88143c150cc92b809fbb25
X-Patchwork-Hint: ignore
Message-Id: <20230716162824.9BF8A86F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] configs/nitrogen*: add
 missing openssl u-boot dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2927ab2135001b9bfb88143c150cc92b809fbb25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271709
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271710
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271712

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 717762b5f59a821d527fc5c5f307bc6b70c40661)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6sx_defconfig | 1 +
 configs/nitrogen6x_defconfig  | 1 +
 configs/nitrogen7_defconfig   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 967d064f1c..2b12b169a0 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 1cded53765..903d0abd9f 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index d1e81d90fd..718d203319 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
