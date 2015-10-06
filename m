From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue,  6 Oct 2015 12:06:54 +0200
Subject: [Buildroot] [PATCH v5 1/3] python-numpy: introduce ARCH_SUPPORTS
	hidden variable
Message-ID: <1444126016-8815-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Some packages selects python-numpy. This package has a some CPU specific
code. To simplify and avoid duplicate dependencies this patch introduce an
hidden ARCH_SUPPORTS variable.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v4 -> v5:
 * Re-add hidden variable.
---
 package/python-numpy/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index f8170f8..f25102a 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,9 +1,13 @@
-config BR2_PACKAGE_PYTHON_NUMPY
-	bool "python-numpy"
+config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	bool
 	# Numpy has some CPU specific code
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
 		|| BR2_sh || BR2_x86_64
+
+config BR2_PACKAGE_PYTHON_NUMPY
+	bool "python-numpy"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
-- 
2.4.9
