Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D7BCCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4D0D40B68;
	Fri, 17 Oct 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG3yYSIT1pJ9; Fri, 17 Oct 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0016B40B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0016B40B69;
	Fri, 17 Oct 2025 16:33:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D6A972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A37140B21
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spety-vRouzK for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94EBA40BAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94EBA40BAB
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B69B873E4; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 884626ede203c6a055fbbdab0cc0219fc5ae2cbf
X-Git-Newrev: 2d0451030fb4aea04138a95edbd71049c5b9b1e9
X-Patchwork-Hint: ignore
Message-Id: <20251017163329.7B69B873E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: bump version to
 0.24.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d0451030fb4aea04138a95edbd71049c5b9b1e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001 due to upstream commit:
https://github.com/pyudev/pyudev/commit/6d760e7eefb8ad1df55e69067ccd7d023a1e9be5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-Workaround-finding-libudev-on-systems-without-ldconf.patch | 8 +++++---
 package/python-pyudev/python-pyudev.hash                          | 4 ++--
 package/python-pyudev/python-pyudev.mk                            | 4 ++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index 26f1ef6390..f8c9497de3 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -15,6 +15,8 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 [Fabrice: Use %-formatting instead of f-string for python 2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 0.24.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -23,7 +25,7 @@ diff --git a/src/pyudev/_ctypeslib/utils.py b/src/pyudev/_ctypeslib/utils.py
 index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
-@@ -28,7 +28,7 @@
+@@ -24,7 +24,7 @@
  """
  
  # isort: STDLIB
@@ -32,7 +34,7 @@ index 9dffb3c..aa9942f 100644
  from ctypes.util import find_library
  
  
-@@ -50,10 +50,10 @@ def load_ctypes_library(name, signatures, error_checkers):
+@@ -46,10 +46,10 @@ def load_ctypes_library(name, signatures, error_checkers):
      :rtype: ctypes.CDLL
      :raises ImportError: if the library is not found
      """
@@ -41,7 +43,7 @@ index 9dffb3c..aa9942f 100644
 +    try:
 +        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
-         raise ImportError("No library named %s" % name)
+         raise ImportError(f"No library named {name}")
 -    lib = CDLL(library_name, use_errno=True)
      # Add function signatures
      for funcname, signature in signatures.items():
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index e9596b7b43..799499a2ac 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  07bbe9111308d2509645705b8321c416  pyudev-0.24.3.tar.gz
-sha256  2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7  pyudev-0.24.3.tar.gz
+md5  2d2e6f68b60c3bf3ffc2b7c8df8d18ac  pyudev-0.24.4.tar.gz
+sha256  e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc  pyudev-0.24.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index fa11ce5040..a83fe70a48 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.3
+PYTHON_PYUDEV_VERSION = 0.24.4
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/c4/5c/6cc034da13830e3da123ccf9a30910bc868fa16670362f004e4b788d0df1
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
