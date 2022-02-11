Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2329940A3D;
	Fri, 11 Feb 2022 19:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSIpyOjWUQWO; Fri, 11 Feb 2022 19:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93E040A1E;
	Fri, 11 Feb 2022 19:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 274981C1189
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D1283E73
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv38fa9utzsk for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70CA383E58
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 287F0825B5; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5211de7d789ba8c9eaf649612711a40d02f3eec9
X-Git-Newrev: 1fc1b258d39b215194b868eb002200871e535595
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.287F0825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-pycryptodomex: drop host
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fc1b258d39b215194b868eb002200871e535595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/optee-os.mk                             |  2 +-
 package/python-pycryptodomex/python-pycryptodomex.mk  |  1 -
 .../python3-pycryptodomex/python3-pycryptodomex.hash  |  1 -
 .../python3-pycryptodomex/python3-pycryptodomex.mk    | 19 -------------------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 03ce08ffb2..2884b48513 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -21,7 +21,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python3-pycryptodomex host-python3-pyelftools
+OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python3-pyelftools
 
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 92780327a1..d752122550 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
 PYTHON_PYCRYPTODOMEX_VERSION = 3.13.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
 PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.hash b/package/python3-pycryptodomex/python3-pycryptodomex.hash
deleted file mode 120000
index 0c6761d8a4..0000000000
--- a/package/python3-pycryptodomex/python3-pycryptodomex.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pycryptodomex/python-pycryptodomex.hash
\ No newline at end of file
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
deleted file mode 100644
index 06a46cdf63..0000000000
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-pycryptodomex
-#
-################################################################################
-
-# Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.13.0
-PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
-PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
-PYTHON3_PYCRYPTODOMEX_LICENSE = \
-	BSD-2-Clause, \
-	Public Domain (pycrypto original code)
-PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
-HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
-HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
