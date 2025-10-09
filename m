Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4766CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB87761222;
	Thu,  9 Oct 2025 09:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OK_te8RM7HSG; Thu,  9 Oct 2025 09:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3DB6130C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3DB6130C;
	Thu,  9 Oct 2025 09:56:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 556C4119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A611240FB9
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqQjB6FQ6rHr for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 899DB40FC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 899DB40FC9
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87AD486C36; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:47:44 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c158bcd4f88a1a0c879803c8374301eef6d41407
X-Git-Newrev: 39abeb5c139a33240dc5e8989f5073b1860406fe
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.87AD486C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] configs/beagleboneai:
 move to Linux 6.12.50
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39abeb5c139a33240dc5e8989f5073b1860406fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

And adjust the dtb path to the new subdir after commit 724ba6751532 ("ARM:
dts: Move .dts files to vendor sub-directories") in v6.5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e993272b324da933c7684670da07f388c4210201)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/beagleboard/beagleboneai/patches/linux/linux.hash | 2 +-
 configs/beagleboneai_defconfig                          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beagleboneai/patches/linux/linux.hash b/board/beagleboard/beagleboneai/patches/linux/linux.hash
index ec1a3601b7..4ae61c9e4f 100644
--- a/board/beagleboard/beagleboneai/patches/linux/linux.hash
+++ b/board/beagleboard/beagleboneai/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c52bc1ffc396c11bce335c9ee5cd55fe4213cbc1fb4026ff62bb90c864c61f62  linux-5.10.217.tar.xz
+sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 5d269a1825..bf6d73a525 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,10 +9,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am5729-beagleboneai"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am5729-beagleboneai"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
