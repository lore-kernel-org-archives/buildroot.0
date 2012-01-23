From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 16:35:43 +0000
Subject: [Buildroot] [PATCH 08/14] libembryo: Add new package
Message-ID: <CAFbHwiQGYFRQt3uPx8Y5W_kYmzRyw56OaaUg-n_nFT98S_QVgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/efl/Config.in              |    1 +
 package/efl/libembryo/Config.in    |    7 +++++++
 package/efl/libembryo/libembryo.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
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
index 0000000..ab9bdf5
--- /dev/null
+++ b/package/efl/libembryo/libembryo.mk
@@ -0,0 +1,16 @@
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
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
