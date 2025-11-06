Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E610CCCFA19
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76FAA41148;
	Thu,  6 Nov 2025 19:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpwESfX6IVT8; Thu,  6 Nov 2025 19:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16C84116C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16C84116C;
	Thu,  6 Nov 2025 19:32:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 746021CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 558A4607F0
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5YBpLd46NEu for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3914A607EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3914A607EA
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 337277FCAF; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 19:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a530492cd3e6de7ed5f9406f7573fe7b9061b3d5
X-Git-Newrev: 093faabd8657dc2ac81507c84dd7ff9e98c44cdc
X-Patchwork-Hint: ignore
Message-Id: <20251106193217.337277FCAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: Fix
 linux tarball source
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=093faabd8657dc2ac81507c84dd7ff9e98c44cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use tag instead of branch to download the linux source,
and add proper hash files.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
[Julien: change linux-headers.hash to a symlink]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/andes/ae350/patches/linux-headers/linux-headers.hash | 1 +
 board/andes/ae350/patches/linux/linux.hash                 | 2 ++
 configs/andes_ae350_45_defconfig                           | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/andes/ae350/patches/linux-headers/linux-headers.hash b/board/andes/ae350/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/andes/ae350/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/andes/ae350/patches/linux/linux.hash b/board/andes/ae350/patches/linux/linux.hash
new file mode 100644
index 0000000000..1a6a136b71
--- /dev/null
+++ b/board/andes/ae350/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  linux-v6.0.y-andes.tar.gz
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 7b5a6f73c6..c02c4d7c61 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y_ae350-ax45mp)/linux-v6.0.y_ae350-ax45mp.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y-andes)/linux-v6.0.y-andes.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
