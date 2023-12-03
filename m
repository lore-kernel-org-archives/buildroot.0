Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9A9C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AC740864;
	Sun,  3 Dec 2023 16:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AC740864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEYobpYW5RQl; Sun,  3 Dec 2023 16:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE94C4081F;
	Sun,  3 Dec 2023 16:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE94C4081F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93BAE1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CED160A6D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CED160A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4stqCMnlY3G for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:41:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86EDD60A62
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EDD60A62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B08787797; Sun,  3 Dec 2023 16:41:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:38:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3db1dd1b7b4fca95eefb1f42a25881f89d881f7
X-Git-Newrev: cdc9b8a3a75c4c39f23feb4e3b0e296786e0132c
X-Patchwork-Hint: ignore
Message-Id: <20231203164150.6B08787797@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toradx_apalis_imx6_defconfig: add download
 hashes for linux/uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdc9b8a3a75c4c39f23feb4e3b0e296786e0132c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig fetches Linux and U-Boot from a git repo using the
unauthenticated git:// protocol, so add download hashes for them to ensure
we get the right sources by adding a global patch dir and running
utils/add-custom-hashes.

The defconfig uses the Linux sources for the kernel headers, so make
linux-headers/linux-headers.hash a symlink to linux/linux.hash so the same
hash file is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash | 1 +
 board/toradex/apalis-imx6/patches/linux/linux.hash                 | 2 ++
 board/toradex/apalis-imx6/patches/uboot/uboot.hash                 | 2 ++
 configs/toradex_apalis_imx6_defconfig                              | 1 +
 4 files changed, 6 insertions(+)

diff --git a/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash b/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
new file mode 100644
index 0000000000..1138ec3b93
--- /dev/null
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9c69a1c283db6ee8042cc6f013a159473f257e71751887312c7dd2902f01bec8  linux-d899927728beca8357a5b4120b690cb3c1d80844-br1.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..a81a7d8d4a
--- /dev/null
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9a540b08ccb7e8a0252f86d0bad5d676d0964725a7f2a06d798225c2a3024878  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-br1.tar.gz
diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
index 40a2d2d520..e447190e0c 100644
--- a/configs/toradex_apalis_imx6_defconfig
+++ b/configs/toradex_apalis_imx6_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_GLOBAL_PATCH_DIR="board/toradex/apalis-imx6/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
