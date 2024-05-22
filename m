Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D5C25B7C
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD5EF41734;
	Wed, 22 May 2024 13:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_j2Zu3JJGDi; Wed, 22 May 2024 13:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E29F40AFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E29F40AFE;
	Wed, 22 May 2024 13:14:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E69041C5BBD
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E00D24010C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AvMjTwjH6nU for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7381400F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7381400F1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C840E87514; Wed, 22 May 2024 13:14:44 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 15:07:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 376f00166f3cbd974164cad1a7ed2c5fdf95bddf
X-Git-Newrev: bbfee1d9b594182e03d0ccff3e463096b28428df
X-Patchwork-Hint: ignore
Message-Id: <20240522131444.C840E87514@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: add hashes
 for Linux/headers/u-boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbfee1d9b594182e03d0ccff3e463096b28428df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.  With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                         | 1 -
 board/beagleboneai/patches/linux-headers/linux-headers.hash | 1 +
 board/beagleboneai/patches/linux/linux.hash                 | 2 ++
 board/beagleboneai/patches/uboot/uboot.hash                 | 2 ++
 configs/beagleboneai_defconfig                              | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 070b97116a..0ddf9effda 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -160,7 +160,6 @@ configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_qt5_defconfig lib_defconfig.ForceCheckHash
-configs/beagleboneai_defconfig lib_defconfig.ForceCheckHash
 configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/beagleboneai/patches/linux-headers/linux-headers.hash b/board/beagleboneai/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboneai/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboneai/patches/linux/linux.hash b/board/beagleboneai/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec1a3601b7
--- /dev/null
+++ b/board/beagleboneai/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c52bc1ffc396c11bce335c9ee5cd55fe4213cbc1fb4026ff62bb90c864c61f62  linux-5.10.217.tar.xz
diff --git a/board/beagleboneai/patches/uboot/uboot.hash b/board/beagleboneai/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4b82872f31
--- /dev/null
+++ b/board/beagleboneai/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 1373ba662e..a002869984 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboneai/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboneai/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
