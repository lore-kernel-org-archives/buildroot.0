Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA2C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F154A405D9;
	Wed,  9 Feb 2022 21:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ye5d-FelIyBY; Wed,  9 Feb 2022 21:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA8E3405D1;
	Wed,  9 Feb 2022 21:55:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58A8B1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96BAD607BC
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsbTbSVQTlTE for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2067860FE4
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 359348323C; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:16:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d264a96172cfa1c1f515d1160b921c013fa3bd7
X-Git-Newrev: 1e44c7bcd928148ed31ade22512635e562bda7b2
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.359348323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dialog: drop python2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e44c7bcd928148ed31ade22512635e562bda7b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 package/Config.in                        |  1 -
 package/python-dialog/Config.in          | 10 ----------
 package/python-dialog/python-dialog.hash |  5 -----
 package/python-dialog/python-dialog.mk   | 15 ---------------
 5 files changed, 6 insertions(+), 31 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
