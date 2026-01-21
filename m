Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C77C44536
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E126F60B61;
	Wed, 21 Jan 2026 20:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvPQWqM1cu89; Wed, 21 Jan 2026 20:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7D260B68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028296;
	bh=+mN1rjG30ZkoPVqwtALVfMtHebePGdtWR5r3sxS6Jhc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=buHS2PBXVhsh84A3var8VSgUh7H7dVrbQ2DgJhxGyGAg8gcJpNKvHtwQZhlJQsGrb
	 JZvrVtM8ZErsR9u4LQ3sm61MfgkH5oBKIWuTk7flTMEsnSwApWGy1EKs2hGCBqbBN0
	 ujG0KbeQPsNUkkrw5Y3kA21fIL869T5fY0ake4pWHi04UGp9hc0V09rHMlLIECpRQE
	 PBMFoE/7fupz9tMO6lgYno7yrl+gwgQF7V3ivYGxT3mmi7tGGk2J6lAPzApI51jtDj
	 181q3Z6WHKcPy0nX36H1TODbU3JCXdT3NwmuWvLZui6RxFlUnKNLTwymwEO4pPNg+x
	 U6GsZ993oe44Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7D260B68;
	Wed, 21 Jan 2026 20:44:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC763158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA89A40C6E
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D0grOeiWiKs for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC48D40C6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC48D40C6C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BFC2874AD; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
X-Git-Newrev: 62648d98926cc96c680ce4698bb631188b2f72d9
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.9BFC2874AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: bump version to 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5578875023007346927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5578875023007346927==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=62648d98926cc96c680ce4698bb631188b2f72d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://numpy.org/news/

Add new supported architectures.

License hash changed due to date update:
https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6

We need to build python-numpy with its vendored version of meson as
it currently relies on features that are not yet upstream. To do this
we can simply set the PYTHONPATH with the vendored meson path before
the normal PYTHON3_PATH so that the vendored version will have
precedence. We need to set this for both host and target numpy.

We also need to set the architecture specific longdouble_format
property as numpy is unable to determine the value for this without
being able to execute target binaries.

See:
https://github.com/numpy/numpy/blob/3e7e5c3cabb8f1a0d940dc6f2058fed4a8c3e284/doc/source/building/cross_compilation.rst

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Bernd:
 Bumped to 2.4.0

 Removed patch which is included in this release.

 Updated license hashes due to upstream commits:
 - copyright year bumps:
   https://github.com/numpy/numpy/commits/v2.4.0/LICENSE.txt
 - file move
   tools/npy_tempita/license.txt -> numpy/_build_utils/tempita/LICENSE.txt
   https://github.com/numpy/numpy/commit/63a1fee8d1c1e442aa8ca08ac7cefb195f99b2a9
   https://github.com/numpy/numpy/commit/86940987a9d8d54c860d8c862d5d96c51b339f23
 - directory move core -> _core and various code updates
   https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/src/multiarray/dragon4.c
 - directory move core -> _core
   https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/include/numpy/libdivide/LICENSE.txt

 Following Romain's review
 https://lists.buildroot.org/pipermail/buildroot/2024-November/767739.html
 host-python-numpy was switched back to host-python-package to install the
 f2py script needed by the upcoming bump of python-scipy. A dependency to
 host-python-meson-python is also needed.

 Removed PYTHON_NUMPY_LONGDOUBLE_FORMAT configure option for BR2_arceb
 after this arch was removed from buildroot.

 Changed path in PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES following
 upstream commit
 https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252
 and updated opencv4 as well]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencv4/opencv4.mk                         |  2 +-
 .../0001-MNT-do-not-use-long-type.patch            | 34 ----------
 package/python-numpy/Config.in                     |  6 ++
 package/python-numpy/python-numpy.hash             | 13 ++--
 package/python-numpy/python-numpy.mk               | 76 +++++++++++++++++++---
 5 files changed, 80 insertions(+), 51 deletions(-)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index d31d0ae598..695355c308 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -400,7 +400,7 @@ OPENCV4_CONF_OPTS += \
 	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR).so \
-	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core/include \
 	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV4_DEPENDENCIES += python3
diff --git a/package/python-numpy/0001-MNT-do-not-use-long-type.patch b/package/python-numpy/0001-MNT-do-not-use-long-type.patch
deleted file mode 100644
index d813a4d51b..0000000000
--- a/package/python-numpy/0001-MNT-do-not-use-long-type.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6dc2fd31f8a5a4ef502cb7734f004f5bce94e671 Mon Sep 17 00:00:00 2001
-From: Thomas A Caswell <tcaswell@gmail.com>
-Date: Sat, 18 Nov 2023 16:46:52 -0500
-Subject: [PATCH] MNT: do not use `long` type
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Removed as type at language level 3 in ed7e95912b6ed7d20e190fbf1aecb9f2a997d479
-in cython
-
-Upstream: https://github.com/numpy/numpy/commit/6dc2fd31f8a5a4ef502cb7734f004f5bce94e671
-
-Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
----
- numpy/random/_generator.pyx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/random/_generator.pyx b/numpy/random/_generator.pyx
-index d067e795eb5c..ae481d69d696 100644
---- a/numpy/random/_generator.pyx
-+++ b/numpy/random/_generator.pyx
-@@ -3757,7 +3757,7 @@ def multivariate_normal(self, mean, cov, size=None, check_valid='warn',
- 
-         if size is None:
-             shape = []
--        elif isinstance(size, (int, long, np.integer)):
-+        elif isinstance(size, (int, np.integer)):
-             shape = [size]
-         else:
-             shape = size
--- 
-2.49.1
-
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index e10618f058..f8c71274cd 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -3,15 +3,21 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# Numpy has some CPU specific code
 	default y if BR2_arc
 	default y if BR2_aarch64
+	default y if BR2_aarch64_be
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
+	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_sh
+	default y if BR2_sparc
+	default y if BR2_sparc64
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_NUMPY
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 6629cebbce..6dca37294a 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,8 +1,9 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.25.0
-sha256  f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19  numpy-1.25.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/numpy/json
+md5  828b6c6df0b6f89b5cf799314d4ee2b6  numpy-2.4.0.tar.gz
+sha256  6e504f7b16118198f138ef31ba24d985b124c2c469fe8467007cf30fd992f934  numpy-2.4.0.tar.gz
 # License files, locally calculated
-sha256  1034d3bd61783f3b5e7ec3e7ca818f4da4135132323a0ef99f4c0edb3c7f6bd2  LICENSE.txt
-sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
-sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
+sha256  1be1df33863f97a7bc1c4d67980bd6c69c9a6fef0a5ee76e6ad6cb91e56e8491  LICENSE.txt
+sha256  743b0f4a0087fe3607167113fffab6f2ca069c8da321763697ab5d0d8411634a  numpy/_build_utils/tempita/LICENSE.txt
+sha256  e09cfef237f1c47fec6c11926e23ed2222404d1e4357b5d65e65a2daf9d83949  numpy/_core/src/multiarray/dragon4.c
+sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/_core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
-sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e  tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 200fac20a1..6b052569fe 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,25 +4,28 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.25.0
+PYTHON_NUMPY_VERSION = 2.4.0
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
-PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
+PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/a4/7a/6a3d14e205d292b738db449d0de649b373a59edb0d0b4493821d0a3e8718
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
 PYTHON_NUMPY_LICENSE_FILES = \
 	LICENSE.txt \
-	numpy/core/src/multiarray/dragon4.c \
-	numpy/core/include/numpy/libdivide/LICENSE.txt \
-	numpy/linalg/lapack_lite/LICENSE.txt \
-	tools/npy_tempita/license.txt
+	numpy/_build_utils/tempita/LICENSE.txt \
+	numpy/_core/src/multiarray/dragon4.c \
+	numpy/_core/include/numpy/libdivide/LICENSE.txt \
+	numpy/linalg/lapack_lite/LICENSE.txt
 PYTHON_NUMPY_CPE_ID_VENDOR = numpy
 PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
 
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
-HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
+HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython host-python-meson-python
 
 PYTHON_NUMPY_CONF_ENV += \
 	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
-	PYTHONPATH=$(PYTHON3_PATH)
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
+
+PYTHON_NUMPY_NINJA_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
 
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
@@ -38,6 +41,59 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+# Generated by running this test program under QEMU:
+# https://github.com/numpy/numpy/blob/v1.26.4/numpy/core/meson.build#L376-L455
+ifeq ($(BR2_arcle),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_aarch64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_aarch64_be),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_arm),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_armeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_i386),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_or1k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_m68k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
+else ifeq ($(BR2_mips),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_mipsel),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_powerpc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64le),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_LE
+else ifeq ($(BR2_riscv),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_sh4)$(BR2_sh4a),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_sh4eb)$(BR2_sh4aeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_x86_64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_16_BYTES_LE
+endif
+
+PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
+	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'
+
+HOST_PYTHON_NUMPY_SETUP_TYPE = setuptools
+
+HOST_PYTHON_NUMPY_CONF_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PYTHON_NUMPY_NINJA_ENV += \
+	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
+
 # Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
 # in-tree code.
 HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
@@ -50,7 +106,7 @@ HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
 # config path for their package environment.
 define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
 	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
-		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
+		$(PYTHON3_PATH)/site-packages/numpy/_core/lib/npy-pkg-config/npymath.ini
 endef
 PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
 
@@ -59,4 +115,4 @@ PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FIL
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
 $(eval $(meson-package))
-$(eval $(host-meson-package))
+$(eval $(host-python-package))

--===============5578875023007346927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5578875023007346927==--
