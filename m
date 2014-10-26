From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:56 +0100
Subject: [Buildroot] [PATCH 50/51] protobuf-c: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-50-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The releases contains generated Makefile and configure, there's no need
to AUTORECONF anymore.
Also add a hash file since the release tarball has been uploaded by the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/protobuf-c/protobuf-c.hash | 2 ++
 package/protobuf-c/protobuf-c.mk   | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 package/protobuf-c/protobuf-c.hash

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
new file mode 100644
index 0000000..73adbaf
--- /dev/null
+++ b/package/protobuf-c/protobuf-c.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  db771f7b0e76d5bb14140a50df4a32553288fd3e701b60e90e034e22f411ef76  protobuf-c-1.0.2.tar.gz
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index d73eb25..bf4f146 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = v1.0.0-rc1
-PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
+PROTOBUF_C_VERSION = 1.0.2
+PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
@@ -13,8 +13,6 @@ PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2c
 PROTOBUF_C_LICENSE_FILES = LICENSE
-PROTOBUF_C_AUTORECONF = YES
-HOST_PROTOBUF_C_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.1
