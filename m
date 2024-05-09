Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF509C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D03F61304;
	Thu,  9 May 2024 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDp2Ox1oI23P; Thu,  9 May 2024 20:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1594612D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1594612D2;
	Thu,  9 May 2024 20:32:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF3741BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC2DD606DC
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5StcGDz89hj for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C681B60688
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C681B60688
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:32:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B307786DCC; Thu,  9 May 2024 20:32:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:31:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c09bd3c4cb8b6e2e104f3ca2de3c82ce1147fa
X-Git-Newrev: d46b0936ce5a94f1f9867b3d4a19001c087bda99
X-Patchwork-Hint: ignore
Message-Id: <20240509203200.B307786DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sympy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d46b0936ce5a94f1f9867b3d4a19001c087bda99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SymPy is a Python library for symbolic mathematics. It aims
to become a full-featured computer algebra system (CAS)
while keeping the code as simple as possible in order to be
comprehensible and easily extensible. SymPy is written
entirely in Python.

https://www.sympy.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  2 ++
 package/Config.in                                    |  1 +
 package/python-sympy/Config.in                       | 11 +++++++++++
 package/python-sympy/python-sympy.hash               |  7 +++++++
 package/python-sympy/python-sympy.mk                 | 14 ++++++++++++++
 support/testing/tests/package/sample_python_sympy.py | 15 +++++++++++++++
 support/testing/tests/package/test_python_sympy.py   | 13 +++++++++++++
 7 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4af539e3f2..ef870f12d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1784,6 +1784,7 @@ F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
@@ -1878,6 +1879,7 @@ F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
+F:	support/testing/tests/package/test_python_sympy.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
diff --git a/package/Config.in b/package/Config.in
index e72055f220..310b763fbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1371,6 +1371,7 @@ menu "External python modules"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-stack-data/Config.in"
 	source "package/python-starlette/Config.in"
+	source "package/python-sympy/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
diff --git a/package/python-sympy/Config.in b/package/python-sympy/Config.in
new file mode 100644
index 0000000000..1ee26222dc
--- /dev/null
+++ b/package/python-sympy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SYMPY
+	bool "python-sympy"
+	select BR2_PACKAGE_PYTHON_MPMATH # runtime
+	help
+	  SymPy is a Python library for symbolic mathematics. It aims
+	  to become a full-featured computer algebra system (CAS)
+	  while keeping the code as simple as possible in order to be
+	  comprehensible and easily extensible. SymPy is written
+	  entirely in Python.
+
+	  https://www.sympy.org/
diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
new file mode 100644
index 0000000000..947edfd4e0
--- /dev/null
+++ b/package/python-sympy/python-sympy.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/sympy/json
+md5  3e0033109352d7303ea97b9216e16645  sympy-1.12.tar.gz
+sha256  ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8  sympy-1.12.tar.gz
+# Locally computed sha256 checksums
+sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
+sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
+sha256  007bc30a58fa40a996e772047120de4eaf31f5110e4f9c3b5f93fcdfbe2eaca1  sympy/parsing/latex/LICENSE.txt
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
new file mode 100644
index 0000000000..0f160649ad
--- /dev/null
+++ b/package/python-sympy/python-sympy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sympy
+#
+################################################################################
+
+PYTHON_SYMPY_VERSION = 1.12
+PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
+PYTHON_SYMPY_SITE = https://github.com/sympy/sympy/releases/download/sympy-$(PYTHON_SYMPY_VERSION)
+PYTHON_SYMPY_SETUP_TYPE = setuptools
+PYTHON_SYMPY_LICENSE = BSD-3-Clause
+PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sympy.py b/support/testing/tests/package/sample_python_sympy.py
new file mode 100644
index 0000000000..2734e9b4fe
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sympy.py
@@ -0,0 +1,15 @@
+#! /usr/bin/env python3
+
+from sympy import symbols, expand, factor
+
+x, y = symbols('x y')
+
+expr = x + 2*y
+
+expanded_expr = expand(x*expr)
+print(expanded_expr)
+assert str(expanded_expr) == "x**2 + 2*x*y"
+
+factored_expr = factor(expanded_expr)
+print(factored_expr)
+assert str(factored_expr) == "x*(x + 2*y)"
diff --git a/support/testing/tests/package/test_python_sympy.py b/support/testing/tests/package/test_python_sympy.py
new file mode 100644
index 0000000000..e2106eb49a
--- /dev/null
+++ b/support/testing/tests/package/test_python_sympy.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SymPy(TestPythonPackageBase):
+    __test__ = True
+
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SYMPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_sympy.py"]
+    timeout = 20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
