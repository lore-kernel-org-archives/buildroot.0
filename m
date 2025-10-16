Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF40CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AE36123C;
	Wed, 22 Oct 2025 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLWckhqaIMh6; Wed, 22 Oct 2025 16:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19546125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19546125B;
	Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6F2DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6350F6123C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WMvDbHnDbQ2 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2695D611FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2695D611FB
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21E3187722; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 09:57:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b1fae077837f699b2ab6eded621dc69c1a655a6a
X-Git-Newrev: e65662bce43a8c87db894251ba75552ba8190617
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.21E3187722@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/beagleboneai/post-build.sh: fix shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=e65662bce43a8c87db894251ba75552ba8190617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

BOARD_DIR is not used, so drop it and quote $BINARIES_DIR to make shellcheck
happy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5f620e144d82d70c822f26219cbec4d45daa2c00)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                          | 1 -
 board/beagleboard/beagleboneai/post-build.sh | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 482c109229..c74bbbc1d7 100644
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
