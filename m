From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:12 +0100
Subject: [Buildroot] [PATCH 1/5] efl: added libeet package
In-Reply-To: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261614916-8219-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/efl/Config.in        |    1 +
 package/efl/efl.mk           |    1 +
 package/efl/libeet/Config.in |    9 +++++++++
 package/efl/libeet/libeet.mk |   17 +++++++++++++++++
 4 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libeet/Config.in
 create mode 100644 package/efl/libeet/libeet.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1a05c4d..1e3d8ae 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -8,5 +8,6 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
+source "package/efl/libeet/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 071256e..7125222 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,5 +1,6 @@
 ifeq ($(BR2_PACKAGE_EFL),y)
 EFL_SNAPSHOT_URL=http://download.enlightenment.org/snapshots/2009-12-02
+EFL_RELEASE_URL=http://download.enlightenment.org/releases
 
 include package/efl/*/*.mk
 endif
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
new file mode 100644
index 0000000..fa1dd2a
--- /dev/null
+++ b/package/efl/libeet/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEET
+	bool "libeet"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Eet is a tiny library designed to write an arbitary set of
+	  chunks of data to a file and optionally compress each chunk
+	  (very much like a zip file).
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
new file mode 100644
index 0000000..15d245b
--- /dev/null
+++ b/package/efl/libeet/libeet.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libeet
+#
+#############################################################
+
+LIBEET_VERSION = 1.2.3
+LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
+LIBEET_SITE = $(EFL_RELEASE_URL)
+LIBEET_INSTALL_STAGING = YES
+LIBEET_INSTALL_TARGET = YES
+
+LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
+
+$(eval $(call AUTOTARGETS,package,libeet))
+
+
-- 
1.6.5.7
