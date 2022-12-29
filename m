Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F016C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C05480C39;
	Thu, 29 Dec 2022 09:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C05480C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVb5V9wCZNbe; Thu, 29 Dec 2022 09:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9FE80C04;
	Thu, 29 Dec 2022 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9FE80C04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFB4E1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6B83401EA
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B83401EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqauNksZ2jCV for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F1740151
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F1740151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF9DA87071; Thu, 29 Dec 2022 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:38:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db853e24b534d54f281cecbed0eb17412cdfc710
X-Git-Newrev: 72576a661faf8e9d8021a8b110ce9318a9bc8f38
X-Patchwork-Hint: ignore
Message-Id: <20221229093924.AF9DA87071@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-munch: select missing
 runtime dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=72576a661faf8e9d8021a8b110ce9318a9bc8f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

munch requires python-setuptools and python-six packages at
runtime.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-munch/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-munch/Config.in b/package/python-munch/Config.in
index 9db2623674..ceb9fbaf32 100644
--- a/package/python-munch/Config.in
+++ b/package/python-munch/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_MUNCH
 	bool "python-munch"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Munch is a dictionary that supports attribute-style access,
 	  a la JavaScript.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
