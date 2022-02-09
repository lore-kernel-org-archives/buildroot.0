Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A319C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA9C82628;
	Wed,  9 Feb 2022 18:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZI_KUe-ZWgck; Wed,  9 Feb 2022 18:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB53682BE5;
	Wed,  9 Feb 2022 18:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06E311BF330
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 023AE40239
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0taOB-LBwA0w for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 18:37:29 +0000 (UTC)
X-Greylist: delayed 01:45:02 by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83CAC40150
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 18:37:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF7B0100006;
 Wed,  9 Feb 2022 18:37:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqD7-0001Lu-JF; Wed, 09 Feb 2022 17:52:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:28 +0100
Message-Id: <20220209165213.4498-63-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 062/107] package/python-sip: drop python2 support
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sip/python-sip.mk | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 1d6c205396..01ccb1ddd5 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -10,19 +10,8 @@ PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
 
-PYTHON_SIP_DEPENDENCIES = qt5base
-
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_SIP_DEPENDENCIES += python
-HOST_PYTHON_SIP_DEPENDENCIES += host-python
-PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON_VERSION_MAJOR)
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_SIP_DEPENDENCIES += python3
-HOST_PYTHON_SIP_DEPENDENCIES += host-python3
-PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON3_VERSION_MAJOR)
-endif
+PYTHON_SIP_DEPENDENCIES = python3 qt5base
+HOST_PYTHON_SIP_DEPENDENCIES = host-python3
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
@@ -41,8 +30,8 @@ define PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
-			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
-			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR) \
+			--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+			--incdir $(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
