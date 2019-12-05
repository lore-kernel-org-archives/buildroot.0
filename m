From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 12:06:36 -0800
Subject: [Buildroot] [PATCH 1/2] package/mender-artifact: bump to version
 3.2.1
Message-ID: <20191205200637.1404431-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Add a sha256sum for LIC_FILES_CHKSUM.sha256
  - Remove duplicated license file vendor/github.com/stretchr/testify/LICENSE

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 4 ++--
 package/mender-artifact/mender-artifact.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 8a927d1ca3..74ea5686c1 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,6 @@
 # Locally computed:
-sha256 2be8946b4febf44b1e37cbaa1d1286de895bae8c5c17a5c6165e9509a02f40dc 3.2.0.tar.gz
+sha256 62233e415399a32f4397cf9e2dfc1447db58b7ebd71379ee779b360140d5ab08 3.2.1.tar.gz
+sha256 68d145b900b4845834d49efe470d7e9ec7a3d9f175e72cb974f38c54b9172801 LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -24,6 +25,5 @@ sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/g
 #
 # MIT licenses.
 sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
-sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
 sha256 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7 vendor/github.com/urfave/cli/LICENSE
 sha256 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b vendor/github.com/sirupsen/logrus/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 5ccaa31a9b..f4a606653f 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.2.0
+HOST_MENDER_ARTIFACT_VERSION = 3.2.1
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
@@ -19,7 +19,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
-	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
-- 
2.23.0
