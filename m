From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon,  6 Jul 2020 07:19:04 +0300
Subject: [Buildroot] [PATCH] package/bitwise: add package
Message-ID: <20200706041904.1518500-1-rfried.dev@gmail.com>
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
 package/Config.in            |  1 +
 package/bitwise/Config.in    | 10 ++++++++++
 package/bitwise/bitwise.hash |  1 +
 package/bitwise/bitwise.mk   | 12 ++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/bitwise/Config.in
 create mode 100644 package/bitwise/bitwise.hash
 create mode 100644 package/bitwise/bitwise.mk

diff --git a/package/Config.in b/package/Config.in
index 6a34a895af..f159d4ee5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -147,6 +147,7 @@ endmenu
 
 menu "Development tools"
 	source "package/bats-core/Config.in"
+	source "package/bitwise/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
diff --git a/package/bitwise/Config.in b/package/bitwise/Config.in
new file mode 100644
index 0000000000..07e6580d14
--- /dev/null
+++ b/package/bitwise/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BITWISE
+	bool "bitwise"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Bitwise is multi base interactive calculator supporting dynamic base
+	  conversion and bit manipulation. It's a handy tool for low level hackers,
+	  kernel developers and device drivers developers.
+
+	  https://github.com/mellowcandle/bitwise
diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
new file mode 100644
index 0000000000..35a1109b93
--- /dev/null
+++ b/package/bitwise/bitwise.hash
@@ -0,0 +1 @@
+sha256 33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
new file mode 100644
index 0000000000..2bc21da4b2
--- /dev/null
+++ b/package/bitwise/bitwise.mk
@@ -0,0 +1,12 @@
+#
+# bitwise
+#
+################################################################################
+
+BITWISE_VERSION = v0.41
+BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/$(BITWISE_VERSION)
+BITWISE_SOURCE = bitwise-$(BITWISE_VERSION).tar.gz
+BITWISE_DEPENDENCIES= ncurses readline
+BITWISE_LICENSE = GPL-2.0
+BITWISE_LICENSE_FILES = COPYING
+$(eval $(autotools-package))
-- 
2.27.0
