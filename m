From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:05:25 +0100
Subject: [Buildroot] [git commit] package/libuci: cleanup configure options
Message-ID: <20141026160700.4577DB0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69ea2958c2273e450cd2298762a822c47452d863
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make BUILD_LUA assignation symetrical.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 12e07fc..a78048d 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -12,7 +12,8 @@ LIBUCI_DEPENDENCIES = libubox
 
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
-LIBUCI_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
+	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
