Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643C2ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001E54173D;
	Fri, 16 Sep 2022 21:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001E54173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0k6L6GrEVpb; Fri, 16 Sep 2022 21:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A989541DA7;
	Fri, 16 Sep 2022 21:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A989541DA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC0251BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BD2640C20
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BD2640C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f_lKkfV2elU for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0E640C18
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB0E640C18
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A81F783DF5; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:56:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5955fdee9cfa610b08906e349e53953ad70388d2
X-Git-Newrev: b1ea4af36a6f3e760280316c952e2313bf76c566
X-Patchwork-Hint: ignore
Message-Id: <20220916215759.A81F783DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1ea4af36a6f3e760280316c952e2313bf76c566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
