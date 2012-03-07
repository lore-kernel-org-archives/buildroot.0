From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 7 Mar 2012 18:06:29 +0000
Subject: [Buildroot] New package protobuf
Message-ID: <CAHt8ZCM9ZD=VSEc5UJ+98NTiwhYsAz0sGXCt+yNPVMAKCB8qtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch to add protobuf package (Google protocol buffers) to buildroot.

http://code.google.com/p/protobuf/

---
diff --git a/package/Config.in b/package/Config.in
index 41cbb8c..a2d2006 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
+source "package/protobuf/Config.in"
 source "package/startup-notification/Config.in"
 endmenu

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
new file mode 100644
index 0000000..6a7447f
--- /dev/null
+++ b/package/protobuf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROTOBUF
+	bool "protobuf"
+	help
+	Protocol buffers are Google's language-neutral, platform-neutral,
+	extensible mechanism for serializing structured data.
+
+	 http://code.google.com/p/protobuf/
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
new file mode 100644
index 0000000..79a06dd
--- /dev/null
+++ b/package/protobuf/protobuf.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# protobuf
+#
+#############################################################
+PROTOBUF_VERSION = 2.4.1
+PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+
+# N.B. Need to use host protoc during cross compilation.
+PROTOBUF_DEPENDENCIES = host-protobuf
+PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
