Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D99C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEF160E4C;
	Wed,  9 Feb 2022 21:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95QocAcGrU10; Wed,  9 Feb 2022 21:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C91860E45;
	Wed,  9 Feb 2022 21:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 050C01BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 017C341559
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLqfPTDeAz7k for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 459B04151F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4CA068323C; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:16:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef2c5ce5d1687384f7fb0cce019af8168e3e04df
X-Git-Newrev: cbd2900ba81c4bb0ce9664850fcd1c3ec7de2a60
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.4CA068323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-enum34: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbd2900ba81c4bb0ce9664850fcd1c3ec7de2a60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-enum34/Config.in          | 12 ------------
 package/python-enum34/python-enum34.hash |  5 -----
 package/python-enum34/python-enum34.mk   | 17 -----------------
 6 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bc5df0e489..7df95691ca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_ENUM34
+	bool "python-enum34 removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_ENUM
 	bool "python-enum removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0716729cee..92abe8a6dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2243,7 +2243,6 @@ F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
-F:	package/python-enum34/
 F:	package/python-functools32/
 F:	package/python-psutil/
 F:	package/python-request-id/
diff --git a/package/Config.in b/package/Config.in
index f134b626be..18388f82c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1010,7 +1010,6 @@ menu "External python modules"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
-	source "package/python-enum34/Config.in"
 	source "package/python-esptool/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
diff --git a/package/python-enum34/Config.in b/package/python-enum34/Config.in
deleted file mode 100644
index 2511a350e0..0000000000
--- a/package/python-enum34/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PYTHON_ENUM34
-	bool "python-enum34"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Python 3.4 Enum backported to 2.x.
-
-	  An enumeration is a set of symbolic names (members) bound to
-	  unique, constant values. Within an enumeration, the members
-	  can be compared by identity, and the enumeration itself can
-	  be iterated over.
-
-	  https://pypi.python.org/pypi/enum34
diff --git a/package/python-enum34/python-enum34.hash b/package/python-enum34/python-enum34.hash
deleted file mode 100644
index e43e00a5fe..0000000000
--- a/package/python-enum34/python-enum34.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/enum34/json
-md5  b5ac0bb5ea9e830029599e410d09d3b5  enum34-1.1.10.tar.gz
-# Locally computed
-sha256  cce6a7477ed816bd2542d03d53db9f0db935dd013b70f336a95c73979289f248  enum34-1.1.10.tar.gz
-sha256  88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  enum/LICENSE
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
deleted file mode 100644
index 0bd00508aa..0000000000
--- a/package/python-enum34/python-enum34.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python-enum34
-#
-################################################################################
-
-PYTHON_ENUM34_VERSION = 1.1.10
-PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
-PYTHON_ENUM34_SITE = https://files.pythonhosted.org/packages/11/c4/2da1f4952ba476677a42f25cd32ab8aaf0e1c0d0e00b89822b835c7e654c
-PYTHON_ENUM34_SETUP_TYPE = setuptools
-PYTHON_ENUM34_LICENSE = BSD-3-Clause
-PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
-PYTHON_ENUM34_CPE_ID_VENDOR = python
-PYTHON_ENUM34_CPE_ID_PRODUCT = enum34
-
-$(eval $(python-package))
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
