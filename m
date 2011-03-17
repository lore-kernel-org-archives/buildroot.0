From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Thu, 17 Mar 2011 13:21:42 +0100
Subject: [Buildroot] [PATCH] imagemagick: disable openmp support
Message-ID: <1300364502-7353-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/imagemagick/imagemagick.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7955db7..ab59323 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -28,7 +28,8 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-dps \
 		--without-gslib \
 		--without-fpx \
-		--without-x
+		--without-x \
+		--disable-openmp
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPT += --with-fontconfig
-- 
1.7.0.4
