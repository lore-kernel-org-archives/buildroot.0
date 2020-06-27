From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Jun 2020 15:08:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-numpy: use fortran compiler
 when available
In-Reply-To: <20200627130805.8615-1-guillaume.bressaix@gmail.com>
References: <20200627130805.8615-1-guillaume.bressaix@gmail.com>
Message-ID: <20200627130805.8615-2-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

python-numpy can be built using fortran compiler if
available, this is the correct configure flag to do it

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-numpy/python-numpy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index f9c55c9f3c..9e08fd5f2e 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -23,6 +23,10 @@ else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+PYTHON_NUMPY_ENV += F90=$(TARGET_FC)
+endif
+
 define PYTHON_NUMPY_CONFIGURE_CMDS
 	-rm -f $(@D)/site.cfg
 	echo "[DEFAULT]" >> $(@D)/site.cfg
-- 
2.20.1
