Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055FEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F34400F8;
	Fri, 11 Feb 2022 19:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WoQ7JKp1q2kN; Fri, 11 Feb 2022 19:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FA1404F4;
	Fri, 11 Feb 2022 19:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 220521C1189
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10AD041714
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8ItEfrv2U2u for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457B041720
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 01460832DA; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:06:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 255e7030f199ebb98ce6e6f283289a95c8f0f0a8
X-Git-Newrev: 866b42ce4985affd0ab578e15b77eac1dc6533a5
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.01460832DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-cython: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=866b42ce4985affd0ab578e15b77eac1dc6533a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/libdnet.mk                   |  2 +-
 package/python-cython/python-cython.mk       |  1 -
 package/python-fonttools/python-fonttools.mk |  2 +-
 package/python3-cython/python3-cython.hash   |  1 -
 package/python3-cython/python3-cython.mk     | 16 ----------------
 package/setools/setools.mk                   |  2 +-
 6 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index e9a57d6ed2..4c58ea20a5 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -16,7 +16,7 @@ LIBDNET_CONF_OPTS = \
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
-LIBDNET_DEPENDENCIES += host-python3-cython python3
+LIBDNET_DEPENDENCIES += host-python-cython python3
 LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
 LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 89708cb9a8..b9fbf7b11a 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-cython/python3-cython.mk
 PYTHON_CYTHON_VERSION = 0.29.27
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
 PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index d5c4cdf8e5..c07011daa0 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -10,7 +10,7 @@ PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/2d/4c/49ba863863
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-PYTHON_FONTTOOLS_DEPENDENCIES = host-python3-cython
+PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
 PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
 
 define PYTHON_FONTTOOLS_EXTRACT_CMDS
diff --git a/package/python3-cython/python3-cython.hash b/package/python3-cython/python3-cython.hash
deleted file mode 120000
index 70dde64105..0000000000
--- a/package/python3-cython/python3-cython.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-cython/python-cython.hash
\ No newline at end of file
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
deleted file mode 100644
index 56d88b5bf7..0000000000
--- a/package/python3-cython/python3-cython.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-cython
-#
-################################################################################
-
-# Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.27
-PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
-PYTHON3_CYTHON_SETUP_TYPE = setuptools
-PYTHON3_CYTHON_LICENSE = Apache-2.0
-PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-HOST_PYTHON3_CYTHON_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 8e1c0d2cc6..5b4b4e30d8 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -12,7 +12,7 @@ SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_CPE_ID_VENDOR = selinuxproject
 SETOOLS_SETUP_TYPE = setuptools
-HOST_SETOOLS_DEPENDENCIES = host-python3-cython host-libselinux host-libsepol host-python-networkx
+HOST_SETOOLS_DEPENDENCIES = host-python-cython host-libselinux host-libsepol host-python-networkx
 HOST_SETOOLS_NEEDS_HOST_PYTHON = python3
 
 define SETOOLS_FIX_SETUP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
