From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Jan 2012 21:19:29 +0100
Subject: [Buildroot] [PATCH v2] syslinux: add support for host-install
In-Reply-To: <87ipk3h03c.fsf@macbook.be.48ers.dk>
References: <87ipk3h03c.fsf@macbook.be.48ers.dk>
Message-ID: <1327349969-24852-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

This makes it possible to build the syslinux/extlinux installer, so a
bootable USB drive, CompactFlash or SD card can be created by a user
script.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: more verbose commit message
---
 boot/syslinux/syslinux.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index da30d5a..3e89bdf 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -26,4 +26,18 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
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
 $(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
-- 
1.7.8.3
