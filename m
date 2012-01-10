From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Jan 2012 20:36:01 +0100
Subject: [Buildroot] [git commit] New package: sane-backends
Message-ID: <20120110195326.62B42901F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0ff93adfbb44ada2c685713cb95b32c2ce801e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/sane-backends/Config.in        |    7 +++++++
 package/sane-backends/sane-backends.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a82c658..276806b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,6 +199,7 @@ source "package/openocd/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
+source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 source "package/smartmontools/Config.in"
diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
new file mode 100644
index 0000000..fb73435
--- /dev/null
+++ b/package/sane-backends/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SANE_BACKENDS
+	bool "sane-backends"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  SANE - Scanner Access Now Easy
+
+	  http://www.sane-project.org
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
new file mode 100644
index 0000000..1188d18
--- /dev/null
+++ b/package/sane-backends/sane-backends.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# sane-backends
+#
+#############################################################
+SANE_BACKENDS_VERSION = 1.0.22
+SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
+SANE_BACKENDS_SITE = ftp://ftp2.sane-project.org/pub/sane/sane-backends-$(SANE_BACKENDS_VERSION)
+
+SANE_BACKENDS_DEPENDENCIES += libusb
+SANE_BACKENDS_CONF_OPT += --enable-libusb_1_0
+
+$(eval $(call AUTOTARGETS))
