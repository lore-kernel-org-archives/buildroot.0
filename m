From: Mario Lang <mlang@blind.guru>
Date: Sun, 10 Dec 2017 18:54:57 +0100
Subject: [Buildroot] [PATCH] package/fswebcam: change tarball compression to
 xz
Message-ID: <20171210175457.1456-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Verified equality of underlying tarball with

  tarname=http://www.firestorm.cx/fswebcam/files/fswebcam-20140113.tar
  test "$(wget -qO- $tarname.gz|zcat|sha256sum -)" = "$(wget -qO- $tarname.xz|xzcat|sha256sum -)"

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/fswebcam/fswebcam.hash | 2 +-
 package/fswebcam/fswebcam.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 3822a27377..1e75f237e7 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3ee389f72a7737700d22e0c954720b1e3bbadc8a0daad6426c25489ba9dc3199	fswebcam-20140113.tar.gz
+sha256	444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474	fswebcam-20140113.tar.xz
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 4b47b3eb59..8f823f4d04 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 FSWEBCAM_VERSION = 20140113
+FSWEBCAM_SOURCE = fswebcam-$(FSWEBCAM_VERSION).tar.xz
 FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
-- 
2.15.0
