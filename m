Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49CFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75D083032;
	Wed,  9 Feb 2022 17:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lX019uwMpSKu; Wed,  9 Feb 2022 17:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C1881B26;
	Wed,  9 Feb 2022 17:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80E3E1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C8FA40150
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvJ_fVr1lotF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D83740146
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73E3CC0004;
 Wed,  9 Feb 2022 16:52:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqD2-0001KA-1U; Wed, 09 Feb 2022 17:52:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:17 +0100
Message-Id: <20220209165213.4498-52-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 051/107] package/python-pymodbus: drop python2
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
Cc: Falco Hyfing <hyfinglists@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pymodbus/python-pymodbus.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 9135a4d0c4..d96e21a55c 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -11,13 +11,4 @@ PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_PYMODBUS_RM_PY3_FILES
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pymodbus/client/asynchronous/asyncio
-endef
-
-PYTHON_PYMODBUS_POST_INSTALL_TARGET_HOOKS += PYTHON_PYMODBUS_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
