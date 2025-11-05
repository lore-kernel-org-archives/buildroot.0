Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77C1CEBF8D
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D0F4130D;
	Mon, 17 Nov 2025 19:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSNnQdJqKg6I; Mon, 17 Nov 2025 19:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A219741308
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A219741308;
	Mon, 17 Nov 2025 19:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2941BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FCCC83C39
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97GRiLJNCYpC for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C58583CFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C58583CFC
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A442848E2; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:58:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f89b2949906d13a2f11b2ee3f137404ba2ab1715
X-Git-Newrev: e293ace97758d741ba6e8c93138936563c46ddb3
X-Patchwork-Hint: ignore
Message-Id: <20251117195126.8A442848E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/andes_ae350_45_defconfig: Fix post-build.sh Shellcheck error
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

commit: https://git.buildroot.net/buildroot/commit/?id=e293ace97758d741ba6e8c93138936563c46ddb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add quotation mark to fix Shellcheck error.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7504f85c8432e155233b3000cd1bb78a8704ada1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore             | 1 -
 board/andes/ae350/post-build.sh | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c74bbbc1d7..d55d1beb10 100644
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
