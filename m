Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE564C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC8E41877;
	Mon, 10 Apr 2023 21:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC8E41877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeAhvANKi1TG; Mon, 10 Apr 2023 21:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C599408DD;
	Mon, 10 Apr 2023 21:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C599408DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0141BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44CEA4098E
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44CEA4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fT9LEPLo8EU3 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D268405A2
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D268405A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B8AB83EB6; Mon, 10 Apr 2023 21:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:16:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9b244d8a3c83b39f67444f36b21a88cbaf4547b
X-Git-Newrev: b32d7c99c64d6dcb7a68036a7abfa86b8b558627
X-Patchwork-Hint: ignore
Message-Id: <20230410211718.6B8AB83EB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu: fix shellcheck in post-image
 script
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

commit: https://git.buildroot.net/buildroot/commit/?id=b32d7c99c64d6dcb7a68036a7abfa86b8b558627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 270759aff3cf (board/qemu: define start qemu script outside of
post-image script) touches board/qemu/post-image.sh, so that exposed
existing shellcheck issues.

Fix those now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Knight <james.d.knight@live.com>
---
 board/qemu/post-image.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 57306dd546..ccd0fb78c9 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -1,8 +1,8 @@
 #!/bin/bash
 
-QEMU_BOARD_DIR="$(dirname $0)"
-DEFCONFIG_NAME="$(basename $2)"
-README_FILES="${QEMU_BOARD_DIR}/*/readme.txt"
+QEMU_BOARD_DIR="$(dirname "$0")"
+DEFCONFIG_NAME="$(basename "$2")"
+README_FILE="${QEMU_BOARD_DIR}/*/readme.txt"
 START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
 
 if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
@@ -12,7 +12,7 @@ fi
 
 # Search for "# qemu_*_defconfig" tag in all readme.txt files.
 # Qemu command line on multilines using back slash are accepted.
-QEMU_CMD_LINE=$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '${DEFCONFIG_NAME}'$/!d; s/#.*//' ${README_FILES})
+QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' \ "${README_FILE}")"
 
 if [ -z "${QEMU_CMD_LINE}" ]; then
     # No Qemu cmd line found, can't test.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
