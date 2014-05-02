From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:38 +0200
Subject: [Buildroot] [PATCH 12/12] boot/syslinux: install in a sub-dir of
	$(BINARIES_DIR)
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <fd8cb5b156e73680f07c222dca6a812e47ec8e3c.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since syslinux can now install quite a number of files, install
them in a sub-directory of $(BINARIES_DIR) for clarity.

It also aligns it to rpi-firmware, grub2, gummiboot, that install
all of their files in a sub-dir of $(BINARIES_DIR), too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 boot/syslinux/syslinux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index e627f48..c9ad2a8 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -70,11 +70,11 @@ SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
 # everywhere in the build tree.
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
-		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/$${i##*/}; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
 	for i in $(SYSLINUX_C32); do \
 		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
-				   $(BINARIES_DIR)/$${i}; \
+				   $(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
 
-- 
1.8.3.2
