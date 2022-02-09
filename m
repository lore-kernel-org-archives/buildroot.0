Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9191AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4976B40268;
	Wed,  9 Feb 2022 17:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jAgLTzhxeIA; Wed,  9 Feb 2022 17:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587F74156D;
	Wed,  9 Feb 2022 17:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48F9B1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3759F4007D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rs_tTUzJ7C-v for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1037A40083
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 607081C000E;
 Wed,  9 Feb 2022 16:53:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDP-0001Qk-Sf; Wed, 09 Feb 2022 17:53:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:03 +0100
Message-Id: <20220209165213.4498-98-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 097/107] package/python-pyro: drop python2
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
 package/Config.in                    |  1 -
 package/python-pyro/Config.in        | 10 ----------
 package/python-pyro/python-pyro.hash |  5 -----
 package/python-pyro/python-pyro.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/python-pyro/Config.in
 delete mode 100644 package/python-pyro/python-pyro.hash
 delete mode 100644 package/python-pyro/python-pyro.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f99535411d..319057f748 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PYRO
+	bool "python-pyro removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_PYPCAP
 	bool "python-pypcap removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d406d372d3..0d8ff0d4d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1176,7 +1176,6 @@ menu "External python modules"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
-	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysftp/Config.in"
diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
deleted file mode 100644
index 6372a1d376..0000000000
--- a/package/python-pyro/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYRO
-	bool "python-pyro"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  python-pyro is a Python library stands for PYthon Remote
-	  Objects. It is an advanced and powerful Distributed Object
-	  Technology system written entirely in Python, that is
-	  designed to be very easy to use..
-
-	  https://pypi.python.org/pypi/Pyro/
diff --git a/package/python-pyro/python-pyro.hash b/package/python-pyro/python-pyro.hash
deleted file mode 100644
index c22b66ddc4..0000000000
--- a/package/python-pyro/python-pyro.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/pyro/json
-md5 59d4d3f4a8786776c9d7f9051b8f1a69 Pyro-3.16.tar.gz
-# Locally computed
-sha256 1bed508453ef7a7556b51424a58101af2349b662baab7e7331c5cb85dbe7e578 Pyro-3.16.tar.gz
-sha256  7c14017a2f543384bfcde86043758b68d023b47bf09700a7df6dacbae9c82103  LICENSE
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
deleted file mode 100644
index 235575c195..0000000000
--- a/package/python-pyro/python-pyro.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-pyro
-#
-################################################################################
-
-PYTHON_PYRO_VERSION = 3.16
-PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE = https://pypi.python.org/packages/61/68/0978adae315261b87acd216517c2c7f00780396e4d1426c5412458c6a28f
-PYTHON_PYRO_LICENSE = MIT
-PYTHON_PYRO_LICENSE_FILES = LICENSE
-PYTHON_PYRO_CPE_ID_VENDOR = pyro_project
-PYTHON_PYRO_CPE_ID_PRODUCT = pyro
-PYTHON_PYRO_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
