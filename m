Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6FEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3BCB41601;
	Wed,  9 Feb 2022 21:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbOx339YuYLN; Wed,  9 Feb 2022 21:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1F9415F9;
	Wed,  9 Feb 2022 21:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 741661BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5082560E6C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8LvMgXrMFIF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F9960E6E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 631B881335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 532dd66e0477968cbed59f380924e9849bfbd04b
X-Git-Newrev: 1727e80dfface4dbddbc84604ed781c12b0174d2
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.631B881335@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-backports-shutil-get-terminal-size: drop python2 specific
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1727e80dfface4dbddbc84604ed781c12b0174d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                           |  6 ++++++
 DEVELOPERS                                                 |  1 -
 package/Config.in                                          |  1 -
 .../python-backports-shutil-get-terminal-size/Config.in    |  8 --------
 .../python-backports-shutil-get-terminal-size.hash         |  5 -----
 .../python-backports-shutil-get-terminal-size.mk           | 14 --------------
 6 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cc1ed8f9d5..89c095a388 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
+	bool "python-backports-shutil-get-terminal-size removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
 	bool "python-backports-abc removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f92bd32a9f..7fe7e4287a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -143,7 +143,6 @@ N:	Andreas Ziegler <br015@umbiko.net>
 F:	package/mpd/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
-F:	package/python-backports-shutil-get-terminal-size/
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
 F:	package/python-pathlib2/
diff --git a/package/Config.in b/package/Config.in
index 46e6b30cdf..fbfc876d89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,7 +941,6 @@ menu "External python modules"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
-	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
diff --git a/package/python-backports-shutil-get-terminal-size/Config.in b/package/python-backports-shutil-get-terminal-size/Config.in
deleted file mode 100644
index 392e05a282..0000000000
--- a/package/python-backports-shutil-get-terminal-size/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
-	bool "python-backports-shutil-get-terminal-size"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  A backport of the get_terminal_size function from Python
-	  3.3's shutil.
-
-	  https://pypi.python.org/pypi/backports.shutil_get_terminal_size
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
deleted file mode 100644
index 40883a4e3b..0000000000
--- a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/backports.shutil_get_terminal_size/json
-md5 03267762480bd86b50580dc19dff3c66 backports.shutil_get_terminal_size-1.0.0.tar.gz
-# Locally computed
-sha256  713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80  backports.shutil_get_terminal_size-1.0.0.tar.gz
-sha256  9edd99f8c339cddbfe36a9707e671fccf245b3e50b80eec0877dccec87a2dfe4  LICENSE
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
deleted file mode 100644
index 7c24b196f2..0000000000
--- a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-backports-shutil-get-terminal-size
-#
-################################################################################
-
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION = 1.0.0
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SOURCE = backports.shutil_get_terminal_size-$(PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION).tar.gz
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SITE = https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SETUP_TYPE = setuptools
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE = MIT
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
