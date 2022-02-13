Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EC1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 12:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A7781AC1;
	Sun, 13 Feb 2022 12:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvNnnGPkYDMK; Sun, 13 Feb 2022 12:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1154581A58;
	Sun, 13 Feb 2022 12:07:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35F1A1BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24412815AD
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9UX9MoaJL0I for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64DEC81490
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 45B168287C; Sun, 13 Feb 2022 11:57:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 13:05:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dd5382d791c3d5197b9ef401a0d103ad1457d5d
X-Git-Newrev: 9324d53bc5114cf862602cafcf214adfc7375d32
X-Patchwork-Hint: ignore
Message-Id: <20220213115753.45B168287C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docutils: bump to version
 0.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9324d53bc5114cf862602cafcf214adfc7375d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the obsolete patch as docutils is now a setuptools package.

The package also includes code licensed under BSD-3-Clause licence.
COPYING.txt has the following changes:

* copyright year
* more exceptions from the Public Domain added
* BSD-3-Clause license added
* emacs mode is GPL-3.0+ instead of just GPL-3.0
* added Python-2.0 for roman.py

The "other" license is removed since the list covers all licenses
mentioned in COPYING.txt.

Also update hash file whitespace to two spaces.

Fixes:
http://autobuild.buildroot.net/results/02dd94c09dabdbdd8b47673393577a7fd3af3aeb

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-docutils/0001-Update-setup.py.patch | 64 ----------------------
 package/python-docutils/python-docutils.hash       |  6 +-
 package/python-docutils/python-docutils.mk         |  8 +--
 3 files changed, 7 insertions(+), 71 deletions(-)

diff --git a/package/python-docutils/0001-Update-setup.py.patch b/package/python-docutils/0001-Update-setup.py.patch
deleted file mode 100644
index 3fb34a9763..0000000000
--- a/package/python-docutils/0001-Update-setup.py.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 583e59ccf72a02c2a6f0399f29f622c7f2f4a932 Mon Sep 17 00:00:00 2001
-From: milde <milde@929543f6-e4f2-0310-98a6-ba3bd3dd1d04>
-Date: Sun, 1 Sep 2019 19:39:36 +0000
-Subject: [PATCH] Update setup.py
-
-Python 3.4 no longer supported,
-more languages supported (and Lithuanian accepted by PyPi).
-
-git-svn-id: http://svn.code.sf.net/p/docutils/code/trunk@8383 929543f6-e4f2-0310-98a6-ba3bd3dd1d04
-
-[Asaf: adjust upstream patch to 0.15.2]
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- setup.py | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index f801ea2..5c1ebfd 100755
---- a/setup.py
-+++ b/setup.py
-@@ -7,6 +7,10 @@ import os
- import glob
- try:
-     import setuptools
-+except ImportError:
-+    print('Warning: Could not load package `setuptools`.')
-+    print('Actions requiring `setuptools` instead of `distutils` will fail')
-+try:
-     from distutils.core import setup, Command
-     from distutils.command.build import build
-     from distutils.command.build_py import build_py
-@@ -123,7 +127,7 @@ what-you-see-is-what-you-get plaintext markup syntax.""", # wrap at col 60
-     'maintainer_email': 'docutils-develop@lists.sourceforge.net',
-     'license': 'public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)',
-     'platforms': 'OS-independent',
--    'python_requires': '>=2.6, !=3.0.*, !=3.1.*, !=3.2.*',
-+    'python_requires': '>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*, !=3.4.*',
-     'package_dir': {'docutils': 'docutils',
-                     'docutils.tools': 'tools'},
-     'packages': ['docutils',
-@@ -213,14 +219,20 @@ classifiers = [
-     'Natural Language :: Chinese (Simplified)',
-     'Natural Language :: Chinese (Traditional)',
-     'Natural Language :: Czech',
-+    'Natural Language :: Danish',
-     'Natural Language :: Dutch',
-     'Natural Language :: Esperanto',
-     'Natural Language :: Finnish',
-     'Natural Language :: French',
-     'Natural Language :: Galician',
-     'Natural Language :: German',
-+    'Natural Language :: Hebrew',
-     'Natural Language :: Italian',
-     'Natural Language :: Japanese',
-+    'Natural Language :: Korean',
-+    'Natural Language :: Latvian',
-+    'Natural Language :: Lithuanian',
-+    'Natural Language :: Persian',
-     'Natural Language :: Polish',
-     'Natural Language :: Portuguese (Brazilian)',
-     'Natural Language :: Russian',
--- 
-2.20.1
-k
diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index ccccca1064..f5e0b82db8 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5	e26a308d8000b0bed7416a633217c676  docutils-0.15.2.tar.gz
-sha256	a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99  docutils-0.15.2.tar.gz
-sha256  efa0c85aa99ea5b4781240031b0d02af54d7b5554c87ad2b2bea9ba490f6663f  COPYING.txt
+md5  ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
+sha256  679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
+sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 9a42d3e5dc..39a570f5a1 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.15.2
+PYTHON_DOCUTILS_VERSION = 0.18.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/93/22/953e071b589b0b1fee420ab06a0d15e5aa0c7470eb9966d60393ce58ad61
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, GPL-3.0 (emacs mode), other
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/57/b1/b880503681ea1b64df05106fc7e3c4e3801736cf63deffc6fa7fc5404cf5
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
-PYTHON_DOCUTILS_SETUP_TYPE = distutils
+PYTHON_DOCUTILS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
