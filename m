From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 10 Jun 2021 21:39:34 +0300
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.10.4
Message-ID: <20210610183934.100570-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From this version, tests can be disabled, so we pass
"tests=false" as a Meson option.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 49c71f402f..0414264bf8 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  c32527782cef620df58b162aa29901d1fb13253b029375d5860a2253a810344e  libfuse3-3.10.3.tar.gz
+sha256  bfcb2520fd83db29e9fefd57d3abd5285f38ad484739aeee8e03fbec9b2d984a  libfuse3-3.10.4.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index b1624ba887..fc747c5bfd 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.3
+LIBFUSE3_VERSION = 3.10.4
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
@@ -15,7 +15,8 @@ LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE3_CONF_OPTS = \
 	-Dexamples=false \
 	-Dudevrulesdir=/lib/udev/rules.d \
-	-Duseroot=false
+	-Duseroot=false \
+	-Dtests=false
 
 define LIBFUSE3_DEVICES
 	/dev/fuse  c  666  0  0  10  229  0  0  -
-- 
2.30.2
