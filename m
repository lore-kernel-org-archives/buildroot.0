Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C14DC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D42812EF;
	Tue,  8 Aug 2023 22:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D42812EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nr5ZUQdrlb3y; Tue,  8 Aug 2023 22:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5358481323;
	Tue,  8 Aug 2023 22:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5358481323
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B35C1BF966
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11E84611A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11E84611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hA0E0x8YDTfA for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BB5F60FAB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB5F60FAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17C6184E01; Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:08:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 87280a43a94dc868511f6b19e13d56787d8f470f
X-Git-Newrev: 9630075a6506e48ed6ba090b346346bd43f2a736
X-Patchwork-Hint: ignore
Message-Id: <20230808220842.17C6184E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/asus/tinker-s/post-build.sh: add quoting to make shellcheck happy
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9630075a6506e48ed6ba090b346346bd43f2a736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker-s/post-build.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/asus/tinker-s/post-build.sh b/board/asus/tinker-s/post-build.sh
index ffbbcdeb58..f938876625 100755
--- a/board/asus/tinker-s/post-build.sh
+++ b/board/asus/tinker-s/post-build.sh
@@ -1,9 +1,9 @@
 #!/bin/sh
 
 MKIMAGE=$HOST_DIR/bin/mkimage
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
-cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
+$MKIMAGE -n rk3288 -T rksd -d "$BINARIES_DIR"/u-boot-tpl.bin "$BINARIES_DIR"/u-boot-tpl.img
+cat "$BINARIES_DIR"/u-boot-tpl.img "$BINARIES_DIR"/u-boot-spl-dtb.bin > "$BINARIES_DIR"/u-boot-tpl-spl-dtb.img
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
