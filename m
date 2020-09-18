From: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 18 Sep 2020 08:04:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/netcalc: new package
Message-ID: <20200918060425.812748-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netcalc is a slimmed down clone of sipcalc, using the popular output
format of ipcalc (perl).  It is written in C and only depends on a
POSIX compliant C library.  Both IPv4 and IPv6 are supported.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netcalc/Config.in    |  8 ++++++++
 package/netcalc/netcalc.hash |  5 +++++
 package/netcalc/netcalc.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/netcalc/Config.in
 create mode 100644 package/netcalc/netcalc.hash
 create mode 100644 package/netcalc/netcalc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c5124f97ef..506e675587 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1310,6 +1310,7 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/mg/
+F:	package/netcalc/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
diff --git a/package/Config.in b/package/Config.in
index 7783c26dc6..2f30252891 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2151,6 +2151,7 @@ menu "Networking applications"
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
 	source "package/netplug/Config.in"
diff --git a/package/netcalc/Config.in b/package/netcalc/Config.in
new file mode 100644
index 0000000000..897cb872c5
--- /dev/null
+++ b/package/netcalc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NETCALC
+	bool "netcalc"
+	help
+	  netcalc (40 kiB) is a slimmed down version of sipcalc
+	  using the popular output format of ipcalc.  Both IPv4
+	  and IPv6 are supported.
+
+	  https://github.com/troglobit/netcalc/
diff --git a/package/netcalc/netcalc.hash b/package/netcalc/netcalc.hash
new file mode 100644
index 0000000000..34d64b1679
--- /dev/null
+++ b/package/netcalc/netcalc.hash
@@ -0,0 +1,5 @@
+# From https://github.com/troglobit/netcalc/releases/tag/v2.1.6
+md5 c8660b61370c76d866247fe65966a35b  netcalc-2.1.6.tar.gz
+# Locally computed:
+sha256 cff41782fcf63d7d4ce6d35f95ed302127f6ddf6fc0ca03a8188af95a7c3243b  netcalc-2.1.6.tar.gz
+sha256 745538f8d515d37af6f03442df982a8b211b129e8dc10d0195e33c4b42f8fe5f  LICENSE
diff --git a/package/netcalc/netcalc.mk b/package/netcalc/netcalc.mk
new file mode 100644
index 0000000000..7d96fc53cf
--- /dev/null
+++ b/package/netcalc/netcalc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# netcalc
+#
+################################################################################
+
+NETCALC_VERSION = 2.1.6
+NETCALC_SITE = https://github.com/troglobit/netcalc/releases/download/v$(NETCALC_VERSION)
+NETCALC_LICENSE = BSD-3-Clause
+NETCALC_LICENSE_FILES = LICENSE
+NETCALC_CONF_OPTS = --disable-ipcalc-symlink
+
+$(eval $(autotools-package))
-- 
2.25.1
