From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  4 Jul 2020 07:24:43 -0300
Subject: [Buildroot] [PATCH] package/live555: bump version to 2020.06.25
Message-ID: <20200704102443.32338-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now depends on openssl. Also separate the fields in the hash file by two
spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/live555/Config.in    | 1 +
 package/live555/live555.hash | 6 +++---
 package/live555/live555.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/live555/Config.in b/package/live555/Config.in
index dbd9dfd32e00..d0ef7ffa991e 100644
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIVE555
 	bool "live555"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_OPENSSL
 	help
 	  LIVE555 Streaming Media forms a set of C++ libraries for
 	  multimedia streaming, using open standard protocols
diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index f5df69f24f58..867e0befd002 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5 12e105c8fef9d34658d68367dc26a3d9 live.2019.09.30.tar.gz
+md5  327bc53f60361c6d703d52e86f476f11  live.2020.06.25.tar.gz
 # Locally generated
-sha256 ef44f48a84324525cebc2081dd2d0f1e908f2d0a79d9d30dd41967e142dfb06b  live.2019.09.30.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  f206309f10d281990889b7a0c92c26a7fa55ac0e8568bf594b9b27433b4db585  live.2020.06.25.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index cbe1c1bc0dda..9f8fc6918a3d 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2019.09.30
+LIVE555_VERSION = 2020.06.25
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
+LIVE555_DEPENDENCIES = openssl
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.17.1
