From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  1 Aug 2020 00:15:14 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera: bump version to
 565f95d
In-Reply-To: <20200731221514.32623-1-ps.report@gmx.net>
References: <20200731221514.32623-1-ps.report@gmx.net>
Message-ID: <20200731221514.32623-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - add support for new qcam feature option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 907764de63..676d3ac739 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  6995be9d707ba3bcbe7a79bad894484561ee686f68b6523943ada7c0f6607e86  libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb.tar.gz
+sha256  55b7d7e5d8c70b2586b31544e6c4891a994c4e69c18d0ebd760e87b75277c348  libcamera-565f95d64ff92e8712e8090988180c343dd3bcb5.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9739f715a1..ce23d44661 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 96fab38e02792a109c0d35ca2154e95a7b4c8fcb
+LIBCAMERA_VERSION = 565f95d64ff92e8712e8090988180c343dd3bcb5
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -65,10 +65,13 @@ LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
+LIBCAMERA_CONF_OPTS += -Dqcam=enabled
 LIBCAMERA_DEPENDENCIES += qt5base
 ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
 LIBCAMERA_DEPENDENCIES += qt5tools
 endif
+else
+LIBCAMERA_CONF_OPTS += -Dqcam=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-- 
2.27.0
