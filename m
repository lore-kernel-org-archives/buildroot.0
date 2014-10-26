From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:05:09 +0100
Subject: [Buildroot] [git commit] package/libubox: cleanup configure options
Message-ID: <20141026160700.34C6BB0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9a7bcc720a6c695495f12b60821d011501719ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make BUILD_LUA assignation symetrical.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/libubox.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 572cfe9..5d9c01d 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -12,7 +12,8 @@ LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
-LIBUBOX_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUBOX_CONF_OPTS += -DBUILD_LUA=ON \
+	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUBOX_CONF_OPTS += -DBUILD_LUA=OFF
