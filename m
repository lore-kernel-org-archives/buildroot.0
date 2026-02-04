Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B2E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA62661103;
	Wed,  4 Feb 2026 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDmX2uFQFxnZ; Wed,  4 Feb 2026 17:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3026110A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224829;
	bh=3rHUfuuZEf4QlGVvlgzYtsJzNL4TdvNT8/VnCtGA0gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T1Vczs9Et66vqGYKyjyCAL8rSbMF6Go1XnN0lZC02GFO+oCTRDmhODajNUbTvyRku
	 WBm4lsIejI+OkHt4HqzWiE0Zt+2Q5Gcc4kZsknK6KKWfP3XocWMgb8+s5o2cCTL3V1
	 29I8suQSYl5joB5J8vPEPSbdCEY0FYQ5P2dCcmiNIzr2Qrzcka1AGMUdGEKlYnsi76
	 wUxGUQY/sIRXvs73bl5BDO0x0ASKyoImwFYnndxlmSUYqrca5eEIr8BiBECzndy6Op
	 hMmMLLSMF+bMMuInCgt8FeQqGR9siYO9shafkNceOLFPpbKK81zGHh8CXuGpwg8wVu
	 TrFZNgxBc/Jfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3026110A;
	Wed,  4 Feb 2026 17:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D5AF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE57560A63
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKY0MzlzbVok for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D609760D76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D609760D76
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBAD38697A; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 45f51fde13808fa676b666972830772ee8c16b20
X-Git-Newrev: 3082436ff1667ae5f70581e2854877aa40ff3209
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.CBAD38697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/bsh/imx6ulz-bsh-smm-m2: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3082436ff1667ae5f70581e2854877aa40ff3209
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 374f5b66cbecf0254cf1b50ee106a15011d527b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/bsh/imx6ulz-bsh-smm-m2/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
index eac82cc22a..4a9bc1cfd5 100755
--- a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
+++ b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 cp "${BOARD_DIR}/nand-full.lst" "${BINARIES_DIR}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
