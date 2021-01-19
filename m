From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:56:59 +0100
Subject: [Buildroot] [git commit] package/libcamera: bump version to
 de5d03673
Message-ID: <20210119213844.851A180845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe45990872c34e5eb9188534632450730e88eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add new host-python3-jinja2 and host-python3-ply dependencies
- change android, documentation options from boolean to feature
- disable new tracing option (needs lttng-ust)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 47c160e8f4..4a2d63e8a2 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  cea2bf375b12c13945f9888119a4eeb999d7aeb550ecadcb5f919517b0b83c09  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f-br1.tar.gz
+sha256  9e1eb5ac366eac6bc35f3600f9f5176723cb4af14b75ab23e196450bb28eeb67  libcamera-de5d03673c41f5f117d03c23495de5620fd6f42e-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e6cd714207..aed5c6e83c 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,17 +5,20 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = e59713c68678f3eb6b6ebe97cabdc88c7042567f
+LIBCAMERA_VERSION = de5d03673c41f5f117d03c23495de5620fd6f42e
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
+	host-python3-jinja2 \
+	host-python3-ply \
 	host-python3-pyyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
-	-Dandroid=false \
-	-Ddocumentation=false \
+	-Dandroid=disabled \
+	-Ddocumentation=disabled \
 	-Dtest=false \
+	-Dtracing=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
