From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:40:14 +0200
Subject: [Buildroot] [git commit] package/cjson: security bump to version
 1.7.11
Message-ID: <20190415193637.B7EC3805AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a45a3997d8ee0aa592c6a64ce300ee727ad7dc54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a bug where cJSON_Minify could overflow it's buffer, both reading
and writing: https://github.com/DaveGamble/cJSON/issues/338.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 9c39bb321f..32a05b3c05 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 cc544fdd065f3dd19113f1d5ba5f61d696e0f810f291f4b585d1dec361b0188e  cjson-v1.7.10.tar.gz
+sha256 17ace0e31ebd639906983b05fe1d51576b948ca5411c2162f55dd34c122162ca  cjson-v1.7.11.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index b2ef1c8582..e6ab71b92a 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.10
+CJSON_VERSION = v1.7.11
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
