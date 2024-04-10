Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E2BCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 558474178D;
	Wed, 10 Apr 2024 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mvRmYFzxUTB; Wed, 10 Apr 2024 20:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B269D4178F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B269D4178F;
	Wed, 10 Apr 2024 20:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2760C1BF980
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5D041722
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVWeRe3_hPyJ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA294176C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EA294176C
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AA9785ECC; Wed, 10 Apr 2024 20:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 21:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84577b53da631e38411d91affc13feca5caccfa9
X-Git-Newrev: 99a3698729dad14ff75f9914dd8555bb73d2da02
X-Patchwork-Hint: ignore
Message-Id: <20240410200011.5AA9785ECC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nezha_defconfig: add hashes for
 Linux/opensbi/u-boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99a3698729dad14ff75f9914dd8555bb73d2da02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/nezha/patches/linux-headers/linux-headers.hash | 1 +
 board/nezha/patches/linux/linux.hash                 | 2 ++
 board/nezha/patches/opensbi/opensbi.hash             | 2 ++
 board/nezha/patches/uboot/uboot.hash                 | 2 ++
 configs/nezha_defconfig                              | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/board/nezha/patches/linux-headers/linux-headers.hash b/board/nezha/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/nezha/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/nezha/patches/linux/linux.hash b/board/nezha/patches/linux/linux.hash
new file mode 100644
index 0000000000..899adefd07
--- /dev/null
+++ b/board/nezha/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
diff --git a/board/nezha/patches/opensbi/opensbi.hash b/board/nezha/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/nezha/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/board/nezha/patches/uboot/uboot.hash b/board/nezha/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7d05185938
--- /dev/null
+++ b/board/nezha/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  36db7c20b179f03aa29009565c6b34380d5629fd5c57ed110244594d9930dfed  uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index e717c8a08d..c234b3e243 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
