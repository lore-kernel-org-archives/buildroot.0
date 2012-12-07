From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  7 Dec 2012 14:32:30 +0100
Subject: [Buildroot] [PATCH] iproute2: implement IPROUTE2_CLEAN_CMDS
Message-ID: <1354887150-30038-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since IPROUTE2_CLEAN_CMDS was missing, make iproute2-clean did
not call "make clean" for iproute2.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/iproute2/iproute2.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6f5ee51..da5d7a0 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -45,6 +45,10 @@ define IPROUTE2_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
+define IPROUTE2_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
 define IPROUTE2_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" SBINDIR=/sbin \
 		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
-- 
1.7.0.4
