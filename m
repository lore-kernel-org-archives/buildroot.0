Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AF7C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C255404A0;
	Fri,  1 Dec 2023 20:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C255404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cu1GBHozkszX; Fri,  1 Dec 2023 20:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE1543797;
	Fri,  1 Dec 2023 20:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE1543797
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42E771BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B8F60AEB
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B8F60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8qikFUIitWi for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C90BE60ADE
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90BE60ADE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3DE6876FB; Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:21:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89e6b474ea00a62ce95754058eafd390d31b39fa
X-Git-Newrev: 8b3993178d0ffae312d7dd0df70d30d1d3d88873
X-Patchwork-Hint: ignore
Message-Id: <20231201202402.B3DE6876FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: needs gcc >= 9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b3993178d0ffae312d7dd0df70d30d1d3d88873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-numpy needs gcc >= 8.4 since bump to version 1.25.0 in commit
ca63464e3777ca2596b4d396accb6a384ccf8514 and
https://github.com/numpy/numpy/commit/4002a7d421ff10780c28a3643683af7a9754f87f:

../output-1/build/host-python-numpy-1.25.0/meson.build:30:4: ERROR: Problem encountered: NumPy requires GCC >= 8.4

Fixes:
 - http://autobuild.buildroot.org/results/9ec82be71c908873112064792ace283049355031

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/Config.in          | 6 ++++--
 package/ola/Config.in               | 6 ++++--
 package/opencv3/Config.in           | 6 ++++--
 package/opencv4/Config.in           | 6 ++++--
 package/piglit/Config.in            | 6 +++++-
 package/python-crossbar/Config.in   | 5 +++--
 package/python-matplotlib/Config.in | 7 +++++--
 package/python-numpy/Config.in      | 4 +++-
 package/python-scipy/Config.in      | 7 +++++--
 package/python-zlmdb/Config.in      | 4 +++-
 package/uhd/Config.in               | 8 ++++++--
 11 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 51237e62b9..be997e91e2 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -79,6 +79,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -86,8 +87,9 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
+	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 701083b5d3..dd0be6f35e 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -53,14 +53,16 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Build OLA RDM tests.
 
-comment "rdm tests needs a toolchain w/ glibc or musl"
+comment "rdm tests needs a glibc or musl toolchain w/ gcc >= 9"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
 
 comment "plugin selections"
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index b9ea033f13..be0680084b 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -157,15 +157,17 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs glibc or musl"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV3_LIB_SHAPE
 	bool "shape"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 286a7ebf9d..78ec7c2e41 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -180,15 +180,17 @@ config BR2_PACKAGE_OPENCV4_LIB_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs glibc or musl"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 ||\
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 	bool "shape"
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 22d1c7c28e..48b7641909 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
 	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
@@ -32,6 +34,8 @@ config BR2_PACKAGE_PIGLIT
 
 	  https://piglit.freedesktop.org
 
-comment "piglit needs a glibc or musl toolchain w/ C++"
+comment "piglit needs a glibc or musl toolchain w/ C++, gcc >= 9, host gcc >= 9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index aadcb2c360..357be4803c 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn's compress and serialization
 	# All the following dependencies are runtime dependencies. It
 	# matches almost 1:1 the requirements-min.txt from crossbar
@@ -64,8 +65,8 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs a glibc or musl toolchain w/ C++"
+comment "python-crossbar needs a glibc or musl toolchain w/ C++, gcc >= 9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_9
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 8a9281b8e7..cc0d830f4f 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
@@ -36,6 +38,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a glibc or musl toolchain w/ C++"
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++, gcc >= 9, host gcc >= 9"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 132c3f7a82..c27baec3b3 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	depends on BR2_INSTALL_LIBSTDCPP
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
@@ -28,7 +29,8 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 	  http://www.numpy.org/
 
-comment "python-numpy needs a glibc or musl toolchain w/ C++"
+comment "python-numpy needs a glibc or musl toolchain w/ C++, gcc >= 9"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 0a4acb9699..aa7eefd44d 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
@@ -19,10 +21,11 @@ config BR2_PACKAGE_PYTHON_SCIPY
 
 	  https://www.scipy.org/scipylib/
 
-comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
+comment "python-scipy needs glibc or musl toolchain w/ fortran, c++, gcc >= 9, host gcc >= 9"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
-		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 8eba2d7946..007ca72723 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
@@ -18,7 +19,8 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 
 	  https://github.com/crossbario/zlmdb
 
-comment "python-zlmdb needs a glibc or musl toolchain w/ C++"
+comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 9"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 4316a2c185..2ccfe3ccb8 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -94,16 +94,20 @@ config BR2_PACKAGE_UHD_OCTOCLOCK
 	help
 	  enable OctoClock support
 
-comment "uhd python API needs python3 and a toolchain w/ glibc or musl"
+comment "uhd python API needs python3 and a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
+	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
 
 config BR2_PACKAGE_UHD_PYTHON
 	bool "python API support"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	select BR2_PACKAGE_PYTHON_REQUESTS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
