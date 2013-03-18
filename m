From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:06:47 +0100
Subject: [Buildroot] [git commit] package/genimage: new host-only package
Message-ID: <20130318221420.43A7A9B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1520628df1b1ff4c65033f4789841ce38c367217
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: wrap help text]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host          |    1 +
 package/genimage/Config.in.host |   13 +++++++++++++
 package/genimage/genimage.mk    |   13 +++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

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
index 0000000..697dcda
--- /dev/null
+++ b/package/genimage/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_GENIMAGE
+	bool "host genimage"
+	help
+	  genimage is a tool to generate multiple filesystem and flash
+	  images from a given root filesystem tree. genimage is
+	  intended to be run in a fakeroot environment.
+	  
+	  Configuration is done is a config file parsed by
+	  libconfuse. Options like the path to tools can be given in
+	  environment variables, the config file or commandline
+	  switches.
+	  
+	  http://www.pengutronix.de/software/genimage/
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
new file mode 100644
index 0000000..6ed44a4
--- /dev/null
+++ b/package/genimage/genimage.mk
@@ -0,0 +1,13 @@
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
+GENIMAGE_LICENSE        = GPLv2
+
+$(eval $(host-autotools-package))
