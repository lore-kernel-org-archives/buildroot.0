Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750C7C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC5D4052C;
	Wed,  9 Feb 2022 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZFjQpiWZNmG; Wed,  9 Feb 2022 17:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D940404F8;
	Wed,  9 Feb 2022 17:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2C71BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E0BC82E14
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7lMxQQgKdxM for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B93582D40
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56D27240003;
 Wed,  9 Feb 2022 16:53:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDJ-0001PS-Ur; Wed, 09 Feb 2022 17:53:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:52 +0100
Message-Id: <20220209165213.4498-87-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 086/107]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 ++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../Config.in                                      |  8 --------
 .../python-backports-shutil-get-terminal-size.hash |  5 -----
 .../python-backports-shutil-get-terminal-size.mk   | 14 --------------
 6 files changed, 6 insertions(+), 29 deletions(-)
 delete mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 delete mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 delete mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk

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
index 1d1cf99898..2fd8d4d010 100644
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
