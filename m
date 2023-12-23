Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0613C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 23:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B6060ECC;
	Sat, 23 Dec 2023 23:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B6060ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuXtNcvE2xwl; Sat, 23 Dec 2023 23:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6F160EE7;
	Sat, 23 Dec 2023 23:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6F160EE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1042A1BF5E0
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 23:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F1260EE7
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 23:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F1260EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRGpw1qix5LC for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 23:05:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E2B60ECC
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 23:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E2B60ECC
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DF67713F880;
 Sun, 24 Dec 2023 00:05:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 00:05:13 +0100
Message-ID: <20231223230513.2660613-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703372727;
 bh=7JdI59OzhLRcu8u1uJp1NKcV610dofugyBwlqotSbbA=;
 h=From:To:Cc:Subject:Date:From;
 b=V0tlGoLSXMsFlJKcRO7MM8wSI4LffC8z/aDdf9Uu4tGfFGCXHxHXbZYcGqVMOSUXH
 nYRyWbBdF6eS4BjPOsB2llmXRvCjd4oyrQDiqD7+F+2OOt8pt2qQhrn8vqLQZ1N/3z
 NoMARjk0s89ZTnZ1RJLNomAfGy/fO5aR11/a/sWSf8eouLLXz/lREF6oGGDT2fIHIh
 LsIrYd2Qf0/caf6stv3EJOCo9RRROSser7QzVf/u4z5okUlkUx56pA+PRs/avElDhi
 +Pa4PaG/sXCfJ9Ik1BBq6ftdGiIDjxtWAVdMcPrI9dDJoIALQK6zhjOf2cJOfWW8FE
 lIQcMsvUyXotg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V0tlGoLS
Subject: [Buildroot] [PATCH 1/1] package/python-ml_dtypes: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ml_dtypes is a stand-alone implementation of several NumPy
dtype extensions used in machine learning libraries.

https://github.com/jax-ml/ml_dtypes

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 9212a71 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_ml_dtypes
    ...
    OK  
 
Note: this package is a dependency of tensorflow-lite >= v2.14.0.
For info, tensorflow-lite v.2.11.0 was proposed in Buildroot in:
https://patchwork.ozlabs.org/project/buildroot/list/?series=346546
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/python-ml_dtypes/Config.in            | 13 +++++++
 .../python-ml_dtypes/python-ml_dtypes.hash    |  5 +++
 package/python-ml_dtypes/python-ml_dtypes.mk  | 19 +++++++++
 .../tests/package/sample_python_ml_dtypes.py  | 39 +++++++++++++++++++
 .../tests/package/test_python_ml_dtypes.py    | 20 ++++++++++
 7 files changed, 100 insertions(+)
 create mode 100644 package/python-ml_dtypes/Config.in
 create mode 100644 package/python-ml_dtypes/python-ml_dtypes.hash
 create mode 100644 package/python-ml_dtypes/python-ml_dtypes.mk
 create mode 100644 support/testing/tests/package/sample_python_ml_dtypes.py
 create mode 100644 support/testing/tests/package/test_python_ml_dtypes.py

diff --git a/DEVELOPERS b/DEVELOPERS
index bad07d51aa..8b64cb74d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1741,6 +1741,7 @@ F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-magic-wormhole-transit-relay/
 F:	package/python-midiutil/
+F:	package/python-ml_dtypes/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
@@ -1752,6 +1753,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_midiutil.py
+F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
@@ -1802,6 +1804,7 @@ F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
+F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index bc723fe018..7442b9d920 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1170,6 +1170,7 @@ menu "External python modules"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
+	source "package/python-ml_dtypes/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-mpd2/Config.in"
diff --git a/package/python-ml_dtypes/Config.in b/package/python-ml_dtypes/Config.in
new file mode 100644
index 0000000000..c487692b7a
--- /dev/null
+++ b/package/python-ml_dtypes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_ML_DTYPES
+	bool "python-ml_dtypes"
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
diff --git a/package/python-ml_dtypes/python-ml_dtypes.hash b/package/python-ml_dtypes/python-ml_dtypes.hash
new file mode 100644
index 0000000000..a440268e39
--- /dev/null
+++ b/package/python-ml_dtypes/python-ml_dtypes.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
+md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
+sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml_dtypes/python-ml_dtypes.mk b/package/python-ml_dtypes/python-ml_dtypes.mk
new file mode 100644
index 0000000000..555632c428
--- /dev/null
+++ b/package/python-ml_dtypes/python-ml_dtypes.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-ml_dtypes
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
