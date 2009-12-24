From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:15 +0100
Subject: [Buildroot] [PATCH 4/5] efl: added libembryo package
In-Reply-To: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261614916-8219-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/efl/Config.in              |    1 +
 package/efl/libembryo/Config.in    |    7 +++++++
 package/efl/libembryo/libembryo.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libembryo/Config.in
 create mode 100644 package/efl/libembryo/libembryo.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index c542c00..7a89120 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -11,5 +11,6 @@ source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
+source "package/efl/libembryo/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
new file mode 100644
index 0000000..1014bfc
--- /dev/null
+++ b/package/efl/libembryo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo"
+	help
+          Embryo is primarily a shared library that gives you an API
+          to load and control interpreted programs compiled into an
+          abstract machine bytecode that it understands.
+
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
new file mode 100644
index 0000000..e67c49a
--- /dev/null
+++ b/package/efl/libembryo/libembryo.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libembryo
+#
+#############################################################
+
+LIBEMBRYO_VERSION = 0.9.9.063
+LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
+LIBEMBRYO_SITE = $(EFL_SNAPSHOT_URL)
+LIBEMBRYO_INSTALL_STAGING = YES
+LIBEMBRYO_INSTALL_TARGET = YES
+
+LIBEMBRYO_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,libembryo))
-- 
1.6.5.7
