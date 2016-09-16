From: Frederik Aalund <fpa@sbtaqua.com>
Date: Fri, 16 Sep 2016 11:36:49 +0200
Subject: [Buildroot] [PATCH 1/1] libfastjson: Was referencing non-existing
	files
Message-ID: <1474018609-2610-1-git-send-email-fpa@sbtaqua.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both the .hash and the .mk file was referencing non-existing files.
This caused the build to fail. I've made both files point to the
correct file names.

Signed-off-by: Frederik Aalund <fpa@sbtaqua.com>
---
 package/libfastjson/libfastjson.hash | 2 +-
 package/libfastjson/libfastjson.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 8531dac..7089c3d 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f  libfastjson-v0.99.2.tar.gz
+sha256  fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f  v0.99.2.tar.gz
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index ec5390c..80e389f 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = v0.99.2
+LIBFASTJSON_VERSION = 0.99.2
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
+LIBFASTJSON_SOURCE = v$(LIBFASTJSON_VERSION).tar.gz
 LIBFASTJSON_INSTALL_STAGING = YES
 # From git
 LIBFASTJSON_AUTORECONF = YES
-- 
2.5.0
