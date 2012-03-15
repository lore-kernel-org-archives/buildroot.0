From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 15 Mar 2012 08:51:27 +0000
Subject: [Buildroot] [PATCH resend] Added protobuf package
Message-ID: <CAHt8ZCMdK6Stia58eSVenoUqJHBDQ0Aptx_yWedvGRD-F8O8XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>

---
 package/Config.in            |    1 +
 package/protobuf/Config.in   |    7 +++++++
 package/protobuf/protobuf.mk |   17 +++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/protobuf/Config.in
 create mode 100644 package/protobuf/protobuf.mk

diff --git a/package/Config.in b/package/Config.in
index 36a221c..575373a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -388,6 +388,7 @@ source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
+source "package/protobuf/Config.in"
 source "package/startup-notification/Config.in"
 endmenu

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
new file mode 100644
index 0000000..1b0085b
--- /dev/null
+++ b/package/protobuf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROTOBUF
+       bool "protobuf"
+       help
+         Protocol buffers are Google's language-neutral, platform-neutral,
+         extensible mechanism for serializing structured data.
+
+         http://code.google.com/p/protobuf/
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
new file mode 100644
index 0000000..b810795
--- /dev/null
+++ b/package/protobuf/protobuf.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# protobuf
+#
+#############################################################
+PROTOBUF_VERSION = 2.4.1
+PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
+PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+
+# N.B. Need to use host protoc during cross compilation.
+PROTOBUF_DEPENDENCIES = host-protobuf
+PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+
+PROTOBUF_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
