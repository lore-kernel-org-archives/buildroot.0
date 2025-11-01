Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EDDCCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE94610B6;
	Sat,  1 Nov 2025 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1ZZTnydI5NV; Sat,  1 Nov 2025 17:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E88EB61168
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88EB61168;
	Sat,  1 Nov 2025 17:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B61142A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF0F84708
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRw6T_K-yx5F for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE938846FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE938846FC
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:26:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA1578375D; Sat,  1 Nov 2025 17:26:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Nov 2025 18:24:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b79f01e42f7df916384b70028d63741dd01abc9
X-Git-Newrev: 7504f85c8432e155233b3000cd1bb78a8704ada1
X-Patchwork-Hint: ignore
Message-Id: <20251101172653.DA1578375D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: Fix
 post-build.sh Shellcheck error
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

commit: https://git.buildroot.net/buildroot/commit/?id=7504f85c8432e155233b3000cd1bb78a8704ada1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add quotation mark to fix Shellcheck error.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore             | 1 -
 board/andes/ae350/post-build.sh | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e8c97c2d63..f146382d34 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,7 +1,6 @@
 board/amarula/vyasa/post-build.sh Shellcheck
 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream
-board/andes/ae350/post-build.sh Shellcheck
 board/arcturus/aarch64-ucls1012a/post-build.sh Shellcheck
 board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
index 84187a064b..e1669c2bcd 100755
--- a/board/andes/ae350/post-build.sh
+++ b/board/andes/ae350/post-build.sh
@@ -1,3 +1,3 @@
 #!/bin/sh
-cp $BINARIES_DIR/Image $TARGET_DIR/boot
-cp $BINARIES_DIR/ae350_ax45mp.dtb $TARGET_DIR/boot
+cp "$BINARIES_DIR"/Image "$TARGET_DIR"/boot
+cp "$BINARIES_DIR"/ae350_ax45mp.dtb "$TARGET_DIR"/boot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
