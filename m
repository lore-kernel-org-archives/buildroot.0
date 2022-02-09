Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2107EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABA883163;
	Wed,  9 Feb 2022 17:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwHb0Yrwo-R4; Wed,  9 Feb 2022 17:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA9983211;
	Wed,  9 Feb 2022 17:07:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6FB1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EEEA4010F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FomFPNPe7iRD for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EE54007D
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9CD726000F;
 Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDT-0001RU-7R; Wed, 09 Feb 2022 17:53:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:09 +0100
Message-Id: <20220209165213.4498-104-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 103/107] package/python-dialog: drop python2
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
 Config.in.legacy                         |  6 ++++++
 package/Config.in                        |  1 -
 package/python-dialog/Config.in          | 10 ----------
 package/python-dialog/python-dialog.hash |  5 -----
 package/python-dialog/python-dialog.mk   | 15 ---------------
 5 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 package/python-dialog/Config.in
 delete mode 100644 package/python-dialog/python-dialog.hash
 delete mode 100644 package/python-dialog/python-dialog.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6776048fc4..630194edba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_DIALOG
+	bool "python-dialog removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_CONFIGOBJ
 	bool "python-configobj removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 478a4e6b90..b91e190c8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,7 +994,6 @@ menu "External python modules"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
-	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-distro/Config.in"
diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
deleted file mode 100644
index c1fdb23723..0000000000
--- a/package/python-dialog/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PYTHON_DIALOG
-	bool "python-dialog"
-	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_USE_MMU # dialog
-	select BR2_PACKAGE_DIALOG
-	help
-	  A Python interface to the UNIX dialog utility and
-	  mostly-compatible programs.
-
-	  http://pythondialog.sourceforge.net/
diff --git a/package/python-dialog/python-dialog.hash b/package/python-dialog/python-dialog.hash
deleted file mode 100644
index 8f84e198b2..0000000000
--- a/package/python-dialog/python-dialog.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally computed after verifying
-# https://sourceforge.net/projects/pythondialog/files/pythondialog/3.4.0/python3-pythondialog-3.4.0.tar.bz2.asc
-# with key 9B6F19FB52965E6C21FE76142A205688F8489BDD
-sha256	8978d355c8db6728eeb9e23b39449b14597f1c76cb06dc72462642ca7cde46a0  python2-pythondialog-3.4.0.tar.bz2
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
deleted file mode 100644
index d5d4a4ceb5..0000000000
--- a/package/python-dialog/python-dialog.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-dialog
-#
-################################################################################
-
-PYTHON_DIALOG_VERSION = 3.4.0
-PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
-PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
-PYTHON_DIALOG_LICENSE = LGPL-2.1+
-PYTHON_DIALOG_LICENSE_FILES = COPYING
-PYTHON_DIALOG_SETUP_TYPE = distutils
-PYTHON_DIALOG_DEPENDENCIES = dialog
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
