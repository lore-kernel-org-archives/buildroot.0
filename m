Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A12F340A3E;
	Fri, 11 Feb 2022 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlnILjAJThYx; Fri, 11 Feb 2022 19:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5286440A00;
	Fri, 11 Feb 2022 19:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B75D1BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB0B081D4D
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HTjiJald4yg for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CD083689
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E2E3F825B5; Fri, 11 Feb 2022 19:02:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:06:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e40891a6679bc0dd87af32d5e672180751987b9
X-Git-Newrev: caca05020d1e2cc1d9ab9202abab44e13bda73fd
X-Patchwork-Hint: ignore
Message-Id: <20220211190258.E2E3F825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-cffi: drop unused host
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

commit: https://git.buildroot.net/buildroot/commit/?id=caca05020d1e2cc1d9ab9202abab44e13bda73fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d9bf97cf16fa6945466a67 (package/python-cryptography: drop host
variant) dropped the dependency on host-python3-cffi, so it is now unused.
Drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cffi/python-cffi.mk     |  1 -
 package/python3-cffi/python3-cffi.hash |  1 -
 package/python3-cffi/python3-cffi.mk   | 29 -----------------------------
 3 files changed, 31 deletions(-)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index b14dce8225..83a21cb75a 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-cffi/python3-cffi.mk
 PYTHON_CFFI_VERSION = 1.15.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
diff --git a/package/python3-cffi/python3-cffi.hash b/package/python3-cffi/python3-cffi.hash
deleted file mode 120000
index 1f98d8df9c..0000000000
--- a/package/python3-cffi/python3-cffi.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-cffi/python-cffi.hash
\ No newline at end of file
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
deleted file mode 100644
index 2770eda93e..0000000000
--- a/package/python3-cffi/python3-cffi.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# python3-cffi
-#
-################################################################################
-
-# Please keep in sync with package/python-cffi/python-cffi.mk
-PYTHON3_CFFI_VERSION = 1.15.0
-PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
-PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
-PYTHON3_CFFI_SETUP_TYPE = setuptools
-PYTHON3_CFFI_LICENSE = MIT
-PYTHON3_CFFI_LICENSE_FILES = LICENSE
-
-# This host package uses pkg-config to find libffi, so we have to
-# provide the proper hints for pkg-config to behave properly for host
-# packages.
-HOST_PYTHON3_CFFI_ENV = \
-	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
-HOST_PYTHON3_CFFI_DEPENDENCIES = host-pkgconf host-python3-pycparser host-libffi
-
-HOST_PYTHON3_CFFI_DL_SUBDIR = python-cffi
-HOST_PYTHON3_CFFI_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
