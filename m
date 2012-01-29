From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 22:01:09 +0100
Subject: [Buildroot] [git commit] libethumb: Add new package
Message-ID: <20120129222325.37AA090042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=151583964233c7e1de2927396ca3ff48ee75e510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add ecore-evas dep, upstream URL]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in              |    1 +
 package/efl/libethumb/Config.in    |   11 +++++++++++
 package/efl/libethumb/libethumb.mk |   16 ++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index b747953..1632290 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,6 +16,7 @@ source "package/efl/libefreet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
+source "package/efl/libethumb/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
new file mode 100644
index 0000000..fb0032a
--- /dev/null
+++ b/package/efl/libethumb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBECORE_EVAS
+	select BR2_PACKAGE_LIBEDJE
+	help
+	  Ethumb is a library for generating thumbnail images of documents.
+
+	  http://trac.enlightenment.org/e/wiki/Ethumb
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
new file mode 100644
index 0000000..16b2ba9
--- /dev/null
+++ b/package/efl/libethumb/libethumb.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libethumb
+#
+################################################################################
+
+LIBETHUMB_VERSION = 0.1.1.65643
+LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
+LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBETHUMB_INSTALL_STAGING = YES
+
+LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
+
+LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+
+$(eval $(call AUTOTARGETS))
