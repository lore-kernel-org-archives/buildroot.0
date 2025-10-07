Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D57FCCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF71C60A40;
	Tue,  7 Oct 2025 19:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDMetuZCVMUh; Tue,  7 Oct 2025 19:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB4160A38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB4160A38;
	Tue,  7 Oct 2025 19:09:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB7299DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD30D40A12
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCaPp6WBgXad for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5ADF40A11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5ADF40A11
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:09:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5BF386A16; Tue,  7 Oct 2025 19:09:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 20:49:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 331d80f52e4912b422a2de27c9c0528923862e46
X-Git-Newrev: 5f620e144d82d70c822f26219cbec4d45daa2c00
X-Patchwork-Hint: ignore
Message-Id: <20251007190903.A5BF386A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beagleboneai/post-build.sh: fix
 shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f620e144d82d70c822f26219cbec4d45daa2c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BOARD_DIR is not used, so drop it and quote $BINARIES_DIR to make shellcheck
happy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                          | 1 -
 board/beagleboard/beagleboneai/post-build.sh | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a9d259a2f2..1c3bca481f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -9,7 +9,6 @@ board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beagleboard/beaglebone/post-build.sh Shellcheck
-board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
 board/boundarydevices/common/post-image.sh Shellcheck
 board/broadcom/northstar/post-image.sh Shellcheck
diff --git a/board/beagleboard/beagleboneai/post-build.sh b/board/beagleboard/beagleboneai/post-build.sh
index 384b4d8745..8d94a8f1e4 100755
--- a/board/beagleboard/beagleboneai/post-build.sh
+++ b/board/beagleboard/beagleboneai/post-build.sh
@@ -1,4 +1,3 @@
 #!/bin/sh
-BOARD_DIR="$(dirname $0)"
 
-cp board/beagleboard/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
+cp board/beagleboard/beagleboneai/uEnv.txt "$BINARIES_DIR/uEnv.txt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
