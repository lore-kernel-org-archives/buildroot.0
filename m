From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:59 +0200
Subject: [Buildroot] [PATCH 13/74] jpeg: convert old-style hooks to
	new-style hooks
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0f5fae2a69b399a81bbef3d8467468f466f2c0ef.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
