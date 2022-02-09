Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C0DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6DFA4064C;
	Wed,  9 Feb 2022 21:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7dqJvwPOrhC; Wed,  9 Feb 2022 21:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BDF0405D9;
	Wed,  9 Feb 2022 21:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06E451BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60A9C80B0C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_mtRrdsY-Un for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 923DF832A9
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A79418323E; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e990a926797edadb6b0e8b94c85b9d52a79f47ae
X-Git-Newrev: 82e096a23e67961feef3e41a326aefe34cc974b8
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.A79418323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mad: drop python2 specific
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

commit: https://git.buildroot.net/buildroot/commit/?id=82e096a23e67961feef3e41a326aefe34cc974b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/python-mad/Config.in       |  9 ---------
 package/python-mad/python-mad.hash |  3 ---
 package/python-mad/python-mad.mk   | 29 -----------------------------
 6 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 14b26408fe..f6607deeeb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_MAD
+	bool "python-mad removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_IPADDRESS
 	bool "python-ipaddress removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index dbed9df4b5..9fb51b4481 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2804,7 +2804,6 @@ F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
-F:	package/python-mad/
 F:	package/python-serial/
 F:	package/python-unittest-xml-reporting/
 F:	package/qextserialport/
diff --git a/package/Config.in b/package/Config.in
index 50c0e13510..d5c46ef997 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1086,7 +1086,6 @@ menu "External python modules"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
 	source "package/python-m2r/Config.in"
-	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
deleted file mode 100644
index 25354213d6..0000000000
--- a/package/python-mad/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_MAD
-	bool "python-mad"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_LIBMAD
-	help
-	  python-mad is a Python binding for the MAD library, a
-	  high-quality integer-only MPEG decoder.
-
-	  http://spacepants.org/src/pymad/
diff --git a/package/python-mad/python-mad.hash b/package/python-mad/python-mad.hash
deleted file mode 100644
index 7b19ae5a44..0000000000
--- a/package/python-mad/python-mad.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  1c9fc529b78de7d26e9e47cf182c9f8bf43838d8f62a9c1773540d57f5ebc522  pymad-0.6.tar.gz
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
deleted file mode 100644
index a22214876f..0000000000
--- a/package/python-mad/python-mad.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# python-mad
-#
-################################################################################
-
-PYTHON_MAD_VERSION = 0.6
-PYTHON_MAD_SOURCE = pymad-$(PYTHON_MAD_VERSION).tar.gz
-PYTHON_MAD_SITE = http://spacepants.org/src/pymad/download
-PYTHON_MAD_SETUP_TYPE = distutils
-PYTHON_MAD_LICENSE = GPL-2.0+
-PYTHON_MAD_LICENSE_FILES = COPYING
-
-PYTHON_MAD_DEPENDENCIES = libmad
-
-ifeq ($(BR2_ENDIAN),"LITTLE")
-PYTHON_MAD_ENDIAN = little
-else
-PYTHON_MAD_ENDIAN = big
-endif
-
-define PYTHON_MAD_CONFIGURE_CMDS
-	echo "endian = $(PYTHON_MAD_ENDIAN)" > $(@D)/Setup
-	echo "mad_libs = mad" >> $(@D)/Setup
-	echo "mad_lib_dir = $(STAGING_DIR)/usr/lib" >> $(@D)/Setup
-	echo "mad_include_dir = $(STAGING_DIR)/usr/include" >> $(@D)/Setup
-endef
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
