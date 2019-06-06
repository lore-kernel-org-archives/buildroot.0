From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 08:49:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/cjson: security
 bump to version 1.7.12
Message-ID: <20190606064907.6AEDD812B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=450e61e4c2e07a103dae9f58eab94262dde80474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix infinite loop in cJSON_Minify (potential Denial of Service), see
https://github.com/DaveGamble/cJSON/issues/354

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ee83e0b1acb4da893b132b0805853a3a653385a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 32a05b3c05..d980fc85a3 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 17ace0e31ebd639906983b05fe1d51576b948ca5411c2162f55dd34c122162ca  cjson-v1.7.11.tar.gz
+sha256 760687665ab41a5cff9c40b1053c19572bcdaadef1194e5cba1b5e6f824686e7  cjson-v1.7.12.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index e6ab71b92a..ae09ea95ed 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.11
+CJSON_VERSION = v1.7.12
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
