From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 23:20:32 +0100
Subject: [Buildroot] [git commit] libedbus: Add new package
Message-ID: <20120129222325.5C6A690042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ba2e23d8b3e8ac212bc045f63abb698fc61363f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: select dbus, add upstream URL, remove unneeded autoreconf]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in            |    1 +
 package/efl/libedbus/Config.in   |   11 +++++++++++
 package/efl/libedbus/libedbus.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

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
index 0000000..3844b52
--- /dev/null
+++ b/package/efl/libedbus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBEDBUS
+	bool "libedbus"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBECORE
+	depends on BR2_PACKAGE_DBUS
+	help
+	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
+	  easily used by EFL applications, automatically providing
+	  Ecore/main loop integration, as well as Eina data types.
+
+	  http://trac.enlightenment.org/e/wiki/E_Dbus
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
new file mode 100644
index 0000000..34f34a7
--- /dev/null
+++ b/package/efl/libedbus/libedbus.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libedbus
+#
+#############################################################
+
+LIBEDBUS_VERSION = 1.1.0
+LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
+LIBEDBUS_SITE = http://download.enlightenment.org/releases/
+LIBEDBUS_INSTALL_STAGING = YES
+
+LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina libecore
+
+$(eval $(call AUTOTARGETS))
