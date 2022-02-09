Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0877FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBF3F60E4D;
	Wed,  9 Feb 2022 21:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfhzBAI_nt3k; Wed,  9 Feb 2022 21:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FFA60E38;
	Wed,  9 Feb 2022 21:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10EF11BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9CFC60FDA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jn2T6s6XRe9k for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 788A660E55
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7A6A281335; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d83f1f933f45ad5824c594aa939c2772cdb184eb
X-Git-Newrev: 67a90aa2065ad87605e5c37a8f206ed4b6f52fdd
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.7A6A281335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sip: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=67a90aa2065ad87605e5c37a8f206ed4b6f52fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
