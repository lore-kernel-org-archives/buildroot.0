From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 13:30:44 +0100
Subject: [Buildroot] [git commit] Added the libtpl package
Message-ID: <20120319123316.C085990AB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f21f4d43b325c3cbad126b8f10fd24498c6af285
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop _INSTALL_TARGET = NO as it installs a shared lib]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libtpl/Config.in |    6 ++++++
 package/libtpl/libtpl.mk |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f0ce963..85583c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
diff --git a/package/libtpl/Config.in b/package/libtpl/Config.in
new file mode 100644
index 0000000..a2c2c2d
--- /dev/null
+++ b/package/libtpl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBTPL
+	bool "libtpl"
+	help
+	  Easily store and retrieve binary data in C
+
+	  http://tpl.sourceforge.net/
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
new file mode 100644
index 0000000..e565bb9
--- /dev/null
+++ b/package/libtpl/libtpl.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libtpl
+#
+#############################################################
+LIBTPL_VERSION = 1.5
+LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
+LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
+LIBTPL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
