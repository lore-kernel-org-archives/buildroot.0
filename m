From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Jun 2020 15:08:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-numpy: remove non needed
 --fcompiler flag
Message-ID: <20200627130805.8615-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

if we comment --fcompiler=None, both python-numpy
and host-python-numpy build fine, which lets me think
setup.py is able to deal with a missing fortran compiler
by itself.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-numpy/python-numpy.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 8260de7e5d..f9c55c9f3c 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -23,8 +23,6 @@ else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
 
-PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
-
 define PYTHON_NUMPY_CONFIGURE_CMDS
 	-rm -f $(@D)/site.cfg
 	echo "[DEFAULT]" >> $(@D)/site.cfg
-- 
2.20.1
