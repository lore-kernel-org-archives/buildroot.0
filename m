Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C67E9D418
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147A560F92;
	Wed,  4 Feb 2026 17:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCaICyThi69G; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2123A60FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224800;
	bh=IIKy7NHupwG3nB5ftpVa4tQp8LK9EypP3kj9FaSzX/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qUFnK6nrY50/URIQ4usJSfhKXWsPQgB7rvZA/yFyXM7nYzzsBESvB6H7+k6H3716x
	 hc3KbTtSgs2qAmmDjki5F/xDBkibE54wjWzBqlHLYf23kvJDWtB5UbtVcpDCXr1vXV
	 lX+GWeJkQd4BDOpDm4/AQx4H6nz8yEGVKkeB6n5pjLXwnlr1k+oNIjf3EJFBZ2A5EQ
	 eaduDOiobTfOb9T1O3+aBkAZMKI4VxePKkAAnbvf5qN73nkVqx96Jtj2ZWPqESREno
	 NoWu3hRWABjjcGdFaVXQQzXgfN+K+S/JUVOXEXEGuLVJHyHJ8bRPuTDcVs0cL6qmgN
	 DwT4qczb9Rt5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2123A60FA3;
	Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79BBC173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CCF2403E0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1A00XVz9Vymg for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6E740363
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6E740363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CD7C7FE79; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eff9b51b40693cb16fba3efc9b3f90e1f24407c2
X-Git-Newrev: a19f7f9ecb6388e1950eb2df6c7aa4dbba8e6c5d
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.9CD7C7FE79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] board/ti/common/am6xx:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a19f7f9ecb6388e1950eb2df6c7aa4dbba8e6c5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
