Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C4EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 20:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC96741D64;
	Wed, 12 Jul 2023 20:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC96741D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSezCFc6rjn4; Wed, 12 Jul 2023 20:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8876C41D77;
	Wed, 12 Jul 2023 20:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8876C41D77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 040C71BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 20:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1BA760F0B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BA760F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPH-Jfl-9VS9 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 20:56:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8CF5612AD
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 20:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8CF5612AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95ECB86F26; Wed, 12 Jul 2023 20:56:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 22:55:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 490882ada94cf98da145feb4e7e47302aa31104f
X-Git-Newrev: 800c7de810f943ad6fd6ee404c92e6fac01c693a
X-Patchwork-Hint: ignore
Message-Id: <20230712205604.95ECB86F26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hiredis: bump to version
 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=800c7de810f943ad6fd6ee404c92e6fac01c693a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The existing patch is removed as it has been applied upstream in
commit
https://github.com/redis/hiredis-py/commit/d4d701a06560ce76a4eaba3ac309ff70e37b3190.

The license file has changed, it is now named LICENSE, and the
contents are not the same even though it still contains the
BSD-3-Clause license.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-setup.py-fix-build-with-gcc-4.8.patch     | 43 ----------------------
 package/python-hiredis/python-hiredis.hash         |  6 +--
 package/python-hiredis/python-hiredis.mk           |  6 +--
 4 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 52d748fa45..23b0171792 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1239,7 +1239,6 @@ package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.pat
 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch Upstream
 package/python-daphne/0001-remove-pytest-runner-requirement.patch Upstream
 package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch Upstream
-package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch Upstream
 package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch Upstream
diff --git a/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch b/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 93f9440a74..0000000000
--- a/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 204898e28c7650089bf664eea8adfc16a22ba4f4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Apr 2021 10:37:49 +0200
-Subject: [PATCH] setup.py: fix build with gcc 4.8
-
-Fix the following build failure on gcc 4.8 which is raised since version
-2.0.0 and
-https://github.com/redis/hiredis-py/commit/9084152f624e8e593b4e86ddf8bd13329fdfc043:
-
-vendor/hiredis/read.c: In function 'redisReaderFree':
-vendor/hiredis/read.c:646:9: error: 'for' loop initial declarations are only allowed in C99 mode
-         for (int i = 0; i < r->tasks; i++) {
-         ^
-vendor/hiredis/read.c:646:9: note: use option -std=c99 or -std=gnu99 to compile your code
-
-This build failure is raised because hiredis source code is built
-without C99:
-https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db
-
-Fixes:
- - http://autobuild.buildroot.org/results/04cbcddf6d83ebad8c98400754f9445375e9e489
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/redis/hiredis-py/pull/110]
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index d83153b..1f623c9 100755
---- a/setup.py
-+++ b/setup.py
-@@ -13,6 +13,7 @@ def version():
- ext = Extension("hiredis.hiredis",
-   sources=sorted(glob.glob("src/*.c") +
-                  ["vendor/hiredis/%s.c" % src for src in ("alloc", "read", "sds")]),
-+  extra_compile_args=["-std=c99"],
-   include_dirs=["vendor"])
- 
- setup(
--- 
-2.30.2
-
diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 2e73d2f37b..372f2f50ae 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  0ab76a8b29deb737c9bfc7f631969e38  hiredis-2.0.0.tar.gz
-sha256  81d6d8e39695f2c37954d1011c0480ef7cf444d4e3ae24bc5e89ee5de360139a  hiredis-2.0.0.tar.gz
+md5  670a932c2972cbd88f910c2b29f85c3c  hiredis-2.2.3.tar.gz
+sha256  e75163773a309e56a9b58165cf5a50e0f84b755f6ff863b2c01a38918fe92daa  hiredis-2.2.3.tar.gz
 # Locally computed sha256 checksums
-sha256  70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
+sha256  65d467915fa36249f60e6942c9d44dfe54d75882e6b66e94fc6c3971fcde1722  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 55f9a09f55..5aceb15ae1 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 2.0.0
+PYTHON_HIREDIS_VERSION = 2.2.3
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/0c/39/eae11344d69ba435ec13d6bcc1a9eea3d2278324506fcd0e52d1ed8958c8
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b0/04/dab6792584fc548803ffa50b5bb2b99f01d3ab04d7c7f64e85f1a22fb847
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = BSD-3-Clause
-PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
+PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
