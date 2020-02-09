From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Sun,  9 Feb 2020 16:44:06 +0300
Subject: [Buildroot] [PATCH v1 1/3] package/opengl/libopenvx: new virtual
 package
Message-ID: <20200209134408.10534-1-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 DEVELOPERS                            | 1 +
 package/opengl/Config.in              | 1 +
 package/opengl/libopenvx/Config.in    | 6 ++++++
 package/opengl/libopenvx/libopenvx.mk | 7 +++++++
 4 files changed, 15 insertions(+)
 create mode 100644 package/opengl/libopenvx/Config.in
 create mode 100644 package/opengl/libopenvx/libopenvx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb13035bc4..fa9043b0c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2076,6 +2076,7 @@ F:	package/uhttpd/
 F:	package/ustream-ssl/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
+F:	package/opengl/libopenvx
 F:	package/paho-mqtt-cpp/
 
 N:	R??mi R??rolle <remi.rerolle@gmail.com>
diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index cbc001427d..10bdefdb39 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -4,3 +4,4 @@ source "package/opengl/libgles/Config.in"
 source "package/opengl/libopencl/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
+source "package/opengl/libopenvx/Config.in"
diff --git a/package/opengl/libopenvx/Config.in b/package/opengl/libopenvx/Config.in
new file mode 100644
index 0000000000..58d497130e
--- /dev/null
+++ b/package/opengl/libopenvx/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBOPENVX
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBOPENVX
+	string
+	depends on BR2_PACKAGE_HAS_LIBOPENVX
diff --git a/package/opengl/libopenvx/libopenvx.mk b/package/opengl/libopenvx/libopenvx.mk
new file mode 100644
index 0000000000..25ef639d3c
--- /dev/null
+++ b/package/opengl/libopenvx/libopenvx.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libopenvx
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.17.1
