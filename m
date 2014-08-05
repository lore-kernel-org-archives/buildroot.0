From: Paul Cercueil <paul@crapouillou.net>
Date: Wed,  6 Aug 2014 00:59:17 +0200
Subject: [Buildroot] [PATCH] glm: Added package
Message-ID: <1407279557-15416-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenGL Mathematics (GLM) is a header only C++ mathematics library for
graphics software based on the OpenGL Shading Language (GLSL)
specification.

http://glm.g-truc.net/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/Config.in     |  1 +
 package/glm/Config.in |  7 +++++++
 package/glm/glm.mk    | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/glm/Config.in
 create mode 100644 package/glm/glm.mk

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..1e4bc50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -828,6 +828,7 @@ menu "Other"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/glibmm/Config.in"
+	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
diff --git a/package/glm/Config.in b/package/glm/Config.in
new file mode 100644
index 0000000..2897cf0
--- /dev/null
+++ b/package/glm/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GLM
+	bool "glm"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  OpenGL Mathematics (GLM)
+
+	  http://glm.g-truc.net
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
new file mode 100644
index 0000000..1e7e7df
--- /dev/null
+++ b/package/glm/glm.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# glm
+#
+#############################################################
+GLM_VERSION = 0.9.5.4
+GLM_SITE = git://github.com/g-truc/glm.git
+GLM_LICENSE = MIT
+GLM_LICENSE_FILES = copying.txt
+GLM_INSTALL_STAGING = YES
+GLM_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.0.1
