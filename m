Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0443107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B094660E47;
	Fri, 13 Mar 2026 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtndCC2vzLn9; Fri, 13 Mar 2026 22:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BBF260E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773439251;
	bh=PzS5eC5l8orE5IGOdDn+eETyholg7QzW6nGdK28selQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XzaeMfcmzpFpH9L2gREBs79zCzFW52e+WW/Wb/SHC4yVQwKWOASgCjUdFxswuGQ6j
	 BFtH8cBSqCUv14W3j7txcuNG//CR3ufjPh0fXdFWgYZGTG+Tkiqn5vCtLmtwZD4OBf
	 PqRE0E7KVcPA2mnzqXa4vkfbL+iTXTCA5khbddya18xuxS6DBRCJBo8uVjQJQ1mTiv
	 Jz5WDORFLVOIfbWmiGx+oNw9EmGRchyn2+Gq0uP5SQONUQgk5s2MlJ0XIEGmFD/b0y
	 9hkGswu2W44wxN32WaeAy273GNYgOX3tmV9q4F0SDoKmupxr0pzDxFsEVT481E/lf/
	 UURnCJ44LYxZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BBF260E41;
	Fri, 13 Mar 2026 22:00:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2BEC786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4BB681E13
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkL7r21amZI9 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204C281E10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204C281E10
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5162187132; Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 22:49:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5af624386e445a39d61906748536d8ac395e6f37
X-Git-Newrev: 1d603b78c05e132076ef9db1cf0cb3d16fd065ac
X-Patchwork-Hint: ignore
Message-Id: <20260313220050.5162187132@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal2/post-image.sh: remove
 incorrect $BINARIES_DIR
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d603b78c05e132076ef9db1cf0cb3d16fd065ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove incorrect $BINARIES_DIR reference from the symbolic link creation to
make a relative path and not an absolute path.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/versal2/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 17746271e1..af50909fb1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -3,7 +3,7 @@
 # By default U-Boot loads DTB from a file named "system.dtb", and
 # with versal2, the Linux DTB is the same as the U-Boot DTB, so
 # let's use a symlink since the DTB is the same.
-ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
