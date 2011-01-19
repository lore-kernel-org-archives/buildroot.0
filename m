From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jan 2011 22:52:30 +0100
Subject: [Buildroot] [git commit master 1/1] portmap: fix clean target to
	actually clean
Message-ID: <20110119215340.ACCD98B4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58b34e6a60ce101f2651772793b8c4d8bed24879
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portmap/portmap.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index bebafce..e996824 100644
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
1.7.3.4
