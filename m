Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2BDC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0BE81D19;
	Sun, 15 Sep 2024 21:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrhTDS3WDxTF; Sun, 15 Sep 2024 21:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CC181D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CC181D5F;
	Sun, 15 Sep 2024 21:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10EDD1BF954
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF6760899
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVolnVAkBHq6 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8607A6087F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8607A6087F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DDB835CD; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:52:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 142462f7968e8a756aa7df7d008fffed6cfd7fb4
X-Git-Newrev: f8be13e61e38ca4109d7ccedd463d0f0ebf4b8de
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.82DDB835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-augeas: bump to version
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8be13e61e38ca4109d7ccedd463d0f0ebf4b8de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Use-CFFI-in-out-of-line-API-mode-49.patch | 101 ---------------------
 package/python-augeas/python-augeas.hash           |   2 +-
 package/python-augeas/python-augeas.mk             |   2 +-
 3 files changed, 2 insertions(+), 103 deletions(-)

diff --git a/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch b/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
deleted file mode 100644
index da9093d723..0000000000
--- a/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 9de73fefbe83c74840a93c039258845c49271b9b Mon Sep 17 00:00:00 2001
-From: Jeffery To <jeffery.to@gmail.com>
-Date: Sun, 8 Nov 2020 21:51:09 +0800
-Subject: [PATCH] Use CFFI in out-of-line API mode (#49)
-
-Currently, ffi.py is called during setup to generate augeas.py; this
-file would normally be used for out-of-line ABI mode. ffi.py is also
-imported at run-time, instead of the generated augeas.py, and used in
-in-line ABI mode.
-
-This changes usage of CFFI to out-of-line API mode (CFFI's "main mode of
-usage"): ffi.py is called during setup to generate _augeas.abi3.so (a C
-extension module); this generated module is imported at run-time.
-
-With this change, the headers/development files for augeas (i.e.
-libaugeas-dev on Debian, augeas-devel on Fedora, etc.) and the C
-compiler are required for build/setup. (These were not necessary
-previously.)
-
-Closes https://github.com/hercules-team/python-augeas/issues/48.
-
-Upstream: commit 712c2028568df7760bc98d95577e35709078bfea
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- augeas/__init__.py |  2 +-
- augeas/ffi.py      | 27 ++++++++++++++++++++++-----
- setup.py           |  1 +
- 3 files changed, 24 insertions(+), 6 deletions(-)
-
-diff --git a/augeas/__init__.py b/augeas/__init__.py
-index 9bd97bf..1c0f580 100644
---- a/augeas/__init__.py
-+++ b/augeas/__init__.py
-@@ -32,7 +32,7 @@ format and the transformation into a tree.
- 
- from sys import version_info as _pyver
- 
--from augeas.ffi import ffi, lib
-+from _augeas import ffi, lib
- 
- __author__ = "Nathaniel McCallum <nathaniel@natemccallum.com>"
- __credits__ = """Jeff Schroeder <jeffschroeder@computer.org>
-diff --git a/augeas/ffi.py b/augeas/ffi.py
-index a24daf5..1931764 100644
---- a/augeas/ffi.py
-+++ b/augeas/ffi.py
-@@ -1,9 +1,28 @@
-+import os
-+import subprocess
-+
- from cffi import FFI
- 
-+def get_include_dirs():
-+    XML2_CONFIG = os.environ.get('XML2_CONFIG', 'xml2-config')
-+    PKG_CONFIG = os.environ.get('PKG_CONFIG', 'pkg-config')
-+    try:
-+        stdout = subprocess.check_output([XML2_CONFIG, '--cflags'])
-+    except (OSError, subprocess.CalledProcessError):
-+        try:
-+            stdout = subprocess.check_output([PKG_CONFIG, '--cflags', 'libxml-2.0'])
-+        except (OSError, subprocess.CalledProcessError):
-+            stdout = b''
-+    cflags = stdout.decode('utf-8').split()
-+    return [cflag[2:] for cflag in cflags if cflag.startswith('-I')]
-+
- ffi = FFI()
--ffi.set_source("augeas",
--               None,
--               libraries=['augeas'])
-+ffi.set_source("_augeas",
-+               """
-+               #include <augeas.h>
-+               """,
-+               libraries=['augeas'],
-+               include_dirs=get_include_dirs())
- 
- ffi.cdef("""
- typedef struct augeas augeas;
-@@ -44,7 +63,5 @@ const char *aug_error_details(augeas *aug);
- void free(void *);
- """)
- 
--lib = ffi.dlopen("augeas")
--
- if __name__ == "__main__":
-     ffi.compile(verbose=True)
-diff --git a/setup.py b/setup.py
-index 7d55877..17f9516 100755
---- a/setup.py
-+++ b/setup.py
-@@ -22,6 +22,7 @@ setup(name=name,
-       setup_requires=["cffi>=1.0.0"],
-       cffi_modules=["augeas/ffi.py:ffi"],
-       install_requires=["cffi>=1.0.0"],
-+      zip_safe=False,
-       url="http://augeas.net/",
-       classifiers=[
-           "Programming Language :: Python :: 2.7",
--- 
-2.31.1
-
diff --git a/package/python-augeas/python-augeas.hash b/package/python-augeas/python-augeas.hash
index f4f4209875..d56eaef6a0 100644
--- a/package/python-augeas/python-augeas.hash
+++ b/package/python-augeas/python-augeas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a1d2cdaf2ad4c091ed5ec7976c52d16e14ecfbf40b1bdcaced2465255fb0f87  python-augeas-1.1.0.tar.gz
+sha256  ee2c1e74cad61124097c5f540f063fa2dd3b8cd3159f1706f11167814c9bfcd5  python-augeas-1.2.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/python-augeas/python-augeas.mk b/package/python-augeas/python-augeas.mk
index 7adaa84f49..6d2a08a090 100644
--- a/package/python-augeas/python-augeas.mk
+++ b/package/python-augeas/python-augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_AUGEAS_VERSION = 1.1.0
+PYTHON_AUGEAS_VERSION = 1.2.0
 PYTHON_AUGEAS_SITE = $(call github,hercules-team,python-augeas,v$(PYTHON_AUGEAS_VERSION))
 PYTHON_AUGEAS_SETUP_TYPE = setuptools
 PYTHON_AUGEAS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
