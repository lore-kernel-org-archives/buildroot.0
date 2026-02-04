Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC1E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21427611A8;
	Wed,  4 Feb 2026 17:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6BZvSmVNpVO; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A85611A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224870;
	bh=2YnGiZ1nd1+kqa4dWbUkPXNkDwduqs8KH8c86LtPsU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ph0WGFLY8JtdK+hOqssDM+B74Rrsu6hGNCUxbIIT/F8FQUTuAXeCHzsGJ1BRJRO1j
	 e91JXKxk+xH3LC6FT/mcHlUMrlIahHpnfAmr53llACOAwh5UVpUV1AjqLeP3q2KmBc
	 bVuiuOfC4eMDhF/v0/PfKuFaIS8RAJphVP+BY8nzLGe4tonOO7Nqke5z3CVJJPaWh6
	 7Tp74IM4rSOwVPNnUsRJHd6IsxXtkfNa7WJMhj81bEpUorUVMc0MtCzjP0O9EpQS5r
	 I1m5DGq6y7SFNm6a2A6qvMsLNRmA0/XNCTVeLYPDaK3z/sfAkTzdanI5x/+SnYkwNw
	 M56t+AX6rKW0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A85611A4;
	Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1DB7173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FCF583F37
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_rRA7PsemRO for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE41C83D29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE41C83D29
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C292786977; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:34:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 397572b04a8270f54c1a2c6527896bf0c21b1980
X-Git-Newrev: 45f51fde13808fa676b666972830772ee8c16b20
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.C292786977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/bsh/imx8mn-bsh-smm-s2-pro: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45f51fde13808fa676b666972830772ee8c16b20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1a813ba4ee24429ab617d179d3b5efe6010333b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
index bf8861f6a9..9306df3f3f 100755
--- a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 PARTUUID="$($HOST_DIR/bin/uuidgen)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
