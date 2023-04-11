Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FB0C7619A
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 06:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19169410B0;
	Tue, 11 Apr 2023 06:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19169410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHFjIg4sRPed; Tue, 11 Apr 2023 06:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F33340987;
	Tue, 11 Apr 2023 06:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F33340987
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3239B1BF276
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 06:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 043A740987
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 06:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043A740987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP6zgFXyrwxW for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 06:59:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D4540946
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 06:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D4540946
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 919F283EB2; Tue, 11 Apr 2023 06:59:22 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 08:59:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5de78f181acc53959b0a446a3fb116ecdec13577
X-Git-Newrev: 3aa2b0b81a0ee950c47efb2997c3127bf9475456
X-Patchwork-Hint: ignore
Message-Id: <20230411065922.919F283EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove fixed
 board/qemu/post-image.sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=3aa2b0b81a0ee950c47efb2997c3127bf9475456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b32d7c99 fixed the shellcheck errors in board/qemu/post-image.sh,
but forgot to remove it from .checkpackageignore, leading to "Shellcheck
was expected to fail" errors.

Re-generate .checkpackageignore.

Fixes: b32d7c99c64d6dcb7a68036a7abfa86b8b558627

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 37214d6424..cf58e59198 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -59,7 +59,6 @@ board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
 board/pine64/rock64/post-build.sh Shellcheck
 board/pine64/rockpro64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
-board/qemu/post-image.sh Shellcheck
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
 board/radxa/rockpi-n8/post-build.sh Shellcheck
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
