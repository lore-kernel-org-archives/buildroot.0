From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 21:37:05 +0200
Subject: [Buildroot] [PATCH 1/2] x264: fix typo in variable name
Message-ID: <1412797026-16602-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/d37/d37856be02bdff5711fc5d6fb1f3d4614fe5fed3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index c2397f8..ccf8e2b 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -13,7 +13,7 @@ X264_LICENSE_FILES = COPYING
 X264_INSTALL_STAGING = YES
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-	FFMPEG_DEPENDENCIES += host-yasm
+	X264_DEPENDENCIES += host-yasm
 else
 	X264_CONF_OPTS += --disable-asm
 endif
-- 
2.0.0
