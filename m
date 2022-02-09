Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31750C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19B9415D3;
	Wed,  9 Feb 2022 21:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-63BKVZsVBh; Wed,  9 Feb 2022 21:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559D6415B4;
	Wed,  9 Feb 2022 21:45:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D96D1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4378322E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9a5pTH2_Oas for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB3E483300
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CDC608323E; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7590ba6300a86206defe86646cafe5730cc5391
X-Git-Newrev: 5fbafe603554c741d54792f87e60f2aa943b5a6c
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.CDC608323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmltodict: drop python2
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fbafe603554c741d54792f87e60f2aa943b5a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-xmltodict/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-xmltodict/Config.in b/package/python-xmltodict/Config.in
index cb12392c93..af2bbbf489 100644
--- a/package/python-xmltodict/Config.in
+++ b/package/python-xmltodict/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_XMLTODICT
 	bool "python-xmltodict"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Makes working with XML feel like you are working with JSON.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
