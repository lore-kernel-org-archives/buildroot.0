Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8DCC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB3A6120E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DB3A6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6769B8272A;
	Fri,  5 Nov 2021 16:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBiC2pkemtmO; Fri,  5 Nov 2021 16:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD68F826EA;
	Fri,  5 Nov 2021 16:21:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66E7B1BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA4D61579
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzK-K4rQzWNV for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10F361585
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 140098AC06; Fri,  5 Nov 2021 16:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:16:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d0954188861bd92fd68b941aca6e2c147697c5b
X-Git-Newrev: b3504cb0aebdb691fc38780222809c346a28acb2
X-Patchwork-Hint: ignore
Message-Id: <20211105161640.140098AC06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/chiliboard: bump to linux 5.14.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3504cb0aebdb691fc38780222809c346a28acb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/grinn_chiliboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index 5b05ed44d6..e72a82cee8 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/chiliboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.26"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
