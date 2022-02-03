Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF97C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 09:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C6040116;
	Thu,  3 Feb 2022 09:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eJQ-Fqh-28b; Thu,  3 Feb 2022 09:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 783524011C;
	Thu,  3 Feb 2022 09:08:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 684A91BF303
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 09:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 627E6410D0
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 09:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Und2auNLq9im for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 09:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BEB740A02
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 09:08:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l5so4428320edv.3
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=sQOpUihwq0CFESAxzCvS3RkyR3IEYxHquFRi32K3FGQ=;
 b=Lxc6FYuS/BSUkrSgT7c1gkUO9H6F5LiDdTAvtPNbunlKBj+wPQP1q4jMTPGdeHGKLf
 ThneaTvoiLZSVIHx3rcIqidUODrJ1zX2ic6GR/316Au8Lk7Ih8GMGZ1JX3J+MmT9xHuf
 lsJl0lEq/EI5/ycDem71mMQCkCZrNEd8irI4fX7vPyq/UYgYURKOYG6WkOAUggLATvvS
 jNvQ8M7f3W0g46FqJmyJ4bpL/adQFwOYWQc7AN///9z7vsXJ3BIOBk1r28+3aUoqaShD
 fJK8UhAb35KoGORBJ7Vu3/3SAzSF/1fPX1G8R3aZ0y9xMZB4n7ji68x6bbiDO698TEjN
 va3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sQOpUihwq0CFESAxzCvS3RkyR3IEYxHquFRi32K3FGQ=;
 b=6m2W11dO39Y0Fp0EpAxJS67Ydouf4ZV8gBtHXNhtW3GhCo5FOaETDWCAR7WChGERJh
 iohCU9hDDZe18ViKKLASozkAo3WgkZqw4WYtYGHZZX2HmWqdfSipeX5JtKigfvjhqEt2
 UE+eG3p0LDzksOO6kLb9YFZds4bxLVmmA0fwZrNEojEmfakHyO+M9wrVW7Ea3GWPhBxy
 rThoX9t3RSlVNQ4v4vgkJXq7KKE6u1RufvpfZi2urnJkFLE0+f42s2ILwOiwkMQ+SU/x
 3zsOoEG7qaTVae7yB5w1RnIUPq6c2+pFbrF0stiUr191oeUBJlyu4HDrmFe3y+ba8g+t
 vkdw==
X-Gm-Message-State: AOAM532m7F9JgQvMO8N+YMNPVXnxHOjOgoFMDSzz0fH8E0pK+y9q82Js
 45JxcEiwRaFaQqEdqT084XNQhzEMARMJyg==
X-Google-Smtp-Source: ABdhPJxxWyetKiiGYazfeXbl5zrtY+W/0D0OwW8qYFSUzqLolAdu5fp0Zz9VzXku/r+DisAW9+0o7Q==
X-Received: by 2002:a05:6402:143:: with SMTP id
 s3mr33982894edu.7.1643879331987; 
 Thu, 03 Feb 2022 01:08:51 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id gg14sm16545153ejb.63.2022.02.03.01.08.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Feb 2022 01:08:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 10:08:48 +0100
Message-Id: <20220203090848.22869-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-docutils: bump to version 0.18.1
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove the obsolete patch as docutils is now a setuptools package.

The package also includes code licensed under BSD-3-Clause licence.
COPYING.txt has the following changes:

* copyright year
* more exceptions from the Public Domain added
* BSD-3-Clause license added

Fixes:
http://autobuild.buildroot.net/results/02dd94c09dabdbdd8b47673393577a7fd3af3aeb

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-Update-setup.py.patch                | 64 -------------------
 package/python-docutils/python-docutils.hash  |  6 +-
 package/python-docutils/python-docutils.mk    |  8 +--
 3 files changed, 7 insertions(+), 71 deletions(-)
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
index ccccca1064..9f6bb53bdb 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5	e26a308d8000b0bed7416a633217c676  docutils-0.15.2.tar.gz
-sha256	a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99  docutils-0.15.2.tar.gz
-sha256  efa0c85aa99ea5b4781240031b0d02af54d7b5554c87ad2b2bea9ba490f6663f  COPYING.txt
+md5	ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
+sha256	679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
+sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 9a42d3e5dc..3872b54906 100644
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
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
-PYTHON_DOCUTILS_SETUP_TYPE = distutils
+PYTHON_DOCUTILS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
