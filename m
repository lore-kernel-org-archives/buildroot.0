Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104F8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 18:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D808271A;
	Wed,  9 Feb 2022 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HrZCr4pS4Qu; Wed,  9 Feb 2022 18:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAA382628;
	Wed,  9 Feb 2022 18:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 033CE1BF330
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 006D160AA4
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2MpDu2zfgtF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 18:37:28 +0000 (UTC)
X-Greylist: delayed 01:44:56 by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB16060AEA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 18:37:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BB4FFF805;
 Wed,  9 Feb 2022 18:37:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqD7-0001Lp-3R; Wed, 09 Feb 2022 17:52:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:27 +0100
Message-Id: <20220209165213.4498-62-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 061/107] package/python-setuptools: drop python2
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

For the target.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/Config.in            |  6 ++----
 package/python-setuptools/python-setuptools.mk | 16 ----------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index f203d0f814..28228534f8 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Download, build, install, upgrade, and uninstall Python
 	  packages.
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 8bca852fe2..04b872fb79 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-# For the target variant, we adapt the version depending on whether
-# Python 3.x or 2.x is selected for the target.
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
 PYTHON_SETUPTOOLS_VERSION = 60.7.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
-else # Python
-PYTHON_SETUPTOOLS_VERSION = 44.0.0
-PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
-endif
 
 # The host variant is only for Python 2.x, so we need to use 44.0.0.
 HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
@@ -30,14 +22,6 @@ PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
-endef
-endif
-
 define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(HOST_PYTHON_SETUPTOOLS_SOURCE)
 	mv $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)/* $(@D)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
