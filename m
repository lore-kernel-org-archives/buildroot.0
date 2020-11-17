From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 23:34:35 +0100
Subject: [Buildroot] [PATCH/next v1 4/5] package/libcamera: bump version to
 de5d03673
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <20201117223436.24036-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add new host-python3-jinja2 and host-python3-ply dependencies
- change android, documentation options from boolean to feature
- disable new tracing option (needs lttng-ust)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 41416da712..32c19f4abf 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
+sha256  de6528224c3d54854e7eac6e8ce139ff9168cafe830f559d4aac879084dc7716  libcamera-de5d03673c41f5f117d03c23495de5620fd6f42e.tar.gz
 
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
-- 
2.29.2
