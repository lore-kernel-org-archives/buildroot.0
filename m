Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C8AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4325760AD8;
	Mon,  6 Nov 2023 19:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4325760AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3GycdtitV4t; Mon,  6 Nov 2023 19:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E14D610AE;
	Mon,  6 Nov 2023 19:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E14D610AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80BD11BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59C27417E8
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C27417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1mgETVwqYiR for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52FAC417CE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FAC417CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 352D786953; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:39:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2edabebbb417414d429161e0123fb7730bdc0489
X-Git-Newrev: c4c555bd57ffdda313cb883be80d9c3d62a5442b
X-Patchwork-Hint: ignore
Message-Id: <20231106194025.352D786953@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ranger: bump to version 1.9.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4c555bd57ffdda313cb883be80d9c3d62a5442b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to github to get latest release
- Drop patch (already in version)
- Update RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME as scripts/ranger
  symlink to ranger.py has been removed
- Update hash of AUTHORS and add LICENSE file:
  https://github.com/ranger/ranger/commit/8263cbac888c9619bc024071bafb7b3223a7da83

https://github.com/ranger/ranger/blob/v1.9.3/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...lorscheme-check-for-compiled-python-files.patch | 31 ----------------------
 package/ranger/Config.in                           |  2 +-
 package/ranger/ranger.hash                         |  5 ++--
 package/ranger/ranger.mk                           |  8 +++---
 5 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7113382e21..1e35bf77db 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1201,7 +1201,6 @@ package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch Upstream
 package/quagga/0003-Fix-build-with-gcc-10.patch Upstream
 package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch Upstream
-package/ranger/0001-colorscheme-check-for-compiled-python-files.patch Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch Upstream
 package/rdesktop/0001-8bit-colors.patch Sob Upstream
diff --git a/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch b/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
deleted file mode 100644
index bde3fee035..0000000000
--- a/package/ranger/0001-colorscheme-check-for-compiled-python-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 654e3116825c4d12340613196279fb13a5662113 Mon Sep 17 00:00:00 2001
-From: Thijs Vermeir <thijsvermeir@gmail.com>
-Date: Tue, 20 Oct 2015 18:13:36 +0200
-Subject: [PATCH] colorscheme: check for compiled python files
-
-Some systems only provide *.pyc files
-
-Patch accepted upstream:
-https://github.com/hut/ranger/commit/d69f1ed3207c785d1a39ddd2992f6abb021b7540
-
-Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
----
- ranger/gui/colorscheme.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ranger/gui/colorscheme.py b/ranger/gui/colorscheme.py
-index d6afcac..d2b3b2d 100644
---- a/ranger/gui/colorscheme.py
-+++ b/ranger/gui/colorscheme.py
-@@ -86,7 +86,7 @@ def _colorscheme_name_to_class(signal):
-     usecustom = not ranger.arg.clean
- 
-     def exists(colorscheme):
--        return os.path.exists(colorscheme + '.py')
-+        return os.path.exists(colorscheme + '.py') or os.path.exists(colorscheme + '.pyc')
- 
-     def is_scheme(x):
-         try:
--- 
-2.6.1
-
diff --git a/package/ranger/Config.in b/package/ranger/Config.in
index a379002f95..056f806c33 100644
--- a/package/ranger/Config.in
+++ b/package/ranger/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_RANGER
 	  file launcher that is good at automatically finding out
 	  which program to use for what file type.
 
-	  http://ranger.nongnu.org
+	  https://ranger.github.io
 
 comment "ranger needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index dee088f229..b1ae8a8b8f 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  94f6e342daee4445f15db5a7440a11138487c49cc25da0c473bbf1b8978f5b79  ranger-1.7.2.tar.gz
+sha256  ce088a04c91c25263a9675dc5c43514b7ec1b38c8ea43d9a9d00923ff6cdd251  ranger-1.9.3.tar.gz
 # Locally computed
-sha256  fa3b40d44066b033ac8a134b792a4a4a1915aa7bc7757098e0f67080648a3271  AUTHORS
+sha256  ef973501404bd0556fd47324411fc69679f30daf7128e042eafa64e2c4f9ecb9  AUTHORS
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index 1c948db848..d8a55b1fc2 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-RANGER_VERSION = 1.7.2
-RANGER_SITE = http://ranger.nongnu.org
+RANGER_VERSION = 1.9.3
+RANGER_SITE = https://ranger.github.io
 RANGER_SETUP_TYPE = setuptools
 RANGER_LICENSE = GPL-3.0
-RANGER_LICENSE_FILES = AUTHORS
+RANGER_LICENSE_FILES = AUTHORS LICENSE
 
 # The ranger script request python to be called with -O (optimize generated
 # bytecode slightly; also PYTHONOPTIMIZE=x). This implicitly requires the python
@@ -16,7 +16,7 @@ RANGER_LICENSE_FILES = AUTHORS
 # files are installed.
 
 define RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
-	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
+	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/ranger.py
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
