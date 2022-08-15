Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02993C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2A2402BC;
	Mon, 15 Aug 2022 20:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F2A2402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c0X7Py3PXBr; Mon, 15 Aug 2022 20:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC0040291;
	Mon, 15 Aug 2022 20:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC0040291
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1B181BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD2E481764
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2E481764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1plpXB08QzG for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:21:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2C1F81761
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C1F81761
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC702876E3; Mon, 15 Aug 2022 20:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 22:21:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 612ae4bd180de764becb48f609ffe836d362a87b
X-Git-Newrev: 7652817c93a02715e0d334d70118a0d8b6917ca6
X-Patchwork-Hint: ignore
Message-Id: <20220815200708.DC702876E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/prerequisite.txt: add
 findutils in dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7652817c93a02715e0d334d70118a0d8b6917ca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "find" and "xargs" commands, from the "findutils" package are used
during the build process. See for example [1].

Even if it's a quite common package which is almost sure to be present
on the host, it should be listed here. When writing new recipes, hooks
and scripts, it is generally safe and portable to restrict to the
host dependencies listed in those prerequisites.

This commit just add the missing "findutils" package in this list.

[1] https://git.buildroot.org/buildroot/tree/Makefile?h=2022.05.1#n737

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 763fe79041..48be489f90 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -37,6 +37,7 @@ between distributions).
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
 ** +bc+
+** +findutils+
 
 * Source fetching tools:
 ** +wget+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
