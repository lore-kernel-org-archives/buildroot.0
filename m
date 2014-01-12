From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:18 +0100
Subject: [Buildroot] [PATCH 04/14] libbluray: new package
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBBLURAY is a client library for accessing bluray disks.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in              |  1 +
 package/libbluray/Config.in    |  6 ++++++
 package/libbluray/libbluray.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk

diff --git a/package/Config.in b/package/Config.in
index 0b00a9e..3e01ba0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,6 +621,7 @@ endmenu
 
 menu "Multimedia"
 source "package/libass/Config.in"
+source "package/libbluray/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libdvdread/Config.in"
diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
new file mode 100644
index 0000000..eeb93dc
--- /dev/null
+++ b/package/libbluray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBBLURAY
+	bool "libbluray"
+	help
+	  libbluray is a client library for accessing bluray disks.
+
+	  http://www.videolan.org/developers/libbluray.html
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
new file mode 100644
index 0000000..25cda6b
--- /dev/null
+++ b/package/libbluray/libbluray.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libbluray
+#
+#############################################################
+
+LIBBLURAY_VERSION = 0.2.2
+LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_INSTALL_STAGING = YES
+LIBBLURAY_LICENSE = LGPLv2.1+
+LIBBLURAY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.2
