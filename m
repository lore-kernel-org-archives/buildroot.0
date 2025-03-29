Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28DFC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 12:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EDC16062E;
	Sat, 29 Mar 2025 12:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdb48v21_GQo; Sat, 29 Mar 2025 12:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F2260AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F2260AC1;
	Sat, 29 Mar 2025 12:38:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2417919C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14BBD60AC1
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgmgQLT7Gj9a for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D17D6062E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D17D6062E
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52F6883863; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 12:44:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15f15cfe019fc1788c01e5819d238328d4282aa1
X-Git-Newrev: 185c0ba4b93a2647b41ed0afe9ea3f5cfdbfbe77
X-Patchwork-Hint: ignore
Message-Id: <20250329123758.52F6883863@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/sifive/hifive-unleashed: fix
 shellcheck warning in post-build.sh
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=185c0ba4b93a2647b41ed0afe9ea3f5cfdbfbe77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This removes a warning reported by shellcheck: "Double quote to prevent
globbing and word splitting". As a result, the file can be removed from
.checkpackageignore.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                         | 1 -
 board/sifive/hifive-unleashed/post-build.sh | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0907cb39ed..7b02d2a8d0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -72,7 +72,6 @@ board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-
 board/roseapplepi/post-build.sh Shellcheck
 board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch lib_patch.Upstream
 board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch lib_patch.Upstream
-board/sifive/hifive-unleashed/post-build.sh Shellcheck
 board/solidrun/clearfog/post-build.sh Shellcheck
 board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
 board/solidrun/macchiatobin/post-build.sh Shellcheck
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/hifive-unleashed/post-build.sh
index b418120652..14c80558d5 100755
--- a/board/sifive/hifive-unleashed/post-build.sh
+++ b/board/sifive/hifive-unleashed/post-build.sh
@@ -1,2 +1,2 @@
 #!/bin/sh
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+cp "$BINARIES_DIR/boot.scr" "$TARGET_DIR/boot/boot.scr"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
