Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3E1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6FE813CC;
	Sun,  6 Feb 2022 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_8unYkLT-3m; Sun,  6 Feb 2022 09:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C4EF813CD;
	Sun,  6 Feb 2022 09:45:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1411BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3092240362
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5a4oCWGHQCZ for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:45:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B0F40361
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:45:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51ABF60007;
 Sun,  6 Feb 2022 09:45:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nGe6W-0002z7-Vh; Sun, 06 Feb 2022 10:45:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 10:45:02 +0100
Message-Id: <20220206094504.11415-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/avahi: drop unneeded
 am_cv_path_PYTHON
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is not used by the configure script and refer to PYTHON_TARGET_BINARY
which was dropped back in 2010 by commit e3418f69cf (python: convert to
autotargets, bump to 2.7.1, many improvements), so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 13e2106014..04c4164af6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -107,7 +107,6 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
-	am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
 	am_cv_python_version=$(PYTHON_VERSION) \
 	am_cv_python_platform=linux2 \
 	am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
