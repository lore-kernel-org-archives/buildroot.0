Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81245D74EF7
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C70D408C4;
	Sun, 25 Jan 2026 21:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRn81MEWooJS; Sun, 25 Jan 2026 21:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC3540899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377650;
	bh=F7DX3sFrbfbObSAnH23ZjAUACBWNQAKVz/fNOLySNus=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZZm4QFNPSNYTzg+DotR3ZbxxyluuhMeABp5wGx9tMahV0f98qOhi00FIGi680SnWW
	 yWAxiFbBG8xDCEbQjedxIF3xEaMTYpFU4xvuGrWuD0dAFXDF85odNMqzstT22qEOVB
	 5Q3YXVDO9o05lyhp8bvvfWwHSeE+zn3kfdy7Hg1hmMR+MK+WJTynbxpWrzWDQKlSKn
	 FDOGVXwE19kgOffvGzPpF2lsrJ1rwdTJhdwNJ23tukyJt0hcHxefEaHwqEz51UDzgJ
	 +dWS3Zy9MP0nRqQHNXECWb/pG80Yx9P7RWuEy+Gt7Lpx40CvS1ZJk/aF7Qk+uSQ7GL
	 1qeIhQFSY0gKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC3540899;
	Sun, 25 Jan 2026 21:47:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCA8C1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDFFF60A87
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irTKp2_tNt6S for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 140EF60A6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 140EF60A6E
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0285583D5D; Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b5c20285687abbda9ef048d6787eb487735f99e
X-Git-Newrev: 1a813ba4ee24429ab617d179d3b5efe6010333b2
X-Patchwork-Hint: ignore
Message-Id: <20260125214728.0285583D5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/bsh/imx8mn-bsh-smm-s2-pro: exit
 post-build.sh on error
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a813ba4ee24429ab617d179d3b5efe6010333b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
