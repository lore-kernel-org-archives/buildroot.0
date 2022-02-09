Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEB041515;
	Wed,  9 Feb 2022 21:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ve8vR6XzlbU8; Wed,  9 Feb 2022 21:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CAC41559;
	Wed,  9 Feb 2022 21:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 520A41BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E079540567
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5HN5CBu5lls for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFF974053B
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E67478323C; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aec1a69a202352e61264a20561dcd729b733eb54
X-Git-Newrev: 6449cc73ca442aa5c6381552b3725809801df274
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.E67478323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyro: drop python2 specific
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

commit: https://git.buildroot.net/buildroot/commit/?id=6449cc73ca442aa5c6381552b3725809801df274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     |  6 ++++++
 package/Config.in                    |  1 -
 package/python-pyro/Config.in        | 10 ----------
 package/python-pyro/python-pyro.hash |  5 -----
 package/python-pyro/python-pyro.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 32 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
