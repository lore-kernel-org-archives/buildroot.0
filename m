Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D963C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3604B405CB;
	Wed,  9 Feb 2022 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dM2T0O6hQr8q; Wed,  9 Feb 2022 21:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0737405C5;
	Wed,  9 Feb 2022 21:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D10051BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064794027F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ajiJnCmYora for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D6040543
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 202918323C; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53b288cbe03b6a197af820caad0d77c24678f2ef
X-Git-Newrev: ecee967c03d8215ff3a40eed7c4faa42a14fd137
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.202918323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yieldfrom: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecee967c03d8215ff3a40eed7c4faa42a14fd137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                               |  6 ++++++
 package/Config.in                              |  1 -
 package/python-yieldfrom/Config.in             |  8 --------
 package/python-yieldfrom/python-yieldfrom.hash |  5 -----
 package/python-yieldfrom/python-yieldfrom.mk   | 15 ---------------
 5 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 998ea6b231..47e8d696e0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_YIELDFROM
+	bool "python-yieldfrom removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_TYPING
 	bool "python-typing removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index cfc4522be9..6fb62caa4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1300,7 +1300,6 @@ menu "External python modules"
 	source "package/python-xmodem/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yatl/Config.in"
-	source "package/python-yieldfrom/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
diff --git a/package/python-yieldfrom/Config.in b/package/python-yieldfrom/Config.in
deleted file mode 100644
index 1a063d3128..0000000000
--- a/package/python-yieldfrom/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_YIELDFROM
-	bool "python-yieldfrom"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  A backport of the `yield from` semantic from Python 3.x to
-	  Python 2.7.
-
-	  https://github.com/Nurdok/yieldfrom/
diff --git a/package/python-yieldfrom/python-yieldfrom.hash b/package/python-yieldfrom/python-yieldfrom.hash
deleted file mode 100644
index 7730a1e578..0000000000
--- a/package/python-yieldfrom/python-yieldfrom.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/yieldfrom/json
-md5	fd94120625ac1e69bb5946d5e63182da  yieldfrom-1.0.5.tar.gz
-sha256	eb75e58641410f06083f85013a438f28bceaabfe5af9c3206d5049362c37aca0  yieldfrom-1.0.5.tar.gz
-# Locally computed sha256 checksums
-sha256	b3092d61cce29e25f3799285495095d220e5e015b88c1c70e1e72dae052f21e8  LICENSE
diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
deleted file mode 100644
index c926936ae8..0000000000
--- a/package/python-yieldfrom/python-yieldfrom.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-yieldfrom
-#
-################################################################################
-
-PYTHON_YIELDFROM_VERSION = 1.0.5
-PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
-PYTHON_YIELDFROM_SITE = https://files.pythonhosted.org/packages/4d/f9/395917f574ace618eb234bcbae8df3fabaa9624532d96d1fbd3a20678b1e
-PYTHON_YIELDFROM_SETUP_TYPE = setuptools
-PYTHON_YIELDFROM_LICENSE = MIT
-PYTHON_YIELDFROM_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
