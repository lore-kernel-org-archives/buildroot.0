Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA35C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24806403C7;
	Sun, 28 Jul 2024 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNmWEdKrISG6; Sun, 28 Jul 2024 11:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEA1403CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEA1403CD;
	Sun, 28 Jul 2024 11:08:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6A11BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 784C960750
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p72nk9wRMbw for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AECE56071B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AECE56071B
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA6A98045A; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:39:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7857868d00be7a6ea8b204377a1881b3c9491218
X-Git-Newrev: 3432be2df104c3948f06451fa1b8f373bf3cc33b
X-Patchwork-Hint: ignore
Message-Id: <20240728110845.AA6A98045A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] board/chromebook-snow:
 force checking hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=3432be2df104c3948f06451fa1b8f373bf3cc33b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The chromebook-snow config uses a custom kernel version, so add a hash
for it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0d91281d7bdfa09be28237bab694e6ac22466541)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/chromebook/snow/patches/linux-headers/linux-headers.hash | 1 +
 board/chromebook/snow/patches/linux/linux.hash                 | 2 ++
 configs/chromebook_snow_defconfig                              | 1 +
 3 files changed, 4 insertions(+)

diff --git a/board/chromebook/snow/patches/linux-headers/linux-headers.hash b/board/chromebook/snow/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/chromebook/snow/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/chromebook/snow/patches/linux/linux.hash b/board/chromebook/snow/patches/linux/linux.hash
new file mode 100644
index 0000000000..1064af46aa
--- /dev/null
+++ b/board/chromebook/snow/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769  linux-4.15.tar.xz
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index 50e355647c..9a5bcce98b 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a15=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
