Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D43C10F1A
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA5F80FAF;
	Wed,  1 May 2024 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpprLV8leLpi; Wed,  1 May 2024 22:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB7682156
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB7682156;
	Wed,  1 May 2024 22:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3180F1BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A72A40811
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO-0DuzAeYvB for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 22:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24264407DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24264407DD
 for <buildroot@buildroot.org>; Wed,  1 May 2024 22:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E82186550; Wed,  1 May 2024 22:02:02 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 00:01:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4981d6756c711e2034072247912bc85d3edae02
X-Git-Newrev: c94df402d52ef656dbe957c3ac20f656f2fb9505
X-Patchwork-Hint: ignore
Message-Id: <20240501220202.0E82186550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2_defconfig: add hashes
 for linux/opensbi/u-boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=c94df402d52ef656dbe957c3ac20f656f2fb9505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and set the patch directory.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
[Romain: remove .checkpackageignore entry]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                        | 1 -
 board/visionfive2/patches/linux-headers/linux-headers.hash | 1 +
 board/visionfive2/patches/linux/linux.hash                 | 2 ++
 board/visionfive2/patches/opensbi/opensbi.hash             | 2 ++
 board/visionfive2/patches/uboot/uboot.hash                 | 2 ++
 configs/visionfive2_defconfig                              | 2 ++
 6 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0b169ea2f1..db23450f03 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -390,7 +390,6 @@ configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/ts7680_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
-configs/visionfive2_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/visionfive2/patches/linux-headers/linux-headers.hash b/board/visionfive2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/visionfive2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
new file mode 100644
index 0000000000..ccad8068dd
--- /dev/null
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9ac322d85bcf98a04667d929f5c2666b15bd58c6c2d68dd512c72acbced07d04  linux-6.8.2.tar.xz
diff --git a/board/visionfive2/patches/opensbi/opensbi.hash b/board/visionfive2/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/visionfive2/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/board/visionfive2/patches/uboot/uboot.hash b/board/visionfive2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/visionfive2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 69c44dfbdd..bb8ab082af 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,4 +1,6 @@
 BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
