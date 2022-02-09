Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E6AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F5840543;
	Wed,  9 Feb 2022 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOigMlur8EUC; Wed,  9 Feb 2022 21:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40B4F403A7;
	Wed,  9 Feb 2022 21:38:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1848D1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DB434148A
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b18ezk6mhFyH for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BBEF414A2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8290F8323C; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67a90aa2065ad87605e5c37a8f206ed4b6f52fdd
X-Git-Newrev: c45680dd66f8fab32d24963bf8eacb48211c48a2
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.8290F8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txtorcon: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c45680dd66f8fab32d24963bf8eacb48211c48a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-txtorcon/python-txtorcon.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index b8414d96d0..acf586cb8c 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -11,13 +11,4 @@ PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_TXTORCON_RM_PY3_FILE
-	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/txtorcon/controller_py3.py
-endef
-
-PYTHON_TXTORCON_POST_INSTALL_TARGET_HOOKS += PYTHON_TXTORCON_RM_PY3_FILE
-endif
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
