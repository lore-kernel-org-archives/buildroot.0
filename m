Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44249C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1906405BE;
	Wed,  9 Feb 2022 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvfrVLN-NGl6; Wed,  9 Feb 2022 21:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C54F24027F;
	Wed,  9 Feb 2022 21:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11BEB1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F2F60E67
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7V6Yyah8nc3 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71F6560E38
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 84CF481335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c24cc667978fb7850b45c84dfec9b7c1d884bd9e
X-Git-Newrev: 6ad80649c769e0ebc7f30392da493e26d00d9299
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.84CF481335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-id3: drop python2 specific
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ad80649c769e0ebc7f30392da493e26d00d9299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/python-id3/Config.in       |  9 ---------
 package/python-id3/python-id3.hash |  3 ---
 package/python-id3/python-id3.mk   | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7e85e4cf63..03ea14a512 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_ID3
+	bool "python-id3 removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_FUTURES
 	bool "python-futures removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f09990c544..371a0aab9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,7 +729,6 @@ F:	package/wireless-regdb/
 
 N:	Dominik Faessler <faessler@was.ch>
 F:	package/logsurfer/
-F:	package/python-id3/
 
 N:	Doug Kehn <rdkehn@gmail.com>
 F:	package/nss-pam-ldapd/
diff --git a/package/Config.in b/package/Config.in
index b18d298a1b..0ee1c8ddb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,7 +1049,6 @@ menu "External python modules"
 	source "package/python-hyperframe/Config.in"
 	source "package/python-hyperlink/Config.in"
 	source "package/python-ibmiotf/Config.in"
-	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
 	source "package/python-incremental/Config.in"
diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
deleted file mode 100644
index 6ddfd541bd..0000000000
--- a/package/python-id3/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_ID3
-	bool "python-id3"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  This module allows one to read and manipulate so-called ID3
-	  informational tags on MP3 files through an object-oriented
-	  Python interface.
-
-	  http://id3-py.sourceforge.net/
diff --git a/package/python-id3/python-id3.hash b/package/python-id3/python-id3.hash
deleted file mode 100644
index c83b34a2d9..0000000000
--- a/package/python-id3/python-id3.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  ba612342b59a49cbf9a7eb23a646667757ffda96dc23b67245fc6cd8d90c2022  id3-py_1.2.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
deleted file mode 100644
index d4cdded00c..0000000000
--- a/package/python-id3/python-id3.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-id3
-#
-################################################################################
-
-PYTHON_ID3_VERSION = 1.2
-PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
-PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
-PYTHON_ID3_SETUP_TYPE = distutils
-PYTHON_ID3_LICENSE = GPL-2.0+
-PYTHON_ID3_LICENSE_FILES = COPYING
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
