Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BABC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B25340334;
	Wed,  9 Feb 2022 21:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBQSvc83oJj9; Wed,  9 Feb 2022 21:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F363415BF;
	Wed,  9 Feb 2022 21:42:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E71F1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E05283227
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeFnZtgxzk2Q for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48328322E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 049108323E; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 445726415ad7d44dbdd326facc86865f245b1c17
X-Git-Newrev: 480f54219da1593c16018c3f8c61a411eb9e1c04
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.049108323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pexpect: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=480f54219da1593c16018c3f8c61a411eb9e1c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pexpect/python-pexpect.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index a9609cbe79..3efda26825 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -11,14 +11,4 @@ PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
 
-# async.py is not usable with Python 2, and removing is the solution
-# recommended by upstream:
-# https://github.com/pexpect/pexpect/issues/290
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_PEXPECT_REMOVE_ASYNC_PY
-	$(RM) $(@D)/pexpect/_async.py
-endef
-PYTHON_PEXPECT_POST_PATCH_HOOKS += PYTHON_PEXPECT_REMOVE_ASYNC_PY
-endif
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
