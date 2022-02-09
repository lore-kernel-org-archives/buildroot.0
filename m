Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD27C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BE3F404EE;
	Wed,  9 Feb 2022 17:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7S6THxERAkL; Wed,  9 Feb 2022 17:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B28540529;
	Wed,  9 Feb 2022 17:10:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE571BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2352660BD5
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfM5wJmFttpO for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6507D60B05
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7C3B4C450C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74FB4100009;
 Wed,  9 Feb 2022 16:52:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCy-0001JE-Vr; Wed, 09 Feb 2022 17:52:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:11 +0100
Message-Id: <20220209165213.4498-46-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 045/107] package/python-libconfig: drop python2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-libconfig/python-libconfig.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
index 2db7e99cf3..c7d87f408a 100644
--- a/package/python-libconfig/python-libconfig.mk
+++ b/package/python-libconfig/python-libconfig.mk
@@ -14,14 +14,8 @@ PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
 
 PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_LIBCONFIG_PYVER = $(PYTHON_VERSION_MAJOR)
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_LIBCONFIG_PYVER = $(PYTHON3_VERSION_MAJOR)
-endif
-
 define PYTHON_LIBCONFIG_FIX_SETUP
-	$(SED) 's/boost_python/boost_python$(subst .,,$(PYTHON_LIBCONFIG_PYVER))/g' \
+	$(SED) 's/boost_python/boost_python$(subst .,,$(PYTHON3_VERSION_MAJOR))/g' \
 		$(@D)/setup.py
 endef
 PYTHON_LIBCONFIG_POST_PATCH_HOOKS += PYTHON_LIBCONFIG_FIX_SETUP
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
