Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA714C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5568D6124E
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5568D6124E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF6B340019;
	Thu, 23 Sep 2021 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JqTxYxrQNtH; Thu, 23 Sep 2021 20:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3F4401A4;
	Thu, 23 Sep 2021 20:16:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 689931BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58AC340694
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_mR4KMPqQAV for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53B4B40650
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C96188CAA5; Thu, 23 Sep 2021 20:13:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:41:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe1eb2a0b3549d80cfe9fe23a870c1c8661acf57
X-Git-Newrev: 8bc8f4c4161ddfd255615ce0962b570da20c4148
X-Patchwork-Hint: ignore
Message-Id: <20210923201359.C96188CAA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-{smmap2,
 gitdb2}: bump versions to 4.0.0 and 4.0.7
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8bc8f4c4161ddfd255615ce0962b570da20c4148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the python-smmap2 and python-gitdb2 packages in
lockstep, as the new version of gitdb2 requires a newer version of
smmap2, but the current version of gitdb2 cannot work with the newer
version of smmap2 (sigh).

Also, upstream the projects have been renamed: gitdb2 is now named
gitdb on PyPi (see https://pypi.org/project/gitdb2/) and smmap2 is now
named smmap (https://pypi.org/project/smmap2/). However, to avoid
needless churn, we don't rename the Buildroot packages, but that
rename is visible in the name of the tarballs being downloaded.

Also, since version 4.0.0, smmap supports only Python 3.x, so we add a
dependency on Python 3.x and drop the test case of gitdb2 on Python
2.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-gitdb2/Config.in                     |  4 ++--
 package/python-gitdb2/python-gitdb2.hash            |  6 +++---
 package/python-gitdb2/python-gitdb2.mk              |  6 +++---
 package/python-smmap2/Config.in                     |  1 +
 package/python-smmap2/python-smmap2.hash            |  6 +++---
 package/python-smmap2/python-smmap2.mk              |  6 +++---
 support/testing/tests/package/test_python_gitdb2.py | 10 ----------
 support/testing/tests/package/test_python_smmap2.py | 10 ----------
 8 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/package/python-gitdb2/Config.in b/package/python-gitdb2/Config.in
index a5962e7b77..158e4b6980 100644
--- a/package/python-gitdb2/Config.in
+++ b/package/python-gitdb2/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_GITDB2
 	bool "python-gitdb2"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SMMAP2 # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON  # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3  # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  GitDB allows you to access bare git repositories for reading
 	  and writing. It aims at allowing full access to loose objects
diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index e97d25cf4f..7d9bf78f70 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/gitdb2/json
-md5	1a7ea3362e405f8a5634f7ee53636094  gitdb2-2.0.6.tar.gz
-sha256	1b6df1433567a51a4a9c1a5a0de977aa351a405cc56d7d35f3388bad1f630350  gitdb2-2.0.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/gitdb/json
+md5	3f52187435ab0b6e64a15782ffaf29ab  gitdb-4.0.7.tar.gz
+sha256	96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005  gitdb-4.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256	efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 7664a13504..91a17e24a7 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GITDB2_VERSION = 2.0.6
-PYTHON_GITDB2_SOURCE = gitdb2-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/c5/62/ed7205331e8d7cc377e2512cb32f8f8f075c0defce767551d0a76e102ce2
+PYTHON_GITDB2_VERSION = 4.0.7
+PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/34/fe/9265459642ab6e29afe734479f94385870e8702e7f892270ed6e52dd15bf
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
diff --git a/package/python-smmap2/Config.in b/package/python-smmap2/Config.in
index 21a3bdb613..1d4b1fabbe 100644
--- a/package/python-smmap2/Config.in
+++ b/package/python-smmap2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SMMAP2
 	bool "python-smmap2"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Smmap wraps an interface around mmap and tracks the mapped
 	  files as well as the amount of clients who use it. If the
diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index 8a7ea42a5d..9ae758fc62 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/smmap2/json
-md5	1c59a985be5aa645c4c5a4e063a40dd5  smmap2-2.0.5.tar.gz
-sha256	29a9ffa0497e7f2be94ca0ed1ca1aa3cd4cf25a1f6b4f5f87f74b46ed91d609a  smmap2-2.0.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/smmap/json
+md5	61882572be57023980c36f5493523077  smmap-4.0.0.tar.gz
+sha256	7e65386bd122d45405ddf795637b7f7d2b532e7e401d46bbe3fb49b9986d5182  smmap-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index daf379fe1a..bcf20206ce 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 2.0.5
-PYTHON_SMMAP2_SOURCE = smmap2-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/3b/ba/e49102b3e8ffff644edded25394b2d22ebe3e645f3f6a8139129c4842ffe
+PYTHON_SMMAP2_VERSION = 4.0.0
+PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/dd/d4/2b4f196171674109f0fbb3951b8beab06cd0453c1b247ec0c4556d06648d
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/test_python_gitdb2.py b/support/testing/tests/package/test_python_gitdb2.py
index fc55f20821..9e22df06b5 100644
--- a/support/testing/tests/package/test_python_gitdb2.py
+++ b/support/testing/tests/package/test_python_gitdb2.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Gitdb2(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_GITDB2=y
-        """
-    sample_scripts = ["tests/package/sample_python_gitdb2.py"]
-
-
 class TestPythonPy3Gitdb2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_smmap2.py b/support/testing/tests/package/test_python_smmap2.py
index 07c0e6621e..a6434c5705 100644
--- a/support/testing/tests/package/test_python_smmap2.py
+++ b/support/testing/tests/package/test_python_smmap2.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Smmap2(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_SMMAP2=y
-        """
-    sample_scripts = ["tests/package/sample_python_smmap2.py"]
-
-
 class TestPythonPy3Smmap2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
