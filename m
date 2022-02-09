Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DE7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB6A3400D0;
	Wed,  9 Feb 2022 16:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwRNl72hvsGg; Wed,  9 Feb 2022 16:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E1B6404DB;
	Wed,  9 Feb 2022 16:58:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF0F1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3731482D40
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzdyHpohZJFH for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 839AF8194A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3664520007;
 Wed,  9 Feb 2022 16:52:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCr-0001HB-Q5; Wed, 09 Feb 2022 17:52:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:57 +0100
Message-Id: <20220209165213.4498-32-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 031/107] package/ogre: drop python2 support
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ogre/ogre.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 72fd616c0c..3fd2fc4650 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -42,9 +42,8 @@ OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
 	-DCMAKE_CXX_FLAGS="$(OGRE_CXXFLAGS)"
 
 # Enable optional python component if python interpreter is present on the target.
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-OGRE_DEPENDENCIES += host-swig \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+OGRE_DEPENDENCIES += host-swig host-python3
 OGRE_CONF_OPTS += -DOGRE_BUILD_COMPONENT_PYTHON=ON
 else
 OGRE_CONF_OPTS += -DOGRE_BUILD_COMPONENT_PYTHON=OFF
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
