From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] rng-tools: new package
Message-ID: <20101104230334.D83768DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca3c06f55fab150c458c9a976bbad0c7c1c96871
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix dependencies]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/Config.in              |    1 +
 package/rng-tools/Config.in    |    7 +++++++
 package/rng-tools/rng-tools.mk |   13 +++++++++++++
 4 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 package/rng-tools/Config.in
 create mode 100644 package/rng-tools/rng-tools.mk

diff --git a/CHANGES b/CHANGES
index 019ce09..f9ab2b8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,7 +22,7 @@
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
 	New packages: argp-standalone, gdk-pixbuf, gpsd, gst-ffmpeg,
-	libmpeg2, librsvg, rrdtool, xz
+	libmpeg2, librsvg, rng-tools, rrdtool, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/Config.in b/package/Config.in
index a86b6b3..4e61ea9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
+source "package/rng-tools/Config.in"
 source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
new file mode 100644
index 0000000..e6dcf9d
--- /dev/null
+++ b/package/rng-tools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RNG_TOOLS
+	bool "rng-tools"
+	select BR2_PACKAGE_ARGP_STANDALONE
+	help
+	  Daemon to use hardware random number generators.
+
+	  http://sourceforge.net/projects/gkernel/
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
new file mode 100644
index 0000000..755f4f8
--- /dev/null
+++ b/package/rng-tools/rng-tools.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# rng-tools
+#
+#############################################################
+
+RNG_TOOLS_VERSION = 3
+RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel
+RNG_TOOLS_CONF_ENV = LIBS="-largp"
+RNG_TOOLS_USE_CONFIG_CACHE = NO
+RNG_TOOLS_DEPENDENCIES = argp-standalone
+
+$(eval $(call AUTOTARGETS,package,rng-tools))
-- 
1.7.1
