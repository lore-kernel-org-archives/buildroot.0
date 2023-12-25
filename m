Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FA3C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBDF414E4;
	Mon, 25 Dec 2023 10:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBDF414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBUc_bgdoFRW; Mon, 25 Dec 2023 10:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2E541587;
	Mon, 25 Dec 2023 10:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F2E541587
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E595F1BF2E5
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE5CE60BE3
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5CE60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1m36fJ7lLzs4 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C7FD6080B
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7FD6080B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC5182AEE; Mon, 25 Dec 2023 10:21:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:20:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b48a1955099085b68df1bdee99bb18848fc2e2cc
X-Git-Newrev: ebe47e7605c6cde295e209d80690508cfd11ba61
X-Patchwork-Hint: ignore
Message-Id: <20231225102118.7FC5182AEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe47e7605c6cde295e209d80690508cfd11ba61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ml_dtypes is a stand-alone implementation of several NumPy
dtype extensions used in machine learning libraries.

https://github.com/jax-ml/ml_dtypes

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/python-ml-dtypes/Config.in                 | 13 ++++++++
 package/python-ml-dtypes/python-ml-dtypes.hash     |  5 +++
 package/python-ml-dtypes/python-ml-dtypes.mk       | 19 +++++++++++
 .../tests/package/sample_python_ml_dtypes.py       | 39 ++++++++++++++++++++++
 .../testing/tests/package/test_python_ml_dtypes.py | 20 +++++++++++
 7 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a232059a62..f4adda40a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1745,6 +1745,7 @@ F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-magic-wormhole-transit-relay/
 F:	package/python-midiutil/
+F:	package/python-ml-dtypes/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
@@ -1756,6 +1757,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_midiutil.py
+F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
@@ -1806,6 +1808,7 @@ F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
+F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index 67713e9209..aa79c2dae4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1173,6 +1173,7 @@ menu "External python modules"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
+	source "package/python-ml-dtypes/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-mpd2/Config.in"
diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
new file mode 100644
index 0000000000..72506896df
--- /dev/null
+++ b/package/python-ml-dtypes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_ML_DTYPES
+	bool "python-ml-dtypes"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  ml_dtypes is a stand-alone implementation of several NumPy
+	  dtype extensions used in machine learning libraries.
+
+	  https://github.com/jax-ml/ml_dtypes
diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
new file mode 100644
index 0000000000..a440268e39
--- /dev/null
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
+md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
+sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
new file mode 100644
index 0000000000..92d23bece4
--- /dev/null
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-ml-dtypes
+#
+################################################################################
+
+PYTHON_ML_DTYPES_VERSION = 0.3.1
+PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
+PYTHON_ML_DTYPES_LICENSE = Apache-2.0
+PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
+PYTHON_ML_DTYPES_SETUP_TYPE = distutils
+
+PYTHON_ML_DTYPES_DEPENDENCIES = \
+	host-python-numpy \
+	python-numpy \
+	python-pybind
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_ml_dtypes.py b/support/testing/tests/package/sample_python_ml_dtypes.py
new file mode 100644
index 0000000000..156d54a875
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ml_dtypes.py
@@ -0,0 +1,39 @@
+#! /usr/bin/env python3
+
+# Tests inspired from commands published on project page:
+# https://pypi.org/project/ml-dtypes/
+
+from ml_dtypes import bfloat16
+
+import numpy as np
+
+a = np.zeros(4, dtype=bfloat16)
+assert a.dtype.name == 'bfloat16'
+assert a[0] == 0.0
+
+types = [
+    'bfloat16',
+    'float8_e4m3b11fnuz',
+    'float8_e4m3fn',
+    'float8_e4m3fnuz',
+    'float8_e5m2',
+    'int4',
+    'uint4'
+]
+for t in types:
+    dtype = np.dtype(t)
+    assert dtype.name == t
+
+rng = np.random.default_rng(seed=0)
+vals = rng.uniform(size=10000).astype(bfloat16)
+sum_vals = vals.sum()
+assert sum_vals == 256
+
+b = bfloat16(256) + bfloat16(1)
+assert b == 256
+
+c = np.nextafter(bfloat16(256), bfloat16(np.inf))
+assert c == 258
+
+d = vals.sum(dtype='float32').astype(bfloat16)
+assert d > 4500 and d < 5500
diff --git a/support/testing/tests/package/test_python_ml_dtypes.py b/support/testing/tests/package/test_python_ml_dtypes.py
new file mode 100644
index 0000000000..8d2369576b
--- /dev/null
+++ b/support/testing/tests/package/test_python_ml_dtypes.py
@@ -0,0 +1,20 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MlDtypes(TestPythonPackageBase):
+    __test__ = True
+
+    # Note: BR2_PACKAGE_PYTHON3_ZLIB=y is needed as a runtime
+    # dependency because the Bootlin toolchain used for this test is
+    # tainted with zlib (and gets detected by python3/numpy).
+    # See commit 8ce33fed "package/gdb: gdbserver does not need zlib".
+    # This config entry can be removed as soon as the toolchain is
+    # updated without zlib in its sysroot.
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_ZLIB=y
+        BR2_PACKAGE_PYTHON_ML_DTYPES=y
+        """
+    sample_scripts = ["tests/package/sample_python_ml_dtypes.py"]
+    timeout = 20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
