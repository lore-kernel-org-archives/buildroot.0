Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4602BE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179B0612BF;
	Wed,  4 Feb 2026 17:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3cuUNk2BBDy; Wed,  4 Feb 2026 17:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B447612C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224963;
	bh=AvJyNymWCsVgJYt/6UpJ1V56TVLO+3rwwmX53tEV6yE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rF+U7RvsfWDCJgLmPpjTj2zKFRU4XBVjCxLxOJMnEpkY526/NUkxjv5G7mBgwo5Sk
	 PLvkh7Dbo0SiKKSI7kKXtz9aDmGuPevdzYeT/EQq8GKehwO2odlQpA0Hgwg1QsFOHM
	 n5H+qPOdl9rTxrDcG6l/vF1uQGuoBdl6NdOXTRrSVPov/hmr010FbcOOVmtObv31ra
	 imAquMZYd2pxALi2pLm6iPiEoYwoGnl2CV7W2S1SHB+73zWN+6cfR1kjXkluA8ehmM
	 H7cfouRXaPw11HJ0RyVoeNjkTEQaqW8pOkSyrSBUre7gXNWIriLwReGq2oXr6Xramo
	 gXsZYMr3ZILQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B447612C6;
	Wed,  4 Feb 2026 17:09:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED19F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B7F4056F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xod5Gtk-3Ns for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325B840576
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325B840576
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2742286977; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f4e8a597aae477f322ae25a434734b1333cfc970
X-Git-Newrev: 4d4a90b211c38260589c935b71848090d7698039
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.2742286977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d4a90b211c38260589c935b71848090d7698039
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
