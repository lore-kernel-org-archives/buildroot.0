Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC965E77372
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D1283E0C;
	Sat, 30 Sep 2023 12:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D1283E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foPsJFSsWU-C; Sat, 30 Sep 2023 12:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66EC483DE2;
	Sat, 30 Sep 2023 12:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66EC483DE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31F601BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCF881489
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCF881489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShzSIGtZ8zdC for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC20D81413
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC20D81413
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6D9A8399D; Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 12:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca63464e3777ca2596b4d396accb6a384ccf8514
X-Git-Newrev: 42127f01bc08211e1dbba2cac7425488dee7dc3a
X-Patchwork-Hint: ignore
Message-Id: <20230930124406.B6D9A8399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: bump to version
 1.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=42127f01bc08211e1dbba2cac7425488dee7dc3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to meson package infrastructure.

Add new openblas dependency.

License hash changed due to date update:
https://github.com/scipy/scipy/commit/d3f0aea40f64e478085b6478a9fe55ca8a75b087

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scipy/Config.in         |  3 +++
 package/python-scipy/python-scipy.hash |  5 ++---
 package/python-scipy/python-scipy.mk   | 37 ++++++++++++----------------------
 3 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 229b5997ad..0a4acb9699 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	bool "python-scipy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
+	select BR2_PACKAGE_OPENBLAS
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime scipy::io
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -20,6 +22,7 @@ config BR2_PACKAGE_PYTHON_SCIPY
 comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..9634771139 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,7 +1,6 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
-sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
-sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256  f9b0248cb9d08eead44cde47cbf6339f1e9aa0dfde28f5fb27950743e317bd5d  scipy-1.11.0.tar.gz
+sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index a8c23c6c88..3010cfbd54 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
-PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
+PYTHON_SCIPY_VERSION = 1.11.0
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/fa/d0/724c8204f87b6f807e3e67de32b8b4922d579154a448ce94e89129064bf1
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
@@ -16,7 +16,6 @@ PYTHON_SCIPY_LICENSE = \
 	Qhull
 PYTHON_SCIPY_LICENSE_FILES = \
 	LICENSE.txt \
-	scipy/linalg/src/lapack_deprecations/LICENSE \
 	scipy/ndimage/LICENSE.txt \
 	scipy/optimize/tnc/LICENSE \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
@@ -25,34 +24,24 @@ PYTHON_SCIPY_LICENSE_FILES = \
 PYTHON_SCIPY_CPE_ID_VENDOR = scipy
 PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
 PYTHON_SCIPY_DEPENDENCIES += \
+	host-python-cython \
 	host-python-numpy \
 	host-python-pythran \
 	zlib \
 	lapack \
+	openblas \
+	python3 \
 	python-numpy \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
-PYTHON_SCIPY_SETUP_TYPE = setuptools
-PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+PYTHON_SCIPY_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
-PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
-	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
-# -lnpyrandom localization
-PYTHON_SCIPY_LDFLAGS += \
-	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+PYTHON_SCIPY_CONF_OPTS = -Dblas=openblas -Dlapack=lapack
 
-PYTHON_SCIPY_ENV = \
-	F90=$(TARGET_FC) \
-	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
+PYTHON_SCIPY_MESON_EXTRA_PROPERTIES = \
+	numpy-include-dir='$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include'
 
-# Provide system configuration options to numpy distutils extensions, telling
-# to find all include files and libraries in staging directory.
-define PYTHON_SCIPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-endef
-
-$(eval $(python-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
