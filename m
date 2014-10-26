From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:05:18 +0100
Subject: [Buildroot] [git commit] package/libuci: cleanup configure options
Message-ID: <20141026160700.3D090B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6436a6cdf1eb9ec7819a9b14c2705a7b7baf5b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove unneeded type in configure option's definition.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 9d5c172..12e07fc 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -15,7 +15,7 @@ LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-LIBUCI_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
+LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
 
 $(eval $(cmake-package))
