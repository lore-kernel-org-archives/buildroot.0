From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 14:35:39 +0200
Subject: [Buildroot] [git commit] package/opencv3: properly propagate
 Config.in comment dependencies
Message-ID: <20200501122126.7BA7990C89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada75f3dc9a0cd56d2454b90778dbda5316b188f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python support in OpenCV3 indeed requires a glibc or musl toolchain,
but is only available if Python 3.x is enabled, and if we're on an
architecture with Numpy support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 18c390c515..f45d678d22 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -165,6 +165,8 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	  python example is installed.
 
 comment "python support needs glibc or musl"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV3_LIB_SHAPE
