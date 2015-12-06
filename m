From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2015 23:17:55 +0100
Subject: [Buildroot] [PATCH v2] assimp: new package
Message-ID: <1449440276-6133-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
Changes v1 -> v2:
  - use github helper (thanks to J?rg Krause)
---
 package/Config.in        |  1 +
 package/assimp/Config.in |  9 +++++++++
 package/assimp/assimp.mk | 15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/assimp/Config.in
 create mode 100644 package/assimp/assimp.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..b8e13e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -796,6 +796,7 @@ menu "Filesystem"
 endmenu
 
 menu "Graphics"
+	source "package/assimp/Config.in"
 	source "package/atk/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
new file mode 100644
index 0000000..183e73e
--- /dev/null
+++ b/package/assimp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ASSIMP
+	bool "assimp"
+	help
+	  Open Asset Import Library (assimp) is a portable Open Source
+	  library to import various well-known 3D model formats in a uniform
+	  manner. The most recent version also knows how to export 3d files
+	  and is therefore suitable as a general-purpose 3D model converter.
+
+	  http://www.assimp.org
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
new file mode 100644
index 0000000..696ec43
--- /dev/null
+++ b/package/assimp/assimp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# assimp
+#
+################################################################################
+
+ASSIMP_VERSION = v3.2
+ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
+ASSIMP_LICENSE = BSD-3c
+ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_INSTALL_STAGING = YES
+
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.1.4
