Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE4BCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC5E61599;
	Wed,  1 Oct 2025 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q17AMbUlQ181; Wed,  1 Oct 2025 20:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1279E61596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1279E61596;
	Wed,  1 Oct 2025 20:53:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03618CC0
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AA3841419
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lM_pfzqHLVtf for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E9541439
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E9541439
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7F9886702; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:11:04 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 62bd0c98c098f16714a716b2ec3a5ab290be015a
X-Git-Newrev: 19c85a6116209e1e31913b3f5a191765bbb56a07
X-Patchwork-Hint: ignore
Message-Id: <20251001205232.D7F9886702@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] board/qemu/{x86,
 x86_64}: fix shellcheck warning in post-build.sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=19c85a6116209e1e31913b3f5a191765bbb56a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This removes a warning reported by shellcheck: "Double quote to prevent
globbing and word splitting". As a result, the file can be removed from
.checkpackageignore.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e7937c52b6da69c4ff7de5ce40d836a0636c775c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore             | 2 --
 board/qemu/x86/post-build.sh    | 6 +++---
 board/qemu/x86_64/post-build.sh | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 76230f8f7b..6d1a63d546 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -48,8 +48,6 @@ board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-sp
 board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch lib_patch.Upstream
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
-board/qemu/x86/post-build.sh Shellcheck
-board/qemu/x86_64/post-build.sh Shellcheck
 board/raspberrypi/post-build.sh Shellcheck
 board/raspberrypi/post-image.sh Shellcheck
 board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch lib_patch.Upstream
diff --git a/board/qemu/x86/post-build.sh b/board/qemu/x86/post-build.sh
index bf83a002c2..24eee7f0e5 100755
--- a/board/qemu/x86/post-build.sh
+++ b/board/qemu/x86/post-build.sh
@@ -4,8 +4,8 @@ set -u
 set -e
 
 # Add a console on tty1
-if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
 	sed -i '/GENERIC_SERIAL/a\
-tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
 fi
diff --git a/board/qemu/x86_64/post-build.sh b/board/qemu/x86_64/post-build.sh
index bf83a002c2..24eee7f0e5 100755
--- a/board/qemu/x86_64/post-build.sh
+++ b/board/qemu/x86_64/post-build.sh
@@ -4,8 +4,8 @@ set -u
 set -e
 
 # Add a console on tty1
-if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
 	sed -i '/GENERIC_SERIAL/a\
-tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
