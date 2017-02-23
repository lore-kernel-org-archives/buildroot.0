From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 22 Feb 2017 21:43:39 -0500
Subject: [Buildroot] [PATCH v2] libimxvpuapi: bump to version 0.10.3
Message-ID: <1487817819-2928-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because with libimxvpuapi older than 0.10.3, the gst1-imx-0.12.3 "imxvpu"
plugin will not build.

Changelog:
* properly pass on color format in simplified JPEG encoder interface
* add alternative write-callback-style encoding mode
  also add encode example variant which uses write-callback style output
* add support for "fake grayscale mode" in encoders
  this is done by using I420 internally and filling the U and V planes
  with 0x80 bytes
* make sure JPEG quantization table is copied in standardized zig zag order
  the VPU does not, so this has to be done explicitely

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

---

v1->v2
- Tweak commit log per suggestions by Gary Bisson.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libimxvpuapi/libimxvpuapi.hash | 2 +-
 package/libimxvpuapi/libimxvpuapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libimxvpuapi/libimxvpuapi.hash b/package/libimxvpuapi/libimxvpuapi.hash
index c8cabcf..cd0c8f1 100644
--- a/package/libimxvpuapi/libimxvpuapi.hash
+++ b/package/libimxvpuapi/libimxvpuapi.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 8e6dc4105db6164c0de72fd60eb73f4ba1632f7ba5052b1abc834b462b566da2  libimxvpuapi-0.10.2.tar.gz
+sha256 7151e10a24929935bada1d3d87626f17e411575b3a4ac0d86440999ad0100a55  libimxvpuapi-0.10.3.tar.gz
diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index fde4429..d368d3d 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIMXVPUAPI_VERSION = 0.10.2
+LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPLv2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-- 
2.7.4
