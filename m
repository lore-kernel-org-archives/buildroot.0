From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 22:56:31 +0200
Subject: [Buildroot] [git commit] opencv3: use
	BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
Message-ID: <20151009205932.D71D081EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6187c82a1494f586f9f15c01f191c714cbd0454a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Opencv3 select python-numpy. To avoid duplicating architecture
dependencies, an hidden variable has been added to python-numpy
package. This patch propagate this modification to the opencv3
package.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv3/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 9492603..2f51580 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -165,9 +165,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
 config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
-		|| BR2_sh || BR2_x86_64 # python-numpy
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.
