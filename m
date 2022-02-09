Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B075C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A4940872;
	Wed,  9 Feb 2022 21:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tF80GvyhYmHt; Wed,  9 Feb 2022 21:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771A740504;
	Wed,  9 Feb 2022 21:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 581A21BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F97C8317B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InwkH3mFq3og for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53640832C7
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 68C598323C; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47e031b9b68bf6a8143dfbd1b0c2953eaecf2a95
X-Git-Newrev: 0cdc510d7b62562ae1e9018cec26a50f4b33dba6
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.68C598323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cdc510d7b62562ae1e9018cec26a50f4b33dba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sentry-sdk/python-sentry-sdk.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 556f03e137..9238b7fb1c 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -11,14 +11,4 @@ PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_SENTRY_SDK_RM_PY3_FILES
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/python*/site-packages/sentry_sdk/integrations/,\
-		aiohttp.py asgi.py django/asgi.py httpx.py sanic.py tornado.py)
-endef
-
-PYTHON_SENTRY_SDK_POST_INSTALL_TARGET_HOOKS += PYTHON_SENTRY_SDK_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
