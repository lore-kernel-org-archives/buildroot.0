From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 13 Nov 2015 12:09:18 +0100
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c:new package
Message-ID: <1447412958-25453-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in                  |  1 +
 package/rabbitmq-c/Config.in       |  9 +++++++++
 package/rabbitmq-c/rabbitmq-c.hash |  2 ++
 package/rabbitmq-c/rabbitmq-c.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/rabbitmq-c/Config.in
 create mode 100644 package/rabbitmq-c/rabbitmq-c.hash
 create mode 100644 package/rabbitmq-c/rabbitmq-c.mk

diff --git a/package/Config.in b/package/Config.in
index 0a80afb..7092be4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,6 +1058,7 @@ menu "Networking"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
+	source "package/rabbitmq-c/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
new file mode 100644
index 0000000..55ce93d
--- /dev/null
+++ b/package/rabbitmq-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RABBITMQ_C
+	bool "rabbitmq-c"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  This is a C-language AMQP client library for use with v2.0+ of 
+	  the RabbitMQ broker.
+
+
+	  https://github.com/alanxz/rabbitmq-c
diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
new file mode 100644
index 0000000..9f7d071
--- /dev/null
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0b9b81d05b3e629c3449521690de400fe4539a8ba1feacadcbd6e9a50c8a4625 rabbitmq-c-v0.7.1.tar.gz
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
new file mode 100644
index 0000000..cd81ddf
--- /dev/null
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# rabbitmq-c
+#
+################################################################################
+
+RABBITMQ_C_VERSION = v0.7.1
+RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))
+RABBITMQ_C_LICENSE = MIT
+RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
+RABBITMQ_C_INSTALL_STAGING = YES
+RABBITMQ_C_DEPENDENCIES = openssl
+
+$(eval $(cmake-package))
-- 
1.8.3.1
