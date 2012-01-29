From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 21:36:29 +0100
Subject: [Buildroot] [git commit] expedite: Add new package
Message-ID: <20120129222325.1659F90042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9632d5985845dc93657bab591c07df1e529de36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in            |    1 +
 package/efl/expedite/Config.in   |   14 ++++++++++++++
 package/efl/expedite/expedite.mk |   11 +++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 7d9c1ff..258d99a 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_EFL
 
 if BR2_PACKAGE_EFL
 
+source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
new file mode 100644
index 0000000..9e131f3
--- /dev/null
+++ b/package/efl/expedite/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_EXPEDITE
+	bool "expedite"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBEET
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Expedite is the official Evas benchmark tool. It can test different
+	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
+	  DirectFB and so on. Its tests are quite extensive, trying to
+	  reproduce real world usage cases.
+
+comment "expedite requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
new file mode 100644
index 0000000..4c01190
--- /dev/null
+++ b/package/efl/expedite/expedite.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# expedite
+#
+#############################################################
+
+EXPEDITE_VERSION = 1.1.0
+EXPEDITE_SITE = http://download.enlightenment.org/releases/
+EXPEDITE_DEPENDENCIES = libevas libeina libeet
+
+$(eval $(call AUTOTARGETS))
