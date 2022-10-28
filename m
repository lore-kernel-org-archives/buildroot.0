Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028FBC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC2E8140C;
	Fri, 28 Oct 2022 06:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC2E8140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSU347brrICO; Fri, 28 Oct 2022 06:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D07980B52;
	Fri, 28 Oct 2022 06:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D07980B52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA331BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1314880B3E
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1314880B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XskuOTYYEWkM for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:51:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 099F880C44
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099F880C44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9923873BC; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:49:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55
X-Git-Newrev: 488055eb58ce23e28e08b9c9a0ed72c5de9ce47e
X-Patchwork-Hint: ignore
Message-Id: <20221028065137.E9923873BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyzmq: bump to version
 24.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=488055eb58ce23e28e08b9c9a0ed72c5de9ce47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to setuptools infrastructure.

Add new host-python-packaging dependency.

Refresh zmq version override patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-the-ZMQ-version-check-to-the-ZMQ-versi.patch} | 37 +++++++++++++++-------
 package/python-pyzmq/python-pyzmq.hash             |  4 +--
 package/python-pyzmq/python-pyzmq.mk               |  8 ++---
 3 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
similarity index 55%
rename from package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
rename to package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
index 315c8c8bb2..18553582f4 100644
--- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
+++ b/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
@@ -1,4 +1,8 @@
-detect.py: fix the ZMQ version check to the ZMQ version of the buildroot
+From 8eae1193457f72899f9cc2254ae1489026df9bb6 Mon Sep 17 00:00:00 2001
+From: Michael Rommel <rommel@layer-7.net>
+Date: Sat, 10 Aug 2013 00:44:35 +0200
+Subject: [PATCH] detect.py: fix the ZMQ version check to the ZMQ version of
+ the buildroot
 
 The setup.py script tries to compile a test C program and runs it, to
 retrieve a version string for the installed ZMQ library, but if the cross
@@ -17,38 +21,47 @@ Flandrin.
 
 Modified for version 18.0.2 by Asaf Kahlon
 
+Modified for version 24.0.1 by James Hilliard
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Signed-off-by: Lionel Flandrin <lionel@svkt.org>
 Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  buildutils/detect.py | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/buildutils/detect.py b/buildutils/detect.py
-index d1380fe..4a91351 100644
+index 842e3b14..e2eca744 100644
 --- a/buildutils/detect.py
 +++ b/buildutils/detect.py
-@@ -120,13 +120,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+@@ -120,18 +120,20 @@ def detect_zmq(basedir, compiler, **compiler_attrs):
  
      cc = get_compiler(compiler=compiler, **compiler_attrs)
      efile = test_compilation(cfile, compiler=cc, **compiler_attrs)
 -    patch_lib_paths(efile, cc.library_dirs)
 +    #patch_lib_paths(efile, cc.library_dirs)
  
--    rc, so, se = get_output_error([efile])
+     # add library dirs to %PATH% for windows
+     env = os.environ.copy()
+     if sys.platform.startswith("win"):
+         env["PATH"] = os.pathsep.join([env["PATH"]] + cc.library_dirs)
+ 
+-    rc, so, se = get_output_error([efile], env=env)
 -    if rc:
--        msg = "Error running version detection script:\n%s\n%s" % (so,se)
+-        msg = f"Error running version detection script:\n{so}\n{se}"
 -        logging.error(msg)
--        raise IOError(msg)
-+    #rc, so, se = get_output_error([efile])
-+    # if rc:
-+    #     msg = "Error running version detection script:\n%s\n%s" % (so,se)
+-        raise OSError(msg)
++    #rc, so, se = get_output_error([efile], env=env)
++    #if rc:
++    #     msg = f"Error running version detection script:\n{so}\n{se}"
 +    #     logging.error(msg)
-+    #     raise IOError(msg)
++    #     raise OSError(msg)
 +
 +    so = "vers: ##ZEROMQ_VERSION##"
  
-     handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
+     handlers = {'vers': lambda val: tuple(int(v) for v in val.split('.'))}
  
 -- 
-2.20.1
+2.34.1
 
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index ecf6489249..efbc91d83c 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  200abc1a75bdcfff7adf61304f46f55e  pyzmq-19.0.2.tar.gz
-sha256  296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438  pyzmq-19.0.2.tar.gz
+md5  f10b7c3dee2c03557e2c5d00b73dfc7f  pyzmq-24.0.1.tar.gz
+sha256  216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77  pyzmq-24.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
 sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index d1f4314a1e..5792957eaf 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 19.0.2
+PYTHON_PYZMQ_VERSION = 24.0.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/05/77/7483975d84fe1fd24cc67881ba7810e0e7b3ee6c2a0e002a5d6703cca49b
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/46/0d/b06cf99a64d4187632f4ac9ddf6be99cd35de06fe72d75140496a8e0eef5
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-PYTHON_PYZMQ_DEPENDENCIES = zeromq
-PYTHON_PYZMQ_SETUP_TYPE = distutils
+PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
+PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
