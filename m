From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:11:43 +0100
Subject: [Buildroot] [git commit] package/tio: new package
Message-ID: <20191224130326.DAB7C8E1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd1fd4d5fd6869f4abd2b16c7e1d8b5ac451e25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"tio" is a simple TTY terminal application which features a
straightforward commandline interface to easily connect to
TTY devices for basic input/output.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Thomas:
 - license is GPL-2.0+ (noticed by Baruch)
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/tio/Config.in |  8 ++++++++
 package/tio/tio.hash  |  5 +++++
 package/tio/tio.mk    | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c86fd5931f..284fc7c57e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2216,6 +2216,7 @@ F:	package/libgdiplus/
 F:	package/pimd/
 F:	package/snort/
 F:	package/stella/
+F:	package/tio/
 F:	package/traceroute/
 F:	package/tunctl/
 F:	package/ubus/
diff --git a/package/Config.in b/package/Config.in
index df4265ead3..efe90dfc09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -547,6 +547,7 @@ endmenu
 	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
+	source "package/tio/Config.in"
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
diff --git a/package/tio/Config.in b/package/tio/Config.in
new file mode 100644
index 0000000000..6c748c5d12
--- /dev/null
+++ b/package/tio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TIO
+	bool "tio"
+	help
+	  "tio" is a simple TTY terminal application which features a
+	  straightforward commandline interface to easily connect to
+	  TTY devices for basic input/output.
+
+	  https://tio.github.io/
diff --git a/package/tio/tio.hash b/package/tio/tio.hash
new file mode 100644
index 0000000000..3053bd1bf0
--- /dev/null
+++ b/package/tio/tio.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 a8f5ed6994cacb96780baa416b19e5a6d7d67e8c162a8ea4fd9eccd64984ae44  tio-1.32.tar.xz
+
+# Hash for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
new file mode 100644
index 0000000000..31f1dfb5a8
--- /dev/null
+++ b/package/tio/tio.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tio
+#
+################################################################################
+
+TIO_VERSION = 1.32
+TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
+TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
+TIO_LICENSE = GPL-2.0+
+TIO_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
