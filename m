Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86F3540538;
	Wed,  9 Feb 2022 21:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrdIGIAi_duz; Wed,  9 Feb 2022 21:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 696DA405BC;
	Wed,  9 Feb 2022 21:42:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126401BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00CE441515
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Myib5D1AEwxg for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B878414A2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4132081335; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:16:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e44c7bcd928148ed31ade22512635e562bda7b2
X-Git-Newrev: ef2c5ce5d1687384f7fb0cce019af8168e3e04df
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.4132081335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-enum: drop python2 specific
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef2c5ce5d1687384f7fb0cce019af8168e3e04df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     |  6 ++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/python-enum/Config.in        | 12 ------------
 package/python-enum/python-enum.hash |  5 -----
 package/python-enum/python-enum.mk   | 14 --------------
 6 files changed, 6 insertions(+), 33 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
