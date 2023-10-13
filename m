Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B8CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8790482435;
	Fri, 13 Oct 2023 06:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8790482435
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHH4I7tjIxj4; Fri, 13 Oct 2023 06:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC568282C;
	Fri, 13 Oct 2023 06:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC568282C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 693061BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771F44173C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771F44173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdGO30y1dxdY for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03ABA41BC3
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03ABA41BC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E676484690; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:09:20 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 252b6ade2c0cfa2ee37ee274547344d64d785367
X-Git-Newrev: b370a3bfab44c2343deb56935653de6dee28e702
X-Patchwork-Hint: ignore
Message-Id: <20231013062252.E676484690@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/python-mako: add
 missing dependency on python-markupsafe
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

commit: https://git.buildroot.net/buildroot/commit/?id=b370a3bfab44c2343deb56935653de6dee28e702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Mako imports markupsafe so it needs to be selected when selecting
BR2_PACKAGE_PYTHON_MAKO.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=15628

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b506cb2dd031f2bdecc3c90111e31e145211d75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mako/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 442e290efa..e6a10c9c2e 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAKO
 	bool "python-mako"
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  Mako is a template library written in Python. It provides a
 	  familiar, non-XML syntax which compiles into Python modules
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
