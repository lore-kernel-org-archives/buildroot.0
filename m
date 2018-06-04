From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jun 2018 22:59:48 +0200
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c: bump to version 0.9.0
Message-ID: <20180604205948.1833-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-c/rabbitmq-c.hash | 3 ++-
 package/rabbitmq-c/rabbitmq-c.mk   | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index 45e8cbd822..0af88774e6 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 d8ed9dcb49903d83d79d7b227da35ef68c60e5e0b08d0fc1fb4e4dc577b8802b rabbitmq-c-v0.8.0.tar.gz
+sha256 316c0d156452b488124806911a62e0c2aa8a546d38fc8324719cd29aaa493024 rabbitmq-c-v0.9.0.tar.gz
+sha256 94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422 LICENSE-MIT
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index d496a4c09b..a3c4f8219f 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = v0.8.0
+RABBITMQ_C_VERSION = v0.9.0
 RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
@@ -13,6 +13,11 @@ RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
 
+# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
+# disable a try_run() call in the FindThreads tests, which caused a
+# build failure when cross-compiling.
+RABBITMQ_C_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-- 
2.14.1
