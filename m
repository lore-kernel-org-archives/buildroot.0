From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 31 Aug 2011 08:06:53 +0200
Subject: [Buildroot] [PATCH v2 2/2] syslinux: add support for host-install
In-Reply-To: <1314770813-12307-1-git-send-email-arnout@mind.be>
References: <1314770813-12307-1-git-send-email-arnout@mind.be>
Message-ID: <1314770813-12307-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/syslinux/syslinux.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 118807a..2b4b5c0 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -34,4 +34,19 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
+
+HOST_SYSLINUX_POST_EXTRACT_HOOKS += SYSLINUX_RM_MK_LBA_IMG
+
+define HOST_SYSLINUX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_SYSLINUX_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
+endef
+
+define HOST_SYSLINUX_CLEAN_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
 $(eval $(call GENTARGETS,boot,syslinux))
-- 
1.7.5.4
