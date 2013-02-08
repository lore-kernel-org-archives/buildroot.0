From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 22:56:50 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <cover.1360360503.git.yann.morin.1998@free.fr>
References: <cover.1360360503.git.yann.morin.1998@free.fr>
Message-ID: <fe00db49d7c6ae7a3765f305bab00fb389b7c267.1360360503.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host          |    1 +
 package/genimage/Config.in.host |   12 ++++++++++++
 package/genimage/genimage.mk    |   12 ++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/genimage/Config.in.host
 create mode 100644 package/genimage/genimage.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 43f292c..c456d5d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,6 +3,7 @@ menu "Host utilities"
 source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
+source "package/genimage/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
new file mode 100644
index 0000000..cfa267c
--- /dev/null
+++ b/package/genimage/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_GENIMAGE
+	bool "host genimage"
+	help
+	  genimage is a tool to generate multiple filesystem and flash images
+	  from a given root filesystem tree. genimage is intended to be run
+	  in a fakeroot environment.
+	  
+	  Configuration is done is a config file parsed by libconfuse. Options
+	  like the path to tools can be given in environment variables, the config
+	  file or commandline switches.
+	  
+	  http://www.pengutronix.de/software/genimage/
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
new file mode 100644
index 0000000..8fe9bf7
--- /dev/null
+++ b/package/genimage/genimage.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# genimage
+#
+##############################################################
+
+GENIMAGE_VERSION        = 4
+GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
+GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
+GENIMAGE_DEPENDENCIES   = libconfuse
+
+$(eval $(host-autotools-package))
-- 
1.7.2.5
