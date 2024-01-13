Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8038C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 631DA60F33;
	Sat, 13 Jan 2024 21:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 631DA60F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFk_R2-C7S5J; Sat, 13 Jan 2024 21:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A8D60F31;
	Sat, 13 Jan 2024 21:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A8D60F31
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1AC1BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6F4B60E4B
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F4B60E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQorh1Rp6g6q for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0606360EF6
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0606360EF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 006F986069; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:53:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e75e40f7a499e4c7b1f608bddc83a2c9e4ab2b3
X-Git-Newrev: 4267375218e211148b16bca3b4decb45a5ed9fcf
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.006F986069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/broadcom_northstar_defconfig:
 specify kernel & headers versions
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
Content-Type: multipart/mixed; boundary="===============8932574884726855185=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8932574884726855185==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4267375218e211148b16bca3b4decb45a5ed9fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though Northstart platform support is well upstreamed it may always
happen that some kernel change affects/breaks something. It's a good
practice to specify fixed versions for kernel & Linux headers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/broadcom_northstar_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/broadcom_northstar_defconfig b/configs/broadcom_northstar_defconfig
index 9ae716726d..bbd368ac79 100644
--- a/configs/broadcom_northstar_defconfig
+++ b/configs/broadcom_northstar_defconfig
@@ -1,7 +1,10 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/broadcom/northstar/post-image.sh"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/broadcom/northstar/linux.config"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y

--===============8932574884726855185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8932574884726855185==--
