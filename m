Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D00C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900FC8131D;
	Mon,  6 Feb 2023 21:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900FC8131D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyRYOLKL-1Jn; Mon,  6 Feb 2023 21:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EE38131E;
	Mon,  6 Feb 2023 21:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9EE38131E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45AD11BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CDE760BB5
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDE760BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZF8AO-UWiOO for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C46760BB1
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C46760BB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B49983D02; Mon,  6 Feb 2023 21:11:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:10:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcd15aa08aab1e8292b93995c44dc765a9801632
X-Git-Newrev: 394afb3c3b97ec4db28b19c27539c4d653f22e5b
X-Patchwork-Hint: ignore
Message-Id: <20230206211127.5B49983D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: check-package should use the
 ignore list
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=394afb3c3b97ec4db28b19c27539c4d653f22e5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, we need to ignore a number of check-package warning checks.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 49ee4ff119..4880b426b5 100644
--- a/Makefile
+++ b/Makefile
@@ -1257,7 +1257,8 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
+	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
+		--ignore-list=$(TOPDIR)/.checkpackageignore
 
 .PHONY: .checkpackageignore
 .checkpackageignore:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
