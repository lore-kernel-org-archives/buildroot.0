From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:04:59 +0100
Subject: [Buildroot] [git commit] package/libubox: cleanup configure options
Message-ID: <20141026160700.2C792B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ddebe481981b4afb93534abe3e47a3d85138fd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove unneeded type in configure option's definition.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/libubox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index e6d95b7..572cfe9 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -15,7 +15,7 @@ LIBUBOX_DEPENDENCIES += lua
 LIBUBOX_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-LIBUBOX_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
+LIBUBOX_CONF_OPTS += -DBUILD_LUA=OFF
 endif
 
 $(eval $(cmake-package))
