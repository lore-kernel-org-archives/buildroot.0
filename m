Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A19E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE94960FAC;
	Wed,  4 Feb 2026 17:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFRcm4PH7iVV; Wed,  4 Feb 2026 17:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA1760A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224849;
	bh=j8XqpvbKwJ9Pw/77WS6+DUxsvzsZDonvgo+PXUsQ4PY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HBxJQjUDa6kwpJ9b/bsDuzEG3AMkqbqAJXz/uOqnQNK9DgoDontGp9yiZjOIoprKt
	 U0vXQGzKJZwqYekRmuch12w09yGU2OI8OxvRWteKhODQLm2WlttvR+mwtLWLR2dSSY
	 slYz2MqpmprY7HaRv7lRubwBdXiIUcabX82KaKguD/CwMw5M+VJB028dfTnpPrCEiH
	 KTs4qYx6r+bEGUUk/264KNL+nFBSevLEewe3pIfx7m57BusomY4NbjW7mhH5IGN3X3
	 6HaSfJw58XzeYlqbkZkEwx0ihjnUZYZBuCUZH8q5ph0urjNfojKthuuj1kHkbnB9aN
	 Q5EEmplgZj6Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA1760A63;
	Wed,  4 Feb 2026 17:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F96173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B7EB83CBB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRu5x8kZPcK4 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3D883DB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF3D883DB1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D532686976; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3082436ff1667ae5f70581e2854877aa40ff3209
X-Git-Newrev: 428d7a977a2a538702c3b2f37617ce68f76e318b
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.D532686976@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/bsh/imx8mn-bsh-smm-s2: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/428d7a977a2a538702c3b2f37617ce68f76e318b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fb847e83797022dceedbcf92c5c2c72cffc32883)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
index 49df4cd6fb..ede1738ecb 100755
--- a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 
 cp ${BOARD_DIR}/nand-full.lst ${BINARIES_DIR}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
