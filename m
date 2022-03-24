Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2091681332;
	Thu, 24 Mar 2022 19:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_sPS5pw5tZS; Thu, 24 Mar 2022 19:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C6881281;
	Thu, 24 Mar 2022 19:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68021BF379
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5D3780B45
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAytD8CCPpDd for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07B358001C
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:48:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D6EC85BA3; Thu, 24 Mar 2022 19:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 20:40:06 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 294b6e050d2aaf164770d05ececc270da845088f
X-Git-Newrev: fed11362152e8d302b5895c2a3f5c0cbc187a932
X-Patchwork-Hint: ignore
Message-Id: <20220324193927.0D6EC85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-txdbus:
 drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=fed11362152e8d302b5895c2a3f5c0cbc187a932
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Txdbus is built on top of twisted, which is python3 only since commit
f1db1922e460d4f (package/python-twisted: Needs python 3), so propagate the
python3 dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txdbus/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index f38bbf93f0..df77a1f573 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
+	depends on BR2_PACKAGE_PYTHON3 # python-twisted
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
