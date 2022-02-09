Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3182C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745C260C08;
	Wed,  9 Feb 2022 21:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ss2vKMbsUU7E; Wed,  9 Feb 2022 21:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B51E60A93;
	Wed,  9 Feb 2022 21:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96F081BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DAF260FEE
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghUcMzxd2ziW for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE6E160FFA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F327681335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6449cc73ca442aa5c6381552b3725809801df274
X-Git-Newrev: 5fce56ae9b98e061706e6a57005a7b411b6db77f
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.F327681335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-singledispatch: drop
 python2 specific package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fce56ae9b98e061706e6a57005a7b411b6db77f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                         |  6 ++++++
 package/Config.in                                        |  1 -
 package/python-singledispatch/Config.in                  |  9 ---------
 package/python-singledispatch/python-singledispatch.hash |  5 -----
 package/python-singledispatch/python-singledispatch.mk   | 14 --------------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 319057f748..3cd78ccf1c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
+	bool "python-singledispatch removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_PYRO
 	bool "python-pyro removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0d8ff0d4d1..0261463f45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1229,7 +1229,6 @@ menu "External python modules"
 	source "package/python-simplejson/Config.in"
 	source "package/python-simplelogging/Config.in"
 	source "package/python-simplesqlite/Config.in"
-	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
diff --git a/package/python-singledispatch/Config.in b/package/python-singledispatch/Config.in
deleted file mode 100644
index 4abc219f95..0000000000
--- a/package/python-singledispatch/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
-	bool "python-singledispatch"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	help
-	  This library brings functools.singledispatch from
-	  Python 3.4 to Python 2.6-3.3
-
-	  https://pypi.python.org/pypi/singledispatch
diff --git a/package/python-singledispatch/python-singledispatch.hash b/package/python-singledispatch/python-singledispatch.hash
deleted file mode 100644
index c4eec53e30..0000000000
--- a/package/python-singledispatch/python-singledispatch.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=af2fc6a3d6cc5a02d0bf54d909785fcb
-md5     af2fc6a3d6cc5a02d0bf54d909785fcb singledispatch-3.4.0.3.tar.gz
-# Locally computed
-sha256  5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c  singledispatch-3.4.0.3.tar.gz
-sha256  5a724c436f88585973787af91cecf58503cbf09e5c1721c516880614700767ef  setup.py
diff --git a/package/python-singledispatch/python-singledispatch.mk b/package/python-singledispatch/python-singledispatch.mk
deleted file mode 100644
index 7e1d5ac8e0..0000000000
--- a/package/python-singledispatch/python-singledispatch.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-singledispatch
-#
-################################################################################
-
-PYTHON_SINGLEDISPATCH_VERSION = 3.4.0.3
-PYTHON_SINGLEDISPATCH_SOURCE = singledispatch-$(PYTHON_SINGLEDISPATCH_VERSION).tar.gz
-PYTHON_SINGLEDISPATCH_SITE = https://pypi.python.org/packages/source/s/singledispatch
-PYTHON_SINGLEDISPATCH_LICENSE = MIT
-PYTHON_SINGLEDISPATCH_LICENSE_FILES = setup.py
-PYTHON_SINGLEDISPATCH_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
