Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0393C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7622C403A7;
	Wed,  9 Feb 2022 21:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKJ28es_N-VA; Wed,  9 Feb 2022 21:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF67405BC;
	Wed,  9 Feb 2022 21:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C36D71BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E7BC60FF7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKEx5xbykwrH for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4657B60E5A
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 57DD581335; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:16:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbd2900ba81c4bb0ce9664850fcd1c3ec7de2a60
X-Git-Newrev: 71d5d8c1082bfd94ce066a9d5b03e5d573799e8b
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.57DD581335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-functools32: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=71d5d8c1082bfd94ce066a9d5b03e5d573799e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  6 ++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/python-functools32/Config.in               |  8 --------
 package/python-functools32/python-functools32.hash |  4 ----
 package/python-functools32/python-functools32.mk   | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7df95691ca..49c24e61bf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_FUNCTOOLS32
+	bool "python-functools32 removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_ENUM34
 	bool "python-enum34 removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 92abe8a6dd..0e759bc168 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2243,7 +2243,6 @@ F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
-F:	package/python-functools32/
 F:	package/python-psutil/
 F:	package/python-request-id/
 F:	package/python-semver/
diff --git a/package/Config.in b/package/Config.in
index 18388f82c3..1a9f3e29d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1026,7 +1026,6 @@ menu "External python modules"
 	source "package/python-flup/Config.in"
 	source "package/python-fonttools/Config.in"
 	source "package/python-frozenlist/Config.in"
-	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
 	source "package/python-git/Config.in"
 	source "package/python-gitdb2/Config.in"
diff --git a/package/python-functools32/Config.in b/package/python-functools32/Config.in
deleted file mode 100644
index 606341d828..0000000000
--- a/package/python-functools32/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_FUNCTOOLS32
-	bool "python-functools32"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Backport of the functools module from Python 3.2.3 for use on
-	  2.7 and PyPy.
-
-	  https://github.com/MiCHiLU/python-functools32
diff --git a/package/python-functools32/python-functools32.hash b/package/python-functools32/python-functools32.hash
deleted file mode 100644
index 606de81774..0000000000
--- a/package/python-functools32/python-functools32.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# md5 from https://pypi.python.org/pypi/functools32/json, sha256 locally computed
-md5	09f24ffd9af9f6cd0f63cb9f4e23d4b2  functools32-3.2.3-2.tar.gz
-sha256	f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d  functools32-3.2.3-2.tar.gz
-sha256	3f9ea6b89abe1556b72aff67b987d64c8272564815cd6a2832e6c4f6abdfe3b1  LICENSE
diff --git a/package/python-functools32/python-functools32.mk b/package/python-functools32/python-functools32.mk
deleted file mode 100644
index 8a88bb2a7f..0000000000
--- a/package/python-functools32/python-functools32.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-functools32
-#
-################################################################################
-
-PYTHON_FUNCTOOLS32_VERSION = 3.2.3-2
-PYTHON_FUNCTOOLS32_SOURCE = functools32-$(PYTHON_FUNCTOOLS32_VERSION).tar.gz
-PYTHON_FUNCTOOLS32_SITE = https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db
-PYTHON_FUNCTOOLS32_SETUP_TYPE = distutils
-PYTHON_FUNCTOOLS32_LICENSE = Python-2.0
-PYTHON_FUNCTOOLS32_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
