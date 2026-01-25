Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B3ED74EF7
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7973240942;
	Sun, 25 Jan 2026 21:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ED-6HQ7kZt6d; Sun, 25 Jan 2026 21:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B4D408C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377661;
	bh=HEx1y2szZLxEASgZ8X3YpRYVDVlJcfw23p9lY0idwIw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FC9rM8WgBnj5ohKdcYaHaS5fjFkoOgpFrLfPdqZafbI0gmsdnFRRGt0aFSaYLxfsi
	 E92Co+1jOsXy0dqAq2xNyMP+AKbOeTL4y+JlstIHONYahBM//jXIiOPT7LCsm3hTBg
	 NKl8XMWzqrPA63JgOyHefrbMCn3Shnz7yQvZl6LwmqDdbMzr2SM4uoH3jZ+N0ydq95
	 cEj7oF5OEMGOlq26KBktC7AMln/gnBPWD6zxc4ATVamuwzLXoefJs3U2Lh0MwuswZp
	 eiDqh7eDGjgfWDLyg4wACHVwly6EPgjBBX8xoJjTmZtTEEiAUibaO5rbdtdjZOZ4A5
	 xCYDHlZlwRz+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B4D408C0;
	Sun, 25 Jan 2026 21:47:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 547191CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4157E8141F
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xq-W_vnofzbm for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECEFC813FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECEFC813FF
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF2B8364A; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eec14e664c475b6574d2858a3c63b7c6126e91e
X-Git-Newrev: c22dc1b819b3428eb0313afc5216bd69575c1021
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.DBF2B8364A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beagleboard/beaglebone: exit
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

commit: https://git.buildroot.net/buildroot/commit/?id=c22dc1b819b3428eb0313afc5216bd69575c1021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beaglebone/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
index dc84d26eca..dcb923356d 100755
--- a/board/beagleboard/beaglebone/post-build.sh
+++ b/board/beagleboard/beaglebone/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
