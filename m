Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD0E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EFEC6103E;
	Wed,  4 Feb 2026 17:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1r2mdllzCsP; Wed,  4 Feb 2026 17:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FCFE6127E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224939;
	bh=a8EPBaHoJ2Y5uf9/FxTX6lcZXT+bCq/XFPlgEWnS6ew=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TgCEbrCXLYIP2PbJryHZ139ekM3sVlqT6Wzds5PryHhCID1wFIQBivnOnBQSjlN7+
	 saTbjU5VRwvjDFHLDPmXjDkGsoqgLjrS8vw8IfByjJrrV22tR5JPvCjJ2N7L+Y4p56
	 paJJQt4GiaHGfUlAqq14PaczAOXvUhzfAiYCzoBQn8VlmzP7OLpaykNyQRvWldXXdS
	 CDTwX5MAIZPHUqwhiX4mGbs7oWKS3VbVHFwpKqLX2nF/ATXhye5757lKE/QxEe9oMW
	 N2w2pcufblyYNy/w7qcbh/QBf33hAvPRvs2RR70kOJ2hUI8+q23dOx4Nkl5t2GtAzY
	 Ob4YdXhaWygWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCFE6127E;
	Wed,  4 Feb 2026 17:08:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDAEF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 478DE40562
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eJzfnDxtVWs for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14804056A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14804056A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E45938697A; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 678ec663ed713e621004f167cf4abe927aa4068d
X-Git-Newrev: f9255641795381605c301ac2821031c01761d7fe
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.E45938697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] board/ti/common/am6xx:
 remove debug flag from post-build script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9255641795381605c301ac2821031c01761d7fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Remove the '-x' option from the shebang, which was a leftover from the
debugging phase and not intended for the final submission.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d2dcd7547c9dc4357e588cf5425ccd6242d91cf8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
