Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21968ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 22:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79166FB03;
	Fri, 16 Sep 2022 22:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79166FB03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyTfKcx7WDf2; Fri, 16 Sep 2022 22:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9F86FAFE;
	Fri, 16 Sep 2022 22:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9F86FAFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7101BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4437484334
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4437484334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvmdkHqhh2qP for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 701F984355
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 701F984355
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E40A83E6F; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:56:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9d97ac7aa00b4662a2d031451c9d7e65028fe8c7
X-Git-Newrev: 01af0a8d55ffc31a667f56da80ea755bb8497874
X-Patchwork-Hint: ignore
Message-Id: <20220916215809.6E40A83E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 docs/manual/prerequisite.txt: add findutils in dependencies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01af0a8d55ffc31a667f56da80ea755bb8497874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 7652817c93a02715e0d334d70118a0d8b6917ca6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
