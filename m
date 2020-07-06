From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon,  6 Jul 2020 12:37:43 +0300
Subject: [Buildroot] [PATCH v3] package/bitwise: new package
Message-ID: <20200706093743.2176995-1-rfried.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bitwise is multi base interactive calculator supporting dynamic
base conversion and bit manipulation.
It's a handy tool for low level hackers,
kernel developers and device drivers developers.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v3:
* Added hash for COPYING
* Fixed indendation problem in DEVELOPERS
* Fixed missing v in BITWISE_SITE

v2:
* Fixed commit message.
* Added Developers entry
* Fixed "make check-package" errors
* Fixed versioning.

 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/bitwise/Config.in    | 11 +++++++++++
 package/bitwise/bitwise.hash |  2 ++
 package/bitwise/bitwise.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/bitwise/Config.in
 create mode 100644 package/bitwise/bitwise.hash
 create mode 100644 package/bitwise/bitwise.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d67c75033f..ffe6dea2ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2132,6 +2132,9 @@ N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
 
+N:	Ramon Fried <rfried.dev@gmail.com>
+F:	package/bitwise/
+
 N:	Rapha?l M?lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
 
diff --git a/package/Config.in b/package/Config.in
index 6a34a895af..b4b2a86a67 100644
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
index 0000000000..b31b640ecd
--- /dev/null
+++ b/package/bitwise/bitwise.hash
@@ -0,0 +1,2 @@
+sha256  33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
new file mode 100644
index 0000000000..2ef183c1a0
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
+BITWISE_LICENSE = GPL-2.0
+BITWISE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.27.0
