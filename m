Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87915D7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547D060B00;
	Sun, 25 Jan 2026 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se-fMvWRVLXN; Sun, 25 Jan 2026 21:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A81B60B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377660;
	bh=GkY0oPXhyVctmSGfIsKR5mnk3vpAuLbNvP1NZfpL+mE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hGQdK63ajNzCXlQvi4OTbU4Dxqv/AIw7cFNCWBI7rZhQNhWUh00nPC05aNjVDuOxa
	 PHJG9BF5ITjA4s1Pu8Rw58axzTBMmbHDOr7F3eIHHqbYSGqV+NUhKzDYg9Z7vuick4
	 21H3W5xrU76BzkvjnwiFOFS82wlDPehLzRq1SLTaVAkzKuBEbfGxMgAbhbFsTFoiY5
	 ipbyHV10CxY0egoy1WW+Z2lG0I/mRbYGl6QRNPZTnNPsbAUcgO7y5OXNfmfO0QN4Ii
	 cRNBZHUf4vDe7AjDnH+77RsR/F9HhYOifiJlqWUFghF7qFiBWyhTfwC6noAVaDKGXA
	 ljN3b9/QyJcsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A81B60B02;
	Sun, 25 Jan 2026 21:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40A01972
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E860C813A2
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xx4rO7I8VyIX for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C955E81341
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C955E81341
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B760E876F2; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c8ecc05c6b1c30141808910653dc109a27835cc
X-Git-Newrev: d2dcd7547c9dc4357e588cf5425ccd6242d91cf8
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.B760E876F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/common/am6xx: remove debug flag
 from post-build script
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2dcd7547c9dc4357e588cf5425ccd6242d91cf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the '-x' option from the shebang, which was a leftover from the
debugging phase and not intended for the final submission.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/ti/common/am6xx/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/ti/common/am6xx/post-build.sh b/board/ti/common/am6xx/post-build.sh
index d066e28fd0..e3ff4d7f12 100755
--- a/board/ti/common/am6xx/post-build.sh
+++ b/board/ti/common/am6xx/post-build.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -x
+#!/bin/sh
 
 # genimage will need to find the extlinux.conf
 # in the binaries directory
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
