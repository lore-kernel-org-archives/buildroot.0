From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 10:50:44 +0100
Subject: [Buildroot] [git commit master 1/1] Add kbd package
Message-ID: <20101107095142.A33778DBFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=603030af4519b60315b94a4369d75537a13af53b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use BR2_KERNEL_MIRROR]
Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    2 +-
 package/Config.in     |    1 +
 package/kbd/Config.in |    6 ++++++
 package/kbd/kdb.mk    |    5 +++++
 4 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 package/kbd/Config.in
 create mode 100644 package/kbd/kdb.mk

diff --git a/CHANGES b/CHANGES
index 45ed7cb..1be748b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,7 +25,7 @@
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
 	New packages: argp-standalone, gdk-pixbuf, gpsd, gst-ffmpeg,
-	libmpeg2, librsvg, nuttcp, rng-tools, rrdtool, xz
+	libmpeg2, kbd, librsvg, nuttcp, rng-tools, rrdtool, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/Config.in b/package/Config.in
index 7b35554..03e580a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -173,6 +173,7 @@ source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
 source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
+source "package/kbd/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
new file mode 100644
index 0000000..b6d13b5
--- /dev/null
+++ b/package/kbd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KBD
+	bool "kbd"
+	help
+	  Keytable files and keyboard utilities.
+
+	  http://kernel.org/pub/linux/utils/kbd/
diff --git a/package/kbd/kdb.mk b/package/kbd/kdb.mk
new file mode 100644
index 0000000..526e1ff
--- /dev/null
+++ b/package/kbd/kdb.mk
@@ -0,0 +1,5 @@
+KBD_VERSION = 1.15.2
+KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
+KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
+
+$(eval $(call AUTOTARGETS,package,kbd))
-- 
1.7.1
