From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  7 Mar 2021 14:25:33 -0800
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump to version
 3.4.1
In-Reply-To: <20210307222536.2743089-1-aduskett@gmail.com>
References: <20210307222536.2743089-1-aduskett@gmail.com>
Message-ID: <20210307222536.2743089-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Also:
  - Set new License hashes due to new dependencies.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 7 ++++---
 package/mender-artifact/mender-artifact.mk   | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index a9fba2971e..a3af951997 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  c085479a6e2ae598687a15b646bfaaa68e5d76d08382bdcc4a27a9b4021d6540  mender-artifact-3.4.0.tar.gz
-sha256  08b0209abb7e87bb1d21aca8a40693b7d29406d1edffd443f17c59d5d68f6467  LIC_FILES_CHKSUM.sha256
+sha256  5a3c204fb68bdc793e7e11cd631a4463b2fa6f325a2b9b8b795ef4f3160e6e36  mender-artifact-3.4.1.tar.gz
+sha256  cb0d00827fd4fc3329c9ec0aa510a811b375cb17537c0f46a94852cc7aa199f6  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,7 +8,7 @@ sha256  08b0209abb7e87bb1d21aca8a40693b7d29406d1edffd443f17c59d5d68f6467  LIC_FI
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
+sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mendertesting/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  vendor/gopkg.in/yaml.v2/LICENSE
@@ -34,3 +34,4 @@ sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor
 sha256  7709cc030f078b17809884f92f33a2016944e1180312dc3f1371b02313d313ed  vendor/github.com/klauspost/pgzip/LICENSE
 sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
 sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
+sha256  a94710b55e03b5285f77d048c5ba61bb9d6ee04a06c0eb90e68821e11b0c707a  vendor/gopkg.in/yaml.v2/LICENSE.libyaml
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index b2310d5bc2..162f57eee3 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.4.0
+HOST_MENDER_ARTIFACT_VERSION = 3.4.1
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -26,7 +26,8 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/klauspost/pgzip/LICENSE \
 	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
-	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
+	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE \
+	vendor/gopkg.in/yaml.v2/LICENSE.libyaml
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-- 
2.25.1
