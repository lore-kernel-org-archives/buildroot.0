Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947DAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46EB540150;
	Wed,  9 Feb 2022 17:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlCrvIeVMgBF; Wed,  9 Feb 2022 17:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F85404EE;
	Wed,  9 Feb 2022 17:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E17801BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 039C060C08
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNDsXUAwUAY3 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB76C60B98
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 154506000D;
 Wed,  9 Feb 2022 16:53:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDS-0001RN-L1; Wed, 09 Feb 2022 17:53:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:08 +0100
Message-Id: <20220209165213.4498-103-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 102/107] package/python-configobj: drop python2
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
 Config.in.legacy                               |  6 ++++++
 DEVELOPERS                                     |  2 --
 package/Config.in                              |  1 -
 package/Config.in.host                         |  1 -
 package/python-configobj/Config.in             | 10 ----------
 package/python-configobj/python-configobj.hash |  3 ---
 package/python-configobj/python-configobj.mk   | 14 --------------
 7 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 package/python-configobj/Config.in
 delete mode 100644 package/python-configobj/python-configobj.hash
 delete mode 100644 package/python-configobj/python-configobj.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 47e8d696e0..6776048fc4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_YIELDFROM
 	bool "python-yieldfrom removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9c1411648e..8112873f14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2796,7 +2796,6 @@ F:	package/ne10/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
-F:	package/python/
 F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
@@ -3034,7 +3033,6 @@ F:	package/grantlee/
 F:	package/libusb/
 F:	package/libusb-compat/
 F:	package/proj/
-F:	package/python-configobj/
 F:	package/python-iniparse/
 F:	package/qjson/
 F:	package/quazip/
diff --git a/package/Config.in b/package/Config.in
index 6fb62caa4c..478a4e6b90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -973,7 +973,6 @@ menu "External python modules"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
-	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-couchdb/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 341e24926b..e5fbb07fc2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -69,7 +69,6 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
-	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-lxml/Config.in.host"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
deleted file mode 100644
index fc57e26f1c..0000000000
--- a/package/python-configobj/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PYTHON_CONFIGOBJ
-	bool "python-configobj"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  ConfigObj is a simple but powerful config file reader and
-	  writer: an ini file round tripper. Its main feature is that
-	  it is very easy to use, with a straightforward programmer's
-	  interface and a simple syntax for config files.
-
-	  http://www.voidspace.org.uk/python/configobj.html
diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
deleted file mode 100644
index d43c453796..0000000000
--- a/package/python-configobj/python-configobj.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# md5 from https://pypi.python.org/pypi/configobj/json, sha256 locally computed
-md5	e472a3a1c2a67bb0ec9b5d54c13a47d6  configobj-5.0.6.tar.gz
-sha256	a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902  configobj-5.0.6.tar.gz
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
deleted file mode 100644
index 9e281d28e7..0000000000
--- a/package/python-configobj/python-configobj.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-configobj
-#
-################################################################################
-
-PYTHON_CONFIGOBJ_VERSION = 5.0.6
-PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
-PYTHON_CONFIGOBJ_SITE = https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab
-PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
-# License only mentioned in the source
-PYTHON_CONFIGOBJ_SETUP_TYPE = distutils
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
