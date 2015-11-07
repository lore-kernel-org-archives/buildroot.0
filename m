From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2015 17:50:52 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package only provides a git submodule for the vsxu package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/Config.in       |  1 +
 package/cal3d/Config.in |  6 ++++++
 package/cal3d/cal3d.mk  | 10 ++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/cal3d/Config.in
 create mode 100644 package/cal3d/cal3d.mk

diff --git a/package/Config.in b/package/Config.in
index d278e64..eb601e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,6 +227,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 
 comment "Graphic libraries"
+	source "package/cal3d/Config.in"
 	source "package/cegui06/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
diff --git a/package/cal3d/Config.in b/package/cal3d/Config.in
new file mode 100644
index 0000000..231d905
--- /dev/null
+++ b/package/cal3d/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CAL3D
+	help
+	  Cal3D is a skeletal based character animation library.
+	  This package provides a git submodule for the vsxu package.
+
+	  https://github.com/vovoid/cal3d
diff --git a/package/cal3d/cal3d.mk b/package/cal3d/cal3d.mk
new file mode 100644
index 0000000..0a7813f
--- /dev/null
+++ b/package/cal3d/cal3d.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# cal3d
+#
+################################################################################
+
+CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
+CAL3D_SITE = $(call github,vovoid,cal3d,$(CAL3D_VERSION))
+
+$(eval $(generic-package))
-- 
2.6.2
