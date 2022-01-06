Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CFBC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E8D428B9;
	Thu,  6 Jan 2022 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2t2Bc81wfPZ; Thu,  6 Jan 2022 08:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CF0428B5;
	Thu,  6 Jan 2022 08:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8A4F1BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C232D428B5
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGFUxzZq6SzP for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:30:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED136428B4
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A920582A92; Thu,  6 Jan 2022 08:24:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 09:28:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b4e139770b03a50dd93202bff50d2acda113346
X-Git-Newrev: 63b72a7c15bcd56fe1570e3f7ecd43993c0fde90
X-Patchwork-Hint: ignore
Message-Id: <20220106082409.A920582A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aexpect: new package
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
Content-Type: multipart/mixed; boundary="===============6582142028875341303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6582142028875341303==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=63b72a7c15bcd56fe1570e3f7ecd43993c0fde90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package was initially requested by José Pekkarinen, so he is
assigned as the maintainer for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  3 +++
 package/Config.in                                      |  1 +
 package/python-aexpect/Config.in                       |  8 ++++++++
 package/python-aexpect/python-aexpect.hash             |  5 +++++
 package/python-aexpect/python-aexpect.mk               | 14 ++++++++++++++
 support/testing/tests/package/sample_python_aexpect.py |  1 +
 support/testing/tests/package/test_python_aexpect.py   | 12 ++++++++++++
 7 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b04f90ccb..a52a8cfa38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1487,7 +1487,10 @@ F:	support/testing/tests/package/test_zfs.py
 N:	José Pekkarinen <jose.pekkarinen@unikie.com>
 F:	package/alfred/
 F:	package/bmx7/
+F:	package/python-aexpect/
 F:	package/softhsm2/
+F:	support/testing/tests/package/sample_python_aexpect.py
+F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
diff --git a/package/Config.in b/package/Config.in
index 9f4ab72a80..cb15574746 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -891,6 +891,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aenum/Config.in"
+	source "package/python-aexpect/Config.in"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aioconsole/Config.in"
diff --git a/package/python-aexpect/Config.in b/package/python-aexpect/Config.in
new file mode 100644
index 0000000000..eddba8e0b7
--- /dev/null
+++ b/package/python-aexpect/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AEXPECT
+	bool "python-aexpect"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Aexpect.
+
+	  http://avocado-framework.github.io/
diff --git a/package/python-aexpect/python-aexpect.hash b/package/python-aexpect/python-aexpect.hash
new file mode 100644
index 0000000000..efe4f55fb8
--- /dev/null
+++ b/package/python-aexpect/python-aexpect.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aexpect/json
+md5  d37473ff0024c15938bfe86a543537e6  aexpect-1.6.4.tar.gz
+sha256  3998aa84ae54963fd59488f0caa533f6edbb31bc6cb842da09b041cbad56ad88  aexpect-1.6.4.tar.gz
+# Locally computed sha256 checksums
+sha256  7be26abf35e531a226dc742d2379d42d372cb61f027a6e26477c0e2f1a03bfcb  LICENSE
diff --git a/package/python-aexpect/python-aexpect.mk b/package/python-aexpect/python-aexpect.mk
new file mode 100644
index 0000000000..8b5e165135
--- /dev/null
+++ b/package/python-aexpect/python-aexpect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aexpect
+#
+################################################################################
+
+PYTHON_AEXPECT_VERSION = 1.6.4
+PYTHON_AEXPECT_SOURCE = aexpect-$(PYTHON_AEXPECT_VERSION).tar.gz
+PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/3b/22/f87ffa70348dde4597d9314995be89c8d4c7728260033b972a8d691e3f7d
+PYTHON_AEXPECT_SETUP_TYPE = setuptools
+PYTHON_AEXPECT_LICENSE = GPL-2.0+
+PYTHON_AEXPECT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_aexpect.py b/support/testing/tests/package/sample_python_aexpect.py
new file mode 100644
index 0000000000..a31a17bd1d
--- /dev/null
+++ b/support/testing/tests/package/sample_python_aexpect.py
@@ -0,0 +1 @@
+import aexpect
diff --git a/support/testing/tests/package/test_python_aexpect.py b/support/testing/tests/package/test_python_aexpect.py
new file mode 100644
index 0000000000..5b018399b3
--- /dev/null
+++ b/support/testing/tests/package/test_python_aexpect.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Aexpect(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AEXPECT=y
+        """
+    sample_scripts = ["tests/package/sample_python_aexpect.py"]
+    timeout = 30

--===============6582142028875341303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6582142028875341303==--
