From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:29:36 +0200
Subject: [Buildroot] [git commit] package/opengl/opencl: new virtual package
Message-ID: <20181021142757.557DB882BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c500ac897c4b887b7e673bf8fa612ff1143071e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Valentin Korenblit<valentinkorenblit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opengl/Config.in              | 1 +
 package/opengl/libopencl/Config.in    | 6 ++++++
 package/opengl/libopencl/libopencl.mk | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 20ee28b06e..cbc001427d 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,5 +1,6 @@
 source "package/opengl/libgl/Config.in"
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
+source "package/opengl/libopencl/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
diff --git a/package/opengl/libopencl/Config.in b/package/opengl/libopencl/Config.in
new file mode 100644
index 0000000000..57a3ad7d0d
--- /dev/null
+++ b/package/opengl/libopencl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBOPENCL
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBOPENCL
+	string
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
diff --git a/package/opengl/libopencl/libopencl.mk b/package/opengl/libopencl/libopencl.mk
new file mode 100644
index 0000000000..e1c71f82d1
--- /dev/null
+++ b/package/opengl/libopencl/libopencl.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libopencl
+#
+################################################################################
+
+$(eval $(virtual-package))
