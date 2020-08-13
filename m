From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:18:16 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/mender-artifact: use github
 helper for site URL
Message-ID: <20200813211816.226194-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 09e66617bb..a9fba2971e 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c085479a6e2ae598687a15b646bfaaa68e5d76d08382bdcc4a27a9b4021d6540  3.4.0.tar.gz
+sha256  c085479a6e2ae598687a15b646bfaaa68e5d76d08382bdcc4a27a9b4021d6540  mender-artifact-3.4.0.tar.gz
 sha256  08b0209abb7e87bb1d21aca8a40693b7d29406d1edffd443f17c59d5d68f6467  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index c81ec9ba53..78cd9fda4e 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 HOST_MENDER_ARTIFACT_VERSION = 3.4.0
-HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
-HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
+HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	LICENSE \
-- 
2.28.0
