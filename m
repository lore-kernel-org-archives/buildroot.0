Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D7C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00BBF60BE3;
	Thu, 17 Jul 2025 20:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZk_uXFKPjd8; Thu, 17 Jul 2025 20:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46235607EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46235607EE;
	Thu, 17 Jul 2025 20:23:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CA81A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D2260B19
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2up8VriidJa for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15C660A43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D15C660A43
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE9198670B; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:58:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 08eea744fff08ef10a54765bd65129e191e5c91c
X-Git-Newrev: 19b69ede51124aa050137a299dba2c9b412236ab
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.CE9198670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/ti_am62x_sk: bump
 Linux version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19b69ede51124aa050137a299dba2c9b412236ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This patch bumps:

- Linux kernel to version 6.12.36 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8fe9da71a3989a46c01fe39f6c22e8094e62de5e)
[Titouan: only bump Linux and not U-Boot]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 1213da86b1..6c7685ad4d 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 5c3da51fae..eba743fb89 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
