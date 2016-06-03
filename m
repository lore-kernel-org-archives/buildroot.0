From: Andrew Webster <awebster@arcx.com>
Date: Fri, 3 Jun 2016 09:12:41 -0400
Subject: [Buildroot] [PATCH 08/10] libimxvpuapi: bump version to 0.10.2
In-Reply-To: <cover.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
Message-ID: <17186dba6267a09cda955857673d4198395a04c8.1464958470.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- fix AUD NAL positioning in h.264 encoder output
  (SPS/PPS/AUD were ordered incorrectly - AUD has to come first, not last)
- fix build error with examples when --enable-static is used
- pass quality factor in simplified JPEG encoder interface correctly
- add functions for querying and setting header data
  useful for modifying headers, like VUI data in the SPS RBSP
- documentation updates

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/c999668

Signed-off-by: Andrew Webster <awebster@arcx.com>
---
 package/libimxvpuapi/libimxvpuapi.hash | 2 +-
 package/libimxvpuapi/libimxvpuapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libimxvpuapi/libimxvpuapi.hash b/package/libimxvpuapi/libimxvpuapi.hash
index fd90a20..c8cabcf 100644
--- a/package/libimxvpuapi/libimxvpuapi.hash
+++ b/package/libimxvpuapi/libimxvpuapi.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 8d7aeed88c06fda44318cef9565ae47b86461bd309908b1103a7974ed0822a8d  libimxvpuapi-0.10.1.tar.gz
+sha256 8e6dc4105db6164c0de72fd60eb73f4ba1632f7ba5052b1abc834b462b566da2  libimxvpuapi-0.10.2.tar.gz
diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index e0d8cc9..df84806 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIMXVPUAPI_VERSION = 0.10.1
+LIBIMXVPUAPI_VERSION = 0.10.2
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPLv2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-- 
1.9.1
