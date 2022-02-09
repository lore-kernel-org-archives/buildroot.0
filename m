Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5633C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89680830FB;
	Wed,  9 Feb 2022 17:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khDRH6NB9g1I; Wed,  9 Feb 2022 17:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DE483077;
	Wed,  9 Feb 2022 17:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0DC1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 188B660D73
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6npDH7stbEie for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D77A860BAF
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37442240009;
 Wed,  9 Feb 2022 16:53:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDT-0001Rb-QR; Wed, 09 Feb 2022 17:53:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:10 +0100
Message-Id: <20220209165213.4498-105-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 104/107] package/python-enum: drop python2
 specific package
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     |  6 ++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/python-enum/Config.in        | 12 ------------
 package/python-enum/python-enum.hash |  5 -----
 package/python-enum/python-enum.mk   | 14 --------------
 6 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/python-enum/Config.in
 delete mode 100644 package/python-enum/python-enum.hash
 delete mode 100644 package/python-enum/python-enum.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 630194edba..bc5df0e489 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_ENUM
+	bool "python-enum removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_DIALOG
 	bool "python-dialog removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8112873f14..0716729cee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2243,7 +2243,6 @@ F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
-F:	package/python-enum/
 F:	package/python-enum34/
 F:	package/python-functools32/
 F:	package/python-psutil/
diff --git a/package/Config.in b/package/Config.in
index b91e190c8e..f134b626be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1010,7 +1010,6 @@ menu "External python modules"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
-	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-esptool/Config.in"
 	source "package/python-falcon/Config.in"
diff --git a/package/python-enum/Config.in b/package/python-enum/Config.in
deleted file mode 100644
index e26ae8bf97..0000000000
--- a/package/python-enum/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PYTHON_ENUM
-	bool "python-enum"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Robust enumerated type support in Python
-
-	  An enumeration object is an immutable sequence object built
-	  from a sequence of strings. Each value is also available as
-	  an attribute. Such values are constant. Comparisons and
-	  enumeration are supported.
-
-	  https://pypi.python.org/pypi/enum
diff --git a/package/python-enum/python-enum.hash b/package/python-enum/python-enum.hash
deleted file mode 100644
index 4b4b369e34..0000000000
--- a/package/python-enum/python-enum.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/enum/json
-md5 e7d170e3f84435b77058de625c96ef58 enum-0.4.7.tar.gz
-sha256 8c7cf3587eda51008bcc1eed99ea2c331ccd265c231dbaa95ec5258d3dc03100 enum-0.4.7.tar.gz
-# Locally computed sha256 checksums
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
deleted file mode 100644
index f1de8a9312..0000000000
--- a/package/python-enum/python-enum.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-enum
-#
-################################################################################
-
-PYTHON_ENUM_VERSION = 0.4.7
-PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
-PYTHON_ENUM_SITE = https://files.pythonhosted.org/packages/02/a0/32e1d5a21b703f600183e205aafc6773577e16429af5ad3c3f9b956b07ca
-PYTHON_ENUM_SETUP_TYPE = setuptools
-PYTHON_ENUM_LICENSE = GPL-3.0+
-PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL-3
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
