From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 22:36:46 +0100
Subject: [Buildroot] [git commit] libelementary: Add new package
Message-ID: <20120129222325.4B55990042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c3e2f9789d2b1536157a19379d352840e76f85a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Add upstream URL, remove examples option/patches]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in                      |    1 +
 package/efl/libelementary/Config.in        |   12 ++++++++++++
 package/efl/libelementary/libelementary.mk |   18 ++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1632290..ec8c513 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -17,6 +17,7 @@ source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
+source "package/efl/libelementary/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
new file mode 100644
index 0000000..59af80e
--- /dev/null
+++ b/package/efl/libelementary/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBELEMENTARY
+	bool "libelementary"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEDJE
+	help
+	  Elementary is a widget toolkit and EFL wrapper and convenience
+	  library to make it easy to build applications and tools with UIs
+	  with less code.
+
+	  http://trac.enlightenment.org/e/wiki/Elementary
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
new file mode 100644
index 0000000..475fd45
--- /dev/null
+++ b/package/efl/libelementary/libelementary.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libelementary
+#
+################################################################################
+
+LIBELEMENTARY_VERSION = 0.8.0.65643
+LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
+LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBELEMENTARY_INSTALL_STAGING = YES
+
+LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
+				host-libeet
+
+LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
+
+$(eval $(call AUTOTARGETS))
