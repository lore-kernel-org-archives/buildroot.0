Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D193C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 213DF404FA;
	Wed,  9 Feb 2022 17:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iMPaUuDupWy; Wed,  9 Feb 2022 17:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC69404DB;
	Wed,  9 Feb 2022 17:01:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33FC31BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2DAE40150
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tD66LDmizAk for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01EBC400D0
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F754100008;
 Wed,  9 Feb 2022 16:52:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqD3-0001KT-1R; Wed, 09 Feb 2022 17:52:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:19 +0100
Message-Id: <20220209165213.4498-54-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 053/107] package/python-pyqt5: drop python2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index b05043563e..af32f63796 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -19,14 +19,6 @@ PYTHON_PYQT5_MODULES = \
 	$(if $(BR2_PACKAGE_QT5BASE_PRINTSUPPORT),QtPrintSupport) \
 	$(if $(BR2_PACKAGE_QT5BASE_XML),QtXml)
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
-PYTHON_PYQT5_RM_PORT_BASE = port_v3
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
-PYTHON_PYQT5_RM_PORT_BASE = port_v2
-endif
-
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 PYTHON_PYQT5_MODULES += QtWidgets
 
@@ -159,7 +151,7 @@ PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += QT5_QT_CONF_FIXUP
 
 PYTHON_PYQT5_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
-	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
+	--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--qmake $(HOST_DIR)/bin/qmake \
 	--sysroot $(STAGING_DIR)/usr \
 	-w --confirm-license \
@@ -186,8 +178,8 @@ endef
 # __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
 define PYTHON_PYQT5_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
-	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/__init__.py
-	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages/PyQt5/uic/$(PYTHON_PYQT5_RM_PORT_BASE)
+	touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/__init__.py
+	$(RM) -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/uic/port_v2
 endef
 
 $(eval $(generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
