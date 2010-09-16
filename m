From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] jpeg: convert old-style hooks
	to new-style hooks
Message-ID: <20100916113823.BCBF58AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0f5fae2a69b399a81bbef3d8467468f466f2c0ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/jpeg.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index c3754d4..9a4512c 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -29,8 +29,10 @@ JPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 JPEG_LIBTOOL_PATCH = NO
 JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
-$(eval $(call AUTOTARGETS,package,jpeg))
-
-$(JPEG_HOOK_POST_INSTALL):
+define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-	touch $@
+endef
+
+JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
+
+$(eval $(call AUTOTARGETS,package,jpeg))
-- 
1.7.1
