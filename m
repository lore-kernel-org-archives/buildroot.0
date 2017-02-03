From: Dagg Stompler <daggs@gmx.com>
Date: Fri,  3 Feb 2017 14:11:17 +0200
Subject: [Buildroot] [PATCH] libamcodec: bump version to
	296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca
Message-ID: <20170203121117.16653-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - remove 0001-Include-stdint.h-where-needed.patch as it was merged into
   the tree.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 .../0001-Include-stdint.h-where-needed.patch       | 47 ----------------------
 package/libamcodec/libamcodec.hash                 |  2 +-
 package/libamcodec/libamcodec.mk                   |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/libamcodec/0001-Include-stdint.h-where-needed.patch

diff --git a/package/libamcodec/0001-Include-stdint.h-where-needed.patch b/package/libamcodec/0001-Include-stdint.h-where-needed.patch
deleted file mode 100644
index 6d588f6b1..000000000
--- a/package/libamcodec/0001-Include-stdint.h-where-needed.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From ff6d4326f839321c079d60ae9301c6202942f675 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 27 Aug 2016 14:31:04 +0200
-Subject: [PATCH] Include <stdint.h> where needed
-
-The {u,}int{8,16,32}_t types are defined in <stdint.h>, so it should be
-included when such types are used.
-
-Not including <stdint.h> might work by accident with some C libraries
-due to it being included by other headers, but it for example causes
-build failures with the musl C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: https://github.com/mdrjr/c2_aml_libs/pull/1
----
- amadec/audio-dec.h               | 1 +
- amavutils/include/Amvideoutils.h | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/amadec/audio-dec.h b/amadec/audio-dec.h
-index 4325fe4..ac0f36b 100644
---- a/amadec/audio-dec.h
-+++ b/amadec/audio-dec.h
-@@ -12,6 +12,7 @@
- #define AUDIO_DEC_H
- 
- #include<pthread.h>
-+#include <stdint.h>
- 
- #include <audio-out.h>
- #include <audiodsp.h>
-diff --git a/amavutils/include/Amvideoutils.h b/amavutils/include/Amvideoutils.h
-index 6f978e4..94f10a6 100644
---- a/amavutils/include/Amvideoutils.h
-+++ b/amavutils/include/Amvideoutils.h
-@@ -5,6 +5,8 @@
- extern "C" {
- #endif
- 
-+#include <stdint.h>
-+
- #define HDMI_HDCP_PASS           (1)
- #define HDMI_HDCP_FAILED      (0)
- #define HDMI_NOCONNECT        (-1)
--- 
-2.7.4
-
diff --git a/package/libamcodec/libamcodec.hash b/package/libamcodec/libamcodec.hash
index 13bb1e85b..a76d20a95 100644
--- a/package/libamcodec/libamcodec.hash
+++ b/package/libamcodec/libamcodec.hash
@@ -1,2 +1,2 @@
 # Locally computed hash
-sha256 5e4a1157e75f802585445df55182b5ef123f635b7faca95fbda3f7cdef8bad1c  libamcodec-6f9b99182f94be14fce785c75aa1e9bce868e229.tar.gz
+sha256 2c9812154b6dfd6a6c9c43aa334d0d03f299379fdf83c20121ad3f3d3f97c666  libamcodec-296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
index 8fab95dce..3fab228fd 100644
--- a/package/libamcodec/libamcodec.mk
+++ b/package/libamcodec/libamcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAMCODEC_VERSION = 6f9b99182f94be14fce785c75aa1e9bce868e229
+LIBAMCODEC_VERSION = 296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca
 LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
 LIBAMCODEC_DEPENDENCIES = alsa-lib
 LIBAMCODEC_LICENSE = Unclear
-- 
2.11.1
