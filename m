From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  7 Oct 2015 09:43:18 +0200
Subject: [Buildroot] [PATCH v6 2/3] opencv3: use
	BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS instead of replicate
	python-numpy depends
In-Reply-To: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1444203799-16230-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Opencv3 select python-numpy. To reduce CPU arch dependencies, an hidden 
variable has been added to python-numpy package. This patch propagate this
modification.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv3/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.4.9
