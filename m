From: Will Newton <will.newton@gmail.com>
Date: Wed, 18 Jan 2012 11:17:41 +0000
Subject: [Buildroot] [PATCH 7/7] expedite: Add new package.
Message-ID: <CAFbHwiT-xD8qTcXfR1Fy6g70Oc5i62qPYoJKR85TNfjnRAq02w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/efl/Config.in            |    1 +
 package/efl/expedite/Config.in   |   13 +++++++++++++
 package/efl/expedite/expedite.mk |   11 +++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/expedite/Config.in
 create mode 100644 package/efl/expedite/expedite.mk

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
index 0000000..54da290
--- /dev/null
+++ b/package/efl/expedite/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_EXPEDITE
+	bool "expedite"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
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
index 0000000..e0b8e76
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
+EXPEDITE_DEPENDENCIES = libevas libeina
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
