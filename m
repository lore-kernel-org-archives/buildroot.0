From: Will Newton <will.newton@gmail.com>
Date: Thu, 26 Jan 2012 17:42:59 +0000
Subject: [Buildroot] [PATCH 14/14] libedbus: Add new package
Message-ID: <CAFbHwiTEaezGnZBkvvfH_gMODERa=FAhXZqyjZ80bf02YF4+iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in            |    1 +
 package/efl/libedbus/Config.in   |   10 ++++++++++
 package/efl/libedbus/libedbus.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libedbus/Config.in
 create mode 100644 package/efl/libedbus/libedbus.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index ec8c513..c783d7f 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -18,6 +18,7 @@ source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
 source "package/efl/libelementary/Config.in"
+source "package/efl/libedbus/Config.in"

 endif # BR2_PACKAGE_EFL

diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
new file mode 100644
index 0000000..27993f0
--- /dev/null
+++ b/package/efl/libedbus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBEDBUS
+	bool "libedbus"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_LIBXML2
+	help
+	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
+	  easily used by EFL applications, automatically providing
+	  Ecore/main loop integration, as well as Eina data types.
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
new file mode 100644
index 0000000..fe883e0
--- /dev/null
+++ b/package/efl/libedbus/libedbus.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libedbus
+#
+#############################################################
+
+LIBEDBUS_VERSION = 1.1.0
+LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
+LIBEDBUS_SITE = http://download.enlightenment.org/releases/
+LIBEDBUS_AUTORECONF = YES
+LIBEDBUS_INSTALL_STAGING = YES
+
+LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina libecore
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
