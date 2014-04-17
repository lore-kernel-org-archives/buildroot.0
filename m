From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:22 +0200
Subject: [Buildroot] [PATCH 10/14] package/libgl: introduce as a new virtual
	package for full-openGL providers
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <3fefe2bea72a1088485920c0ac5ffdd0356d79d5.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, only mesa3d is such a full-openGL provider.

But it is easy to see a few more cropping up at the door:
  - NVidia's binary blob
  - ATI's fglrx binary blob

Having this virtual full-openGL package will help when those are getting in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 package/opengl/Config.in       | 1 +
 package/opengl/libgl/Config.in | 6 ++++++
 package/opengl/libgl/libgl.mk  | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index ed81835..20ee28b 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,3 +1,4 @@
+source "package/opengl/libgl/Config.in"
 source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
new file mode 100644
index 0000000..8b99e5b
--- /dev/null
+++ b/package/opengl/libgl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBGL
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBGL
+	string
diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
new file mode 100644
index 0000000..7abc13d
--- /dev/null
+++ b/package/opengl/libgl/libgl.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libgl
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
1.8.3.2
