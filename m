Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F49C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D4E60E38;
	Wed,  9 Feb 2022 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sU7bRqvcytSw; Wed,  9 Feb 2022 21:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A6160E45;
	Wed,  9 Feb 2022 21:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFE7D1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E26324056E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XS8wuhajh46G for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E9F640523
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 14B5E81335; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2d0a365decdaf56f62ee39420c63c3d0953b721
X-Git-Newrev: 53b288cbe03b6a197af820caad0d77c24678f2ef
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.14B5E81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=53b288cbe03b6a197af820caad0d77c24678f2ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 package/Config.in                        |  1 -
 package/python-typing/Config.in          |  8 --------
 package/python-typing/python-typing.hash |  5 -----
 package/python-typing/python-typing.mk   | 15 ---------------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8db9558ed4..998ea6b231 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_TYPING
+	bool "python-typing removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_SUBPROCESS32
 	bool "python-subprocess32 removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 18de2a32a5..cfc4522be9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1264,7 +1264,6 @@ menu "External python modules"
 	source "package/python-txdbus/Config.in"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typepy/Config.in"
-	source "package/python-typing/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
diff --git a/package/python-typing/Config.in b/package/python-typing/Config.in
deleted file mode 100644
index 81b7d71b4b..0000000000
--- a/package/python-typing/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_TYPING
-	bool "python-typing"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Type Hints for Python. This is a backport of the standard
-	  library typing module to Python versions older than 3.5.
-
-	  https://docs.python.org/3/library/typing.html
diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
deleted file mode 100644
index f587eb7bfa..0000000000
--- a/package/python-typing/python-typing.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/typing/json
-md5  d6dd450cfe0c8c6547eef09a0491775d  typing-3.10.0.0.tar.gz
-sha256  13b4ad211f54ddbf93e5901a9967b1e07720c1d1b78d596ac6a439641aa1b130  typing-3.10.0.0.tar.gz
-# Locally computed sha256 checksums
-sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
deleted file mode 100644
index dd1d8f29b5..0000000000
--- a/package/python-typing/python-typing.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-typing
-#
-################################################################################
-
-PYTHON_TYPING_VERSION = 3.10.0.0
-PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
-PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/b0/1b/835d4431805939d2996f8772aca1d2313a57e8860fec0e48e8e7dfe3a477
-PYTHON_TYPING_SETUP_TYPE = setuptools
-PYTHON_TYPING_LICENSE = Python-2.0, others
-PYTHON_TYPING_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
