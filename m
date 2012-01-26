From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 23:06:01 +0100
Subject: [Buildroot] [git commit] libeet: Add new package
Message-ID: <20120126220755.0CD6790591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc06f041fcffecf9a62c64eeff40a00f522bcddf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add URL, drop _INSTALL_TARGET]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in        |    1 +
 package/efl/libeet/Config.in |   11 +++++++++++
 package/efl/libeet/libeet.mk |   15 +++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cc677cb..8ca514d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
+source "package/efl/libeet/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
new file mode 100644
index 0000000..48631a0
--- /dev/null
+++ b/package/efl/libeet/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBEET
+	bool "libeet"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Eet is a tiny library designed to write an arbitary set of
+	  chunks of data to a file and optionally compress each chunk
+	  (very much like a zip file).
+
+	  http://trac.enlightenment.org/e/wiki/Eet
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
new file mode 100644
index 0000000..f9af219
--- /dev/null
+++ b/package/efl/libeet/libeet.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libeet
+#
+#############################################################
+
+LIBEET_VERSION = 1.5.0
+LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
+LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_INSTALL_STAGING = YES
+
+LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
