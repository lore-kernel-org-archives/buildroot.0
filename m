Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB8E7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BAC4227E;
	Sat, 30 Sep 2023 16:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BAC4227E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPCW7LFfDlF6; Sat, 30 Sep 2023 16:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9C2428A5;
	Sat, 30 Sep 2023 16:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9C2428A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F14D1BF870
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E6242241
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E6242241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ng6Ff9pQwTvV for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DBE42238
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DBE42238
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D376D83C18; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c789bcddf0fb17580bef0cdc45b5334a90ecdf13
X-Git-Newrev: 2b506cb2dd031f2bdecc3c90111e31e145211d75
X-Patchwork-Hint: ignore
Message-Id: <20230930164848.D376D83C18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: add missing
 dependency on python-markupsafe
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b506cb2dd031f2bdecc3c90111e31e145211d75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mako imports markupsafe so it needs to be selected when selecting
BR2_PACKAGE_PYTHON_MAKO.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=15628

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
