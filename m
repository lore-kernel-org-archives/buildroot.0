From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:44:04 +0100
Subject: [Buildroot] [git commit] grub: install the sample menu.lst into
	$(TARGET_DIR)/boot/grub
Message-ID: <20131201225017.2D2179BE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bba9eb1ea4739c9b3db3a4ee24fe1e754ddcc70c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/grub.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 229b1a4..0c2c035 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -80,6 +80,7 @@ define GRUB_INSTALL_TARGET_CMDS
 	cp $(@D)/stage1/stage1 $(TARGET_DIR)/boot/grub
 	cp $(@D)/stage2/*1_5   $(TARGET_DIR)/boot/grub
 	cp $(@D)/stage2/stage2 $(TARGET_DIR)/boot/grub
+	cp boot/grub/menu.lst $(TARGET_DIR)/boot/grub
 	$(GRUB_INSTALL_SPLASH)
 endef
 
