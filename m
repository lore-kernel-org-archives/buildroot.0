Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3860C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6577C404DB;
	Wed,  9 Feb 2022 17:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjBbUp41Q1Q9; Wed,  9 Feb 2022 17:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 572E240150;
	Wed,  9 Feb 2022 17:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61E8D1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5141E4007D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEpyo9ClrcPf for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 265D440083
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8CDB100003;
 Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDP-0001Qd-Aw; Wed, 09 Feb 2022 17:53:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:02 +0100
Message-Id: <20220209165213.4498-97-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 096/107] package/python-pypcap: drop python2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-pypcap/Config.in          |  9 ---------
 package/python-pypcap/python-pypcap.hash |  3 ---
 package/python-pypcap/python-pypcap.mk   | 21 ---------------------
 6 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/python-pypcap/Config.in
 delete mode 100644 package/python-pypcap/python-pypcap.hash
 delete mode 100644 package/python-pypcap/python-pypcap.mk

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
index 07f9304766..9c1411648e 100644
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
