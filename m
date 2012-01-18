From: Will Newton <will.newton@gmail.com>
Date: Wed, 18 Jan 2012 11:17:34 +0000
Subject: [Buildroot] [PATCH 5/7] libembryo: Add new package.
Message-ID: <CAFbHwiT_Hc4WT22dGWge1FjrxT_WYLhf7uctiw7n9n1ajX6MOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/efl/Config.in              |    1 +
 package/efl/libembryo/Config.in    |    7 +++++++
 package/efl/libembryo/libembryo.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libembryo/Config.in
 create mode 100644 package/efl/libembryo/libembryo.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3007783..0e27dab 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,6 +12,7 @@ source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
+source "package/efl/libembryo/Config.in"

 endif # BR2_PACKAGE_EFL

diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
new file mode 100644
index 0000000..aae3eed
--- /dev/null
+++ b/package/efl/libembryo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo"
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Embryo is primarily a shared library that gives you an API
+	  to load and control interpreted programs compiled into an
+	  abstract machine bytecode that it understands.
diff --git a/package/efl/libembryo/libembryo.mk
b/package/efl/libembryo/libembryo.mk
new file mode 100644
index 0000000..3bd1d99
--- /dev/null
+++ b/package/efl/libembryo/libembryo.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libembryo
+#
+#############################################################
+
+LIBEMBRYO_VERSION = 1.1.0
+LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
+LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
+LIBEMBRYO_INSTALL_STAGING = YES
+LIBEMBRYO_INSTALL_TARGET = YES
+
+LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
