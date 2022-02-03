Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72397C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 18:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB37827A1;
	Thu,  3 Feb 2022 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqzT8zsl4ib6; Thu,  3 Feb 2022 18:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF9F827F0;
	Thu,  3 Feb 2022 18:25:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC051BF3AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71D49827F0
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkyOnWmpOz0s for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 18:25:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91D7E827A1
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 18:25:11 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id x6so2810640ilg.9
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 10:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3iDSUPDtsYPIhj6pMf4jrjOeUbtTzkO6EaFmjVLBvg=;
 b=W/yuR5ux1v0BSn849tTbDsz9NVMyoIqFd6mFNw8Wq0TyPVJ7CbACtN8jLoIHsTHfyr
 RkaHzg4kJTYhfEOqRO5FHTj6XASNpgZPBzVDQsRxg8dcUya1N4NF2BjQzvRp6B/FYDke
 YeFbYJ0KOyVBl4VjWWdVPDnlXURCKdxrpC3SRhmCgIEQ1DF3Spn1qJ4OGcV7Ixgypkwb
 V3mg2V8/Sk9oHG6s0Y8hoA/cMOofJxtrQPdD4KUY3QR6tki1cvhxUva+Uhg6ysa/bZRw
 +VGylNOx1IdRUngeTMZtuGfjPhapINxwhiPYeTWGUILtrVt3TUyj/8+wP58/3SmPZIf9
 uxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3iDSUPDtsYPIhj6pMf4jrjOeUbtTzkO6EaFmjVLBvg=;
 b=u9imVMOnyVN2sD5Fp1fcWJRBRACGTAFelYU43Bf83S2cxdRwoTZ9ezQYU9CtzJw+Hy
 7OqxBMXsA6e3Og5aD5nZQiiBU6u2JvbfpN7bxU4gcwnY61tmJLyMEYJ3vwouXnDySGkw
 1OoJGzaJ4ppyQYPDZE8HO532HzYauXCfxMHBaJeD0PRn3dopyhXdxSEMwzzx6n2xQ8yf
 KMwEk+Bhjihiy3l+gM//dqt1uqpRnH3qPfI5q8aS6eMQPy4jd5o5ou5uLyhtGpH5Rjm2
 QBZ+wUTPp6+Gx3kCDgzmAYatF6w0c4eoo3MJ/FkdmuLND+ZZluEYZS7Vi4ZqxSU8n7SG
 Liug==
X-Gm-Message-State: AOAM532vIVPTKyjsaqr0w6yvjJnFx35QqXpKzRVeg5YiEdrFRE4wPiZN
 6sNeDTOgKDvA5Vi5P42nmc6L4WrOgNQ=
X-Google-Smtp-Source: ABdhPJyb0YespkpV3Aib0FAcnupGVad4tn5K14pY8J5HsNmo3IQC+js8aafA6B5FTImD37RtOZwk8w==
X-Received: by 2002:a05:6e02:15c4:: with SMTP id
 q4mr21746259ilu.15.1643912710309; 
 Thu, 03 Feb 2022 10:25:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id d11sm15698452ioc.49.2022.02.03.10.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:25:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 11:25:08 -0700
Message-Id: <20220203182508.3046615-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: bump to version
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to Python-2.0 license addition.

Change GPL-3.0 license to correct GPL-3.0+ variant.

Switch from distutils to setuptools.

Fixes:
http://autobuild.buildroot.net/results/f24/f24e332688cb1118c8d28343f424d0ce1c78f7a8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Update-setup.py.patch                | 64 -------------------
 package/python-docutils/python-docutils.hash  |  9 +--
 package/python-docutils/python-docutils.mk    |  8 +--
 3 files changed, 9 insertions(+), 72 deletions(-)
 delete mode 100644 package/python-docutils/0001-Update-setup.py.patch

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
index ccccca1064..05984b77a3 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5	e26a308d8000b0bed7416a633217c676  docutils-0.15.2.tar.gz
-sha256	a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99  docutils-0.15.2.tar.gz
-sha256  efa0c85aa99ea5b4781240031b0d02af54d7b5554c87ad2b2bea9ba490f6663f  COPYING.txt
+# md5, sha256 from https://pypi.org/pypi/docutils/json
+md5  ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
+sha256  679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 9a42d3e5dc..52c4613996 100644
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
+PYTHON_DOCUTILS_LICENSE = Public Domain, Python-2.0, BSD-2-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
-PYTHON_DOCUTILS_SETUP_TYPE = distutils
+PYTHON_DOCUTILS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
