From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 03:19:59 -0500
Subject: [Buildroot] [PATCH] portmap: fix clean target to actually clean
Message-ID: <1290241199-23761-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/portmap/portmap.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index d245bbe..5813362 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -19,6 +19,10 @@ define PORTMAP_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
+define PORTMAP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
 		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
-- 
1.7.3.2
