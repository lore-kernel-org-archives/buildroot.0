From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 25 Sep 2019 18:52:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix static build with
 readline
Message-ID: <20190925165248.6067-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b1a1392636467f8c07504fa6cfb17962764820ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ytree/ytree.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 2d2a6946f7..824ace7155 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -14,9 +14,9 @@ YTREE_CFLAGS = -DCOLOR_SUPPORT $(TARGET_CFLAGS)
 YTREE_LDFLAGS = -lncurses $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-YTREE_DEPENDENCIES += readline
+YTREE_DEPENDENCIES += host-pkgconf readline
 YTREE_CFLAGS += -DREADLINE_SUPPORT
-YTREE_LDFLAGS += -lreadline
+YTREE_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs readline`
 endif
 
 define YTREE_BUILD_CMDS
-- 
2.23.0
