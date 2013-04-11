From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Apr 2013 11:41:35 -0300
Subject: [Buildroot] [PATCH 1/2] protobuf-c: new package
Message-ID: <1365691296-16042-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                |  1 +
 package/protobuf-c/Config.in     | 12 ++++++++++++
 package/protobuf-c/protobuf-c.mk | 16 ++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/protobuf-c/Config.in
 create mode 100644 package/protobuf-c/protobuf-c.mk

diff --git a/package/Config.in b/package/Config.in
index 0537ffa..826310c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
+source "package/protobuf-c/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/liblog4c-localtime/Config.in"
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
new file mode 100644
index 0000000..9aff6e2
--- /dev/null
+++ b/package/protobuf-c/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PROTOBUF_C
+	bool "protobuf-c"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PROTOBUF
+	help
+	  Code generator and runtime libraries to use Protocol Buffers
+	  from pure C (not C++).
+
+	  http://code.google.com/p/protobuf-c/
+
+comment "protobuf-c requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
new file mode 100644
index 0000000..eb0047a
--- /dev/null
+++ b/package/protobuf-c/protobuf-c.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# protobuf-c
+#
+#############################################################
+
+PROTOBUF_C_VERSION = 0.15
+PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
+PROTOBUF_C_DEPENDENCIES = protobuf host-protobuf-c
+HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
+PROTOBUF_C_CONF_OPT = --disable-protoc
+PROTOBUF_C_INSTALL_STAGING = YES
+PROTOBUF_C_LICENSE = BSD-3c
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.5
