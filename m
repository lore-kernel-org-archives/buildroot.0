From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:36:06 +0000
Subject: [Buildroot] [PATCH 11/14] libefreet: Add new package
Message-ID: <CAFbHwiRcBwS45R=X0-bE1uRs59-SkC+5BvCRqwDB-Ms2ujWo5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/efl/Config.in              |    1 +
 package/efl/libefreet/Config.in    |    8 ++++++++
 package/efl/libefreet/libefreet.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libefreet/Config.in
 create mode 100644 package/efl/libefreet/libefreet.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 258d99a..b747953 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,6 +12,7 @@ source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
+source "package/efl/libefreet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
new file mode 100644
index 0000000..7a43501
--- /dev/null
+++ b/package/efl/libefreet/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBEFREET
+	bool "libefreet"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	help
+	  Efreet is a library designed to help apps work several of the
+	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
diff --git a/package/efl/libefreet/libefreet.mk
b/package/efl/libefreet/libefreet.mk
new file mode 100644
index 0000000..14fb8cb
--- /dev/null
+++ b/package/efl/libefreet/libefreet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libefreet
+#
+################################################################################
+
+LIBEFREET_VERSION = 1.1.0
+LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
+LIBEFREET_SITE = http://download.enlightenment.org/releases/
+LIBEFREET_INSTALL_STAGING = YES
+
+LIBEFREET_DEPENDENCIES = libeina libeet libecore
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
