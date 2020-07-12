From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:58:40 +0200
Subject: [Buildroot] [git commit] package/bitwise: new package
Message-ID: <20200712140303.6FB72869BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10733547c3656de9b38d46138d7935b627fedc3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bitwise is multi base interactive calculator supporting dynamic base
conversion and bit manipulation.  It's a handy tool for low level
hackers, kernel developers and device drivers developers.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/bitwise/Config.in    | 11 +++++++++++
 package/bitwise/bitwise.hash |  3 +++
 package/bitwise/bitwise.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 203c4546af..98d1fde63f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2140,6 +2140,9 @@ N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
 
+N:	Ramon Fried <rfried.dev@gmail.com>
+F:	package/bitwise/
+
 N:	Rapha??l M??lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
 
diff --git a/package/Config.in b/package/Config.in
index ca781de0ac..1cab73d122 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ endmenu
 menu "Development tools"
 	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
+	source "package/bitwise/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
 	source "package/check/Config.in"
diff --git a/package/bitwise/Config.in b/package/bitwise/Config.in
new file mode 100644
index 0000000000..e955da374b
--- /dev/null
+++ b/package/bitwise/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BITWISE
+	bool "bitwise"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Bitwise is multi base interactive calculator
+	  supporting dynamic base conversion and bit manipulation.
+	  It's a handy tool for low level hackers,
+	  kernel developers and device drivers developers.
+
+	  https://github.com/mellowcandle/bitwise
diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
new file mode 100644
index 0000000000..061c5e529e
--- /dev/null
+++ b/package/bitwise/bitwise.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
new file mode 100644
index 0000000000..581eac6fb4
--- /dev/null
+++ b/package/bitwise/bitwise.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# bitwise
+#
+################################################################################
+
+BITWISE_VERSION = 0.41
+BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
+BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
+BITWISE_DEPENDENCIES = ncurses readline
+BITWISE_LICENSE = GPL-3.0
+BITWISE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
