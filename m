Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264CC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D61683F7C;
	Mon, 20 Feb 2023 23:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D61683F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n2lGSLouzfn; Mon, 20 Feb 2023 23:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D60218144A;
	Mon, 20 Feb 2023 23:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D60218144A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628B61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D1D61ADC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D1D61ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIj4ZAd9TbJL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A90961761
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A90961761
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 046358648F; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:38:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db853e24b534d54f281cecbed0eb17412cdfc710
X-Git-Newrev: 72576a661faf8e9d8021a8b110ce9318a9bc8f38
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.046358648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-munch: select
 missing runtime dependencies
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
