Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955EBC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED7860C18;
	Mon,  5 Dec 2022 11:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED7860C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id if61s2mIsz3S; Mon,  5 Dec 2022 11:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 803DE60A47;
	Mon,  5 Dec 2022 11:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803DE60A47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 242DF1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05825405D7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05825405D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK9mat7xWbC9 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA0ED405B5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA0ED405B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6B7385B9E; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68672d598de858df7360f4a031680b6c965a07b5
X-Git-Newrev: b4b545c7bb18cb475062d3074750001c13f8bfdb
X-Patchwork-Hint: ignore
Message-Id: <20221205112604.E6B7385B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: bump to version
 0.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4b545c7bb18cb475062d3074750001c13f8bfdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixup patch so that it applies against 0.24.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Workaround-finding-libudev-on-systems-without-ldconf.patch | 6 +++---
 package/python-pyudev/python-pyudev.hash                            | 4 ++--
 package/python-pyudev/python-pyudev.mk                              | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index d798f836a5..26f1ef6390 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -24,9 +24,9 @@ index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
 @@ -28,7 +28,7 @@
- from __future__ import print_function
- from __future__ import unicode_literals
+ """
  
+ # isort: STDLIB
 -from ctypes import CDLL
 +from ctypes import cdll, CDLL
  from ctypes.util import find_library
@@ -41,7 +41,7 @@ index 9dffb3c..aa9942f 100644
 +    try:
 +        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
-         raise ImportError('No library named %s' % name)
+         raise ImportError("No library named %s" % name)
 -    lib = CDLL(library_name, use_errno=True)
      # Add function signatures
      for funcname, signature in signatures.items():
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index def10542fa..014bf20933 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  377eda61186c91e9440f01d76dbb4206  pyudev-0.22.0.tar.gz
-sha256  69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276  pyudev-0.22.0.tar.gz
+md5  17c0a41f0e4dfc016350806a0a60f630  pyudev-0.24.0.tar.gz
+sha256  b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3  pyudev-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 42d5c7000b..5d48cd4f7c 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.22.0
+PYTHON_PYUDEV_VERSION = 0.24.0
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/72/c8/4660d815a79b1d42c409012aaa10ebd6b07a47529b4cb6880f27a24bd646
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/00/8d/810750cb2fc64d7e0dbefc106a9137b157616a95be3f0ea51ca3cf6c762a
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
