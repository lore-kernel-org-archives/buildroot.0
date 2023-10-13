Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93599CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4990782923;
	Fri, 13 Oct 2023 06:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4990782923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16DHpJGHABWC; Fri, 13 Oct 2023 06:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F36182983;
	Fri, 13 Oct 2023 06:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F36182983
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 015B21BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FBA582376
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FBA582376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7HgSE8ztc-M for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD02826E7
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD02826E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C248846B4; Fri, 13 Oct 2023 06:24:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:09:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 91821019604a369af5d236685062f33824cb2f1e
X-Git-Newrev: 5cb2f87f96ef797979d0e7f6f5b7014ed9f71997
X-Patchwork-Hint: ignore
Message-Id: <20231013062403.8C248846B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-mako: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cb2f87f96ef797979d0e7f6f5b7014ed9f71997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
