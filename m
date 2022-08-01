Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A40FC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E42F60BA9;
	Mon,  1 Aug 2022 17:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E42F60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtNaJG1ZtWAq; Mon,  1 Aug 2022 17:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F272760B3B;
	Mon,  1 Aug 2022 17:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F272760B3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D76D21BF9AD
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CA26072A
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CA26072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnsarB7mgULj for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A07DD605A2
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07DD605A2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9ACFA86BB0; Mon,  1 Aug 2022 17:19:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 19:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd9fa0e8366711a229a4ca5f33a056bf0e95d729
X-Git-Newrev: e10431db29e08c3ae56c145165bf110bd17f2a6c
X-Patchwork-Hint: ignore
Message-Id: <20220801171936.9ACFA86BB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e10431db29e08c3ae56c145165bf110bd17f2a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[Arnout:
 - Indent hash file with two spaces.
 - Bump to 1.7.3 to fix build failure with recent GCC.
 - Get from github instead of PyPI.
 - Add host-meson and host-python-pythran dependencies.
 - Properly propagate Config.in dependencies.
 - Correct usage of BR2_INSTALL_LIBSTDCPP symbol.
 - Remove F77, no longer used.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Guillaume:
 - -lnpymath: npymath.ini localization problem
 - -lnpyrandom resolution problem
 - fix legal-info for latest version LICENSE.txt
 - zlib is a scipy::io module runtime requirement
 - update serie for scipy 1.8.1 (latest)
]
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Thomas:
 - add runtime test
 - drop dependency on OpenBLAS, which is not needed in a minimal
   configuration
 - remove PYTHON_SCIPY_NPY_PKG_CONFIG_PATH logic as it is no longer
   needed
]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  6 +++
 package/Config.in                                  |  1 +
 package/python-scipy/Config.in                     | 25 ++++++++++
 package/python-scipy/python-scipy.hash             |  9 ++++
 package/python-scipy/python-scipy.mk               | 56 ++++++++++++++++++++++
 .../testing/tests/package/sample_python_scipy.py   | 12 +++++
 support/testing/tests/package/test_python_scipy.py | 30 ++++++++++++
 7 files changed, 139 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3398111256..2a9b6e29e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,10 +1185,13 @@ F:	package/python-beniget/
 F:	package/python-gast/
 F:	package/python-pybind/
 F:	package/python-pythran/
+F:	package/python-scipy/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
+F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_pybind.py
+F:	support/testing/tests/package/test_python_scipy.py
 
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
@@ -1312,6 +1315,9 @@ F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
+F:	package/python-scipy/
+F:	support/testing/tests/package/sample_python_scipy.py
+F:	support/testing/tests/package/test_python_scipy.py
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
diff --git a/package/Config.in b/package/Config.in
index fd0598c537..b025097008 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1229,6 +1229,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..0fa6c9e311
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_PYTHON_SCIPY
+	bool "python-scipy"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LAPACK
+	select BR2_PACKAGE_ZLIB # runtime scipy::io
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  The SciPy library is one of the core packages that make up the
+	  SciPy stack. It provides many user-friendly and efficient
+	  numerical routines such as routines for numerical integration,
+	  interpolation, optimization, linear algebra and statistics.
+
+	  https://www.scipy.org/scipylib/
+
+comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
new file mode 100644
index 0000000000..0274679c43
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,9 @@
+# Locally generated
+sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
+sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
+sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
+sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
+sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING
+sha256  34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..b5006a2e15
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.8.1
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
+PYTHON_SCIPY_LICENSE = \
+	BSD-3-Clause, \
+	BSD-2-Clause, \
+	BSD, \
+	BSD-Style, \
+	MIT, \
+	Qhull
+PYTHON_SCIPY_LICENSE_FILES = \
+	LICENSE.txt \
+	scipy/linalg/src/lapack_deprecations/LICENSE \
+	scipy/ndimage/LICENSE.txt \
+	scipy/optimize/tnc/LICENSE \
+	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
+	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
+	scipy/spatial/qhull_src/COPYING.txt
+PYTHON_SCIPY_DEPENDENCIES += \
+	host-python-numpy \
+	host-python-pythran \
+	zlib \
+	lapack \
+	python-numpy \
+	python-pybind
+PYTHON_SCIPY_INSTALL_STAGING = YES
+
+PYTHON_SCIPY_SETUP_TYPE = setuptools
+PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+
+PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
+	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
+# -lnpyrandom localization
+PYTHON_SCIPY_LDFLAGS += \
+	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+
+PYTHON_SCIPY_ENV = \
+	F90=$(TARGET_FC) \
+	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
+
+# Provide system configuration options to numpy distutils extensions, telling
+# to find all include files and libraries in staging directory.
+define PYTHON_SCIPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+endef
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_scipy.py b/support/testing/tests/package/sample_python_scipy.py
new file mode 100644
index 0000000000..df0c7ce5fe
--- /dev/null
+++ b/support/testing/tests/package/sample_python_scipy.py
@@ -0,0 +1,12 @@
+import numpy
+import scipy.special
+import scipy.integrate
+
+cb = scipy.special.cbrt([27, 64])
+assert((cb == numpy.array([3., 4.])).all())
+
+com = scipy.special.comb(5, 2, exact = False, repetition=True)
+assert(com == 15.0)
+
+t = scipy.integrate.trapezoid([5,8,10])
+assert(t == 15.5)
diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
new file mode 100644
index 0000000000..fec4f4319f
--- /dev/null
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -0,0 +1,30 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SciPy(TestPythonPackageBase):
+    __test__ = True
+    # We can't use the base configuration, as we need a glibc
+    # toolchain for scipy
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SCIPY=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_scipy.py"]
+
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
