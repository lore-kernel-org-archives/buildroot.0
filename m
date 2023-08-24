Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C8AC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF59D614CE;
	Fri, 25 Aug 2023 17:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF59D614CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCo0Q06X2eF6; Fri, 25 Aug 2023 17:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC8C4614C4;
	Fri, 25 Aug 2023 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8C4614C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9BBE1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945CD83BC5
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 945CD83BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zJ2vDWCJ0_e for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:01:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B0B83ACD
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B0B83ACD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E7D486383; Fri, 25 Aug 2023 17:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:43:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdb15addcbf862182f82f70c2ff76124ba3538de
X-Git-Newrev: 7412789bfd55efc7797945a83bef4e4741faaf0e
X-Patchwork-Hint: ignore
Message-Id: <20230825170108.2E7D486383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-segno: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7412789bfd55efc7797945a83bef4e4741faaf0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

segno 1.5.2 https://pypi.org/project/segno/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  5 +++++
 package/Config.in                                    |  1 +
 package/python-segno/Config.in                       |  7 +++++++
 package/python-segno/python-segno.hash               |  5 +++++
 package/python-segno/python-segno.mk                 | 14 ++++++++++++++
 support/testing/tests/package/sample_python_segno.py | 13 +++++++++++++
 support/testing/tests/package/test_python_segno.py   | 11 +++++++++++
 7 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6fd1021e98..f91c4e9a2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3110,6 +3110,11 @@ F:	package/time/
 N:	Will Wagner <will_wagner@carallon.com>
 F:	package/yaffs2utils/
 
+N:	Witold Lipieta <witold.lipieta@thaumatec.com>
+F:	package/python-segno/
+F:	support/testing/tests/package/sample_python_segno.py
+F:	support/testing/tests/package/test_python_segno.py
+
 N:	Wojciech M. Zabolotny <wzab01@gmail.com>
 F:	package/avrdude/
 F:	package/jack2/
diff --git a/package/Config.in b/package/Config.in
index 3ce869f310..3d16ea37d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1288,6 +1288,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-segno/Config.in"
 	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-sentry-sdk/Config.in"
diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
new file mode 100644
index 0000000000..3957cd79bf
--- /dev/null
+++ b/package/python-segno/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SEGNO
+	bool "python-segno"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  QR Code and Micro QR Code generator for Python 2 and Python 3
+
+	  https://github.com/heuer/segno/
diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
new file mode 100644
index 0000000000..286bdf3615
--- /dev/null
+++ b/package/python-segno/python-segno.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/segno/json
+md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
+sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
new file mode 100644
index 0000000000..c832f38f4b
--- /dev/null
+++ b/package/python-segno/python-segno.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-segno
+#
+################################################################################
+
+PYTHON_SEGNO_VERSION = 1.5.2
+PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
+PYTHON_SEGNO_SETUP_TYPE = setuptools
+PYTHON_SEGNO_LICENSE = BSD-3-Clause
+PYTHON_SEGNO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_segno.py b/support/testing/tests/package/sample_python_segno.py
new file mode 100644
index 0000000000..c96d6087ce
--- /dev/null
+++ b/support/testing/tests/package/sample_python_segno.py
@@ -0,0 +1,13 @@
+import segno
+import os
+import tempfile
+
+qr = segno.make_qr('http:/www.example.org/')
+with tempfile.NamedTemporaryFile('wb', suffix='.png', delete=False) as f:
+    fn = f.name
+qr.save(fn)
+expected = b'\211PNG\r\n\032\n'  # PNG magic number
+with open(fn, mode='rb') as f:
+    val = f.read(len(expected))
+os.unlink(fn)
+assert expected == val
diff --git a/support/testing/tests/package/test_python_segno.py b/support/testing/tests/package/test_python_segno.py
new file mode 100644
index 0000000000..75e7124399
--- /dev/null
+++ b/support/testing/tests/package/test_python_segno.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Segno(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SEGNO=y
+        """
+    sample_scripts = ["tests/package/sample_python_segno.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
