Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0617260675;
	Wed,  9 Feb 2022 17:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_pudd5rMoBV; Wed,  9 Feb 2022 17:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B4660E43;
	Wed,  9 Feb 2022 17:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E29B1BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C509C60B05
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmY1tru_2f4I for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93CEE60DF9
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 603FDD34DB
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3386D1C0004;
 Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDO-0001QW-Ph; Wed, 09 Feb 2022 17:53:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:01 +0100
Message-Id: <20220209165213.4498-96-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 095/107] package/python-pathlib2: drop python2
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
 Config.in.legacy                             |  6 ++++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/python-pathlib2/Config.in            | 13 -------------
 package/python-pathlib2/python-pathlib2.hash |  5 -----
 package/python-pathlib2/python-pathlib2.mk   | 14 --------------
 6 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 package/python-pathlib2/Config.in
 delete mode 100644 package/python-pathlib2/python-pathlib2.hash
 delete mode 100644 package/python-pathlib2/python-pathlib2.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 386f94e72b..74317a2d7c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PATHLIB2
+	bool "python-pathlib2 removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_PAM
 	bool "python-pam removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a6ea3793ea..07f9304766 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -145,7 +145,6 @@ F:	package/mpd/
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
-F:	package/python-pathlib2/
 F:	package/python-pickleshare/
 F:	package/python-scandir/
 F:	package/python-simplegeneric/
diff --git a/package/Config.in b/package/Config.in
index 73e8901a1d..3c55dec6c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1118,7 +1118,6 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
-	source "package/python-pathlib2/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
deleted file mode 100644
index e28de4c12e..0000000000
--- a/package/python-pathlib2/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_PYTHON_PATHLIB2
-	bool "python-pathlib2"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	help
-	  Object-oriented filesystem paths.
-
-	  The goal of pathlib2 is to provide a backport of standard
-	  pathlib module which tracks the standard library module, so
-	  all the newest features of the standard pathlib can be used
-	  also on older Python versions.
-
-	  https://pypi.python.org/pypi/pathlib2
diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
deleted file mode 100644
index ebd197b62e..0000000000
--- a/package/python-pathlib2/python-pathlib2.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/pathlib2/json
-md5  e50a0cf94e406c5110b3aed535626e9e  pathlib2-2.3.6.tar.gz
-sha256  7d8bcb5555003cdf4a8d2872c538faa3a0f5d20630cb360e518ca3b981795e5f  pathlib2-2.3.6.tar.gz
-# Locally computed sha256 checksums
-sha256  861f813004a151ac77024ad445794653809ddf8a7572aee7bab18d11df2ba1c6  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
deleted file mode 100644
index 4bcfea78fb..0000000000
--- a/package/python-pathlib2/python-pathlib2.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pathlib2
-#
-################################################################################
-
-PYTHON_PATHLIB2_VERSION = 2.3.6
-PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/df/16/e9d6bcf1aed52a55bc1696324ab22586716053b3e97b85266e0f3ad36bae
-PYTHON_PATHLIB2_LICENSE = MIT
-PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
-PYTHON_PATHLIB2_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
