From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Sep 2019 22:05:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsmb2: new package
Message-ID: <20190928200529.19952-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming package kodi-vfs-smb2:
https://github.com/afedchin/vfs.smb2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libsmb2/Config.in    |  7 +++++++
 package/libsmb2/libsmb2.hash |  3 +++
 package/libsmb2/libsmb2.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/libsmb2/Config.in
 create mode 100644 package/libsmb2/libsmb2.hash
 create mode 100644 package/libsmb2/libsmb2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e0a61c45c4..83eb6da604 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -355,6 +355,7 @@ F:	package/libplatform/
 F:	package/libpng/
 F:	package/libsidplay2/
 F:	package/libsilk/
+F:	package/libsmb2/
 F:	package/libsndfile/
 F:	package/libsoil/
 F:	package/libsoundtouch/
diff --git a/package/Config.in b/package/Config.in
index 9b4aa7dac9..619318bc17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1277,6 +1277,7 @@ menu "Filesystem"
 	source "package/libfuse/Config.in"
 	source "package/liblockfile/Config.in"
 	source "package/libnfs/Config.in"
+	source "package/libsmb2/Config.in"
 	source "package/libsysfs/Config.in"
 	source "package/lockdev/Config.in"
 	source "package/physfs/Config.in"
diff --git a/package/libsmb2/Config.in b/package/libsmb2/Config.in
new file mode 100644
index 0000000000..2793e51f37
--- /dev/null
+++ b/package/libsmb2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSMB2
+	bool "libsmb2"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SMB2/3 userspace client
+
+	  https://github.com/sahlberg/libsmb2
diff --git a/package/libsmb2/libsmb2.hash b/package/libsmb2/libsmb2.hash
new file mode 100644
index 0000000000..4cf074ebe7
--- /dev/null
+++ b/package/libsmb2/libsmb2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 36d10d1628ad34d56646bf9e7005a8abe8ce6b67ba3a949d537ae3e5f08f701f  libsmb2-3.0.0.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libsmb2/libsmb2.mk b/package/libsmb2/libsmb2.mk
new file mode 100644
index 0000000000..6f1f8a828c
--- /dev/null
+++ b/package/libsmb2/libsmb2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libsmb2
+#
+################################################################################
+
+LIBSMB2_VERSION = 3.0.0
+LIBSMB2_SITE = $(call github,sahlberg,libsmb2,v$(LIBSMB2_VERSION))
+LIBSMB2_LICENSE = LGPL-2.1+
+LIBSMB2_LICENSE_FILES = LICENCE-LGPL-2.1.txt
+LIBSMB2_DEPENDENCIES = openssl
+
+$(eval $(cmake-package))
-- 
2.20.1
