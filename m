From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 20:56:46 +0200
Subject: [Buildroot] [git commit] package/python-numpy: bump to version
 1.16.3
Message-ID: <20190505185541.6F55E817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2554d6ffe97cc31429bde5f6603646f1904e669a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove third patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Add-sublibraries-missing-licenses.patch   | 61 ----------------------
 package/python-numpy/python-numpy.hash             |  4 +-
 package/python-numpy/python-numpy.mk               |  2 +-
 3 files changed, 3 insertions(+), 64 deletions(-)

diff --git a/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch b/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch
deleted file mode 100644
index 5b0bafe5b5..0000000000
--- a/package/python-numpy/0003-Add-sublibraries-missing-licenses.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Add sublibraries license files
-
-On Release 1.16.2 tarball one license files is missing:
-- numpy/linalg/lapack_lite/LICENSE.txt
-
-Add it to sources to keep licensing information complete.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -urpN numpy-1.15.2.orig/numpy/linalg/lapack_lite/LICENSE.txt numpy-1.16.2/numpy/linalg/lapack_lite/LICENSE.txt
---- numpy-1.16.2.orig/numpy/linalg/lapack_lite/LICENSE.txt	1970-01-01 01:00:00.000000000 +0100
-+++ numpy-1.16.2/numpy/linalg/lapack_lite/LICENSE.txt	2018-09-11 00:00:41.239919567 +0200
-@@ -0,0 +1,48 @@
-+Copyright (c) 1992-2013 The University of Tennessee and The University
-+                        of Tennessee Research Foundation.  All rights
-+                        reserved.
-+Copyright (c) 2000-2013 The University of California Berkeley. All
-+                        rights reserved.
-+Copyright (c) 2006-2013 The University of Colorado Denver.  All rights
-+                        reserved.
-+
-+$COPYRIGHT$
-+
-+Additional copyrights may follow
-+
-+$HEADER$
-+
-+Redistribution and use in source and binary forms, with or without
-+modification, are permitted provided that the following conditions are
-+met:
-+
-+- Redistributions of source code must retain the above copyright
-+  notice, this list of conditions and the following disclaimer.
-+
-+- Redistributions in binary form must reproduce the above copyright
-+  notice, this list of conditions and the following disclaimer listed
-+  in this license in the documentation and/or other materials
-+  provided with the distribution.
-+
-+- Neither the name of the copyright holders nor the names of its
-+  contributors may be used to endorse or promote products derived from
-+  this software without specific prior written permission.
-+
-+The copyright holders provide no reassurances that the source code
-+provided does not infringe any patent, copyright, or any other
-+intellectual property rights of third parties.  The copyright holders
-+disclaim any liability to any recipient for claims brought against
-+recipient by any third party for infringement of that parties
-+intellectual property rights.
-+
-+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index c2b0cd9c79..c1cfacf734 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,5 +1,5 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.2
-sha256	8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e	numpy-1.16.2.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.3
+sha256	adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f	numpy-1.16.3.tar.gz
 # License files, locally calculated
 sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
 sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 0da803b9f5..28dccf8be5 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.16.2
+PYTHON_NUMPY_VERSION = 1.16.3
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
