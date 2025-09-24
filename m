Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203FECAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF03141306;
	Wed, 24 Sep 2025 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkpZ1MRmBrTu; Wed, 24 Sep 2025 19:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3A0B40DBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A0B40DBC;
	Wed, 24 Sep 2025 19:35:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65BE9199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2E082803
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaJiXYt4q2nJ for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9615F827F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9615F827F0
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A942863B9; Wed, 24 Sep 2025 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 21:02:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2bd4655259299fded94727e94a4fa4389113202
X-Git-Newrev: e7937c52b6da69c4ff7de5ce40d836a0636c775c
X-Patchwork-Hint: ignore
Message-Id: <20250924193530.8A942863B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/{x86,
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7937c52b6da69c4ff7de5ce40d836a0636c775c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This removes a warning reported by shellcheck: "Double quote to prevent
globbing and word splitting". As a result, the file can be removed from
.checkpackageignore.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore             | 2 --
 board/qemu/x86/post-build.sh    | 6 +++---
 board/qemu/x86_64/post-build.sh | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a3437c1cf3..ebbc6a5a05 100644
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
