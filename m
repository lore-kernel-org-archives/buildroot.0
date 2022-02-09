Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4312BC433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CFF813E8;
	Wed,  9 Feb 2022 21:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKDjd4lT3Y9c; Wed,  9 Feb 2022 21:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3872581388;
	Wed,  9 Feb 2022 21:38:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E73A1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC844052C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03N33oRv10DP for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D696F4027F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DC93C81335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc3eda104a340f0a5a0ad96a74ffb31574a6df47
X-Git-Newrev: aec1a69a202352e61264a20561dcd729b733eb54
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.DC93C81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypcap: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=aec1a69a202352e61264a20561dcd729b733eb54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-pypcap/Config.in          |  9 ---------
 package/python-pypcap/python-pypcap.hash |  3 ---
 package/python-pypcap/python-pypcap.mk   | 21 ---------------------
 6 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 74317a2d7c..f99535411d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PYPCAP
+	bool "python-pypcap removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_PATHLIB2
 	bool "python-pathlib2 removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4bb8821563..90988478f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1934,7 +1934,6 @@ F:	package/python-ipy/
 F:	package/python-iwlib/
 F:	package/python-posix-ipc/
 F:	package/python-pycairo/
-F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/python-pysftp/
 F:	package/python-tinyrpc/
diff --git a/package/Config.in b/package/Config.in
index 3c55dec6c5..d406d372d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1172,7 +1172,6 @@ menu "External python modules"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
-	source "package/python-pypcap/Config.in"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
diff --git a/package/python-pypcap/Config.in b/package/python-pypcap/Config.in
deleted file mode 100644
index 9b410ecc2b..0000000000
--- a/package/python-pypcap/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYPCAP
-	bool "python-pypcap"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  The pypcap module is an object-oriented wrapper of the C
-	  libpcap library.
-
-	  https://github.com/dugsong/pypcap
diff --git a/package/python-pypcap/python-pypcap.hash b/package/python-pypcap/python-pypcap.hash
deleted file mode 100644
index 40db6b4f33..0000000000
--- a/package/python-pypcap/python-pypcap.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  5716d97b39d40b79daf7b0c6a8c8c514f5f1de8f20561c8621ee62a90b93fb03  python-pypcap-6f46e7bf29a648256ddc732a7d0ec83d3ffca390.tar.gz
-sha256  48306c284fdbdf836b880528c3bdd658deac47ed78ffeb24a4ca5a8c39a39304  LICENSE
diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
deleted file mode 100644
index fc6fc6ed92..0000000000
--- a/package/python-pypcap/python-pypcap.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# python-pypcap
-#
-################################################################################
-
-PYTHON_PYPCAP_VERSION = 6f46e7bf29a648256ddc732a7d0ec83d3ffca390
-PYTHON_PYPCAP_SITE = $(call github,dugsong,pypcap,$(PYTHON_PYPCAP_VERSION))
-PYTHON_PYPCAP_LICENSE = BSD-3-Clause
-PYTHON_PYPCAP_LICENSE_FILES = LICENSE
-PYTHON_PYPCAP_SETUP_TYPE = distutils
-PYTHON_PYPCAP_DEPENDENCIES = host-python-pyrex libpcap
-
-define PYTHON_PYPCAP_CONFIGURE_CMDS
-	$(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/pyrexc $(@D)/pcap.pyx
-	(cd $(@D); \
-		$(HOST_DIR)/bin/python setup.py \
-		config --with-pcap=$(STAGING_DIR)/usr)
-endef
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
