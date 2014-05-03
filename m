From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:05:30 +0200
Subject: [Buildroot] [git commit] boot/syslinux: install in a sub-dir of
	$(BINARIES_DIR)
Message-ID: <20140503200856.3DA729CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=230b1efb02505357053bfba1f91822bbaea4e470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since syslinux can now install quite a number of files, install
them in a sub-directory of $(BINARIES_DIR) for clarity.

It also aligns it to rpi-firmware, grub2, gummiboot, that install
all of their files in a sub-dir of $(BINARIES_DIR), too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index c46c7b2..51b6417 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -70,11 +70,11 @@ SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
 # scattered around everywhere in the build tree.
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
 
