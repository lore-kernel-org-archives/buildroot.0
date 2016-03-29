From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Mar 2016 22:30:38 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/freerdp: bump version"
Message-ID: <1459283439-30933-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit dda26dc614b6f5ef9be67d2604bac39235322235.

Instead of bumping freerdp to a version which breaks gstreamer
detection we revert the latest bump for now.

Fixes
http://autobuild.buildroot.net/results/1ab/1abc713a58d21c71678aab9b21ac1cfac23684f5/
http://autobuild.buildroot.net/results/0ef/0efd39115a631c409eb809b38ab64604d1de99ca/
http://autobuild.buildroot.net/results/7aa/7aac3f970dd1fbc0d25f268f32844bec7e49f4af/
http://autobuild.buildroot.net/results/396/396401bd6eb5f95364a32456a274da185e081541/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a795ed3..e8e5be4 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the master branch
-FREERDP_VERSION = 2ac195e8eb2c5fbbe8f2abeac92b0c8effef0e34
+FREERDP_VERSION = 17834af7bb378f85a3b3cc4dcadaa5125a337e16
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.8.0.rc3
