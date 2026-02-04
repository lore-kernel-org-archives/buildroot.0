Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884FDE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD66612A7;
	Wed,  4 Feb 2026 17:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWbiu9P2NX2O; Wed,  4 Feb 2026 17:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F8AC612A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224951;
	bh=OC/46OztCuLYl0SF6IPdO0RIIRO4WeSF2dnD4hbEp4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cY3sQNNyytttu3sGriqUHFW2ssS2RzRICsKKGNEJSub8lYIx03AVua/b0MagwJtSK
	 hNydlnB89FbsmnpewxBYXY/qw4LI/eUKByCFih7Rc9DMHqyEc8njuK7ShGObzRdh4r
	 +B2LxzE37TLi0h86PueLindMIcycNmLBp6gX+v3rxQyhgcmfzbyIMB/AP9WG5Oyu9I
	 nsR+NPpdC10wuqlsX4c+oPahFtdVCqoQx+6atAARvTG0HGTRuX2R1OsxiZWX2PnxVw
	 2YMfUvnV8iMwsDiQJzzWjdzNG66z+v6PN2vlaujosKTk2B4ED/AHsJ29fncu7AwsPy
	 Us7nfEbpuBZ8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8AC612A5;
	Wed,  4 Feb 2026 17:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 462FAF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BCE405ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbNOgrlJqcIj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28AB540571
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28AB540571
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD8F8697C; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 03f85b3b08026936cdc7940e26e72c14b0db1ec7
X-Git-Newrev: f4e8a597aae477f322ae25a434734b1333cfc970
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.1DD8F8697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4e8a597aae477f322ae25a434734b1333cfc970
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
