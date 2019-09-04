From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Sep 2019 22:09:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/luv: use github helper
Message-ID: <20190904200903.5198-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use github helper to retrieve archive as the current one does not
contain libluv.pc.in which will break the build

Fixes:
 - http://autobuild.buildroot.org/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index c3a3062e1c..40a80bb0d8 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 420fc299f3b25aff55b839e9fe590982f45045b3e53ebeab2449eca7e23a106a  luv-1.30.1-0.tar.gz
+sha256 751b7d88b05f3d54a0be3ada37a1c7fda31b2ca2f00511bd1d2015db3cf93959  luv-1.30.1-0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 31288ffca3..fa5832546c 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUV_VERSION = 1.30.1-0
-LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
+LUV_SITE = $(call github,luvit,luv,$(LUV_VERSION))
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
 LUV_DEPENDENCIES = libuv
-- 
2.23.0.rc1
