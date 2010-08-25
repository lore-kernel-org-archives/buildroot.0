From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] imagemagick: don't create
	useless debugging file
Message-ID: <20100825153144.6297089016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=30887f616a11e74b786677a66226d3a5d47d8f8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the imagemagick Buildroot .mk file creates a
"datefile" file in the Buildroot source directory, probably an ancient
debugging thing that has been left here for no reason. Let's get rid
of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 00895f5..9eb9d69 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -88,7 +88,6 @@ $(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
 	touch $@
 
 $(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
-	ls -l $(IMAGEMAGICK_LIB) >> datefile
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/animate
 	touch $@
-- 
1.7.1
