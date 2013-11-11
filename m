From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:31 +0100
Subject: [Buildroot] [PATCH 07/15] grub: install the sample menu.lst into
	$(TARGET_DIR)/boot/grub
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk | 1 +
 1 file changed, 1 insertion(+)

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
 
-- 
1.8.1.2
