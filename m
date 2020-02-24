From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Mon, 24 Feb 2020 09:41:46 +0200
Subject: [Buildroot] [PATCH v2] package/fswebcam: bump to latest git version
Message-ID: <20200224074146.3008-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest git version.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- use buildroot github API to call for tar download


 package/fswebcam/fswebcam.hash | 1 +
 package/fswebcam/fswebcam.mk   | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 28f604547c..ee9bebd106 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474  fswebcam-20140113.tar.xz
+sha256  fe178a0f37ee203103eceaaf9a81a8669edb49923250e8a2ec7459543a8175b0  fswebcam-9a995d6a5369ddd158e352766e015dae20982318.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 8f823f4d04..5887c0b92b 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = 20140113
-FSWEBCAM_SOURCE = fswebcam-$(FSWEBCAM_VERSION).tar.xz
-FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
+FSWEBCAM_VERSION = 9a995d6a5369ddd158e352766e015dae20982318
+FSWEBCAM_SITE = $(call github,fsphil,fswebcam,$(FSWEBCAM_VERSION))
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
 
-- 
2.20.1
