Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ADBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4800400F8;
	Fri, 11 Feb 2022 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nd4l5BBXgvA6; Fri, 11 Feb 2022 19:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B7CB40A12;
	Fri, 11 Feb 2022 19:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205F51C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5652241720
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GL1-Ya01MCpS for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80E1B41675
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3EF11832DA; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea6a0a60e28f3047e762806a0cef3b4d55d7b576
X-Git-Newrev: d3730ae991107d338b4acab5e617c9ff0cd754a4
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.3EF11832DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-pyelftools: drop host
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3730ae991107d338b4acab5e617c9ff0cd754a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/optee-os.mk                          |  2 +-
 boot/uboot/uboot.mk                                |  2 +-
 package/python-pyelftools/python-pyelftools.mk     |  1 -
 package/python3-pyelftools/python3-pyelftools.hash |  1 -
 package/python3-pyelftools/python3-pyelftools.mk   | 17 -----------------
 5 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 2884b48513..166b5e693c 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -21,7 +21,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python3-pyelftools
+OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python-pyelftools
 
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e227fed91..9e569906ce 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -216,7 +216,7 @@ UBOOT_DEPENDENCIES += host-swig
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
-UBOOT_DEPENDENCIES += host-python3-pyelftools
+UBOOT_DEPENDENCIES += host-python-pyelftools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 3ae0a4ffc2..5bfdcd33ae 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pyelftools/python3-pyelftools.mk
 PYTHON_PYELFTOOLS_VERSION = 0.27
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
 PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
diff --git a/package/python3-pyelftools/python3-pyelftools.hash b/package/python3-pyelftools/python3-pyelftools.hash
deleted file mode 120000
index e8eebeda9f..0000000000
--- a/package/python3-pyelftools/python3-pyelftools.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pyelftools/python-pyelftools.hash
\ No newline at end of file
diff --git a/package/python3-pyelftools/python3-pyelftools.mk b/package/python3-pyelftools/python3-pyelftools.mk
deleted file mode 100644
index 3d21d3040e..0000000000
--- a/package/python3-pyelftools/python3-pyelftools.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python3-pyelftools
-#
-################################################################################
-
-# Please keep in sync with package/python-pyelftools/python-pyelftools.mk
-PYTHON3_PYELFTOOLS_VERSION = 0.27
-PYTHON3_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON3_PYELFTOOLS_VERSION).tar.gz
-PYTHON3_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
-PYTHON3_PYELFTOOLS_LICENSE = Public domain
-PYTHON3_PYELFTOOLS_LICENSE_FILES = LICENSE
-PYTHON3_PYELFTOOLS_SETUP_TYPE = setuptools
-HOST_PYTHON3_PYELFTOOLS_DL_SUBDIR = python-pyelftools
-HOST_PYTHON3_PYELFTOOLS_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
