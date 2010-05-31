From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:16 +0200
Subject: [Buildroot] [PATCH 30/46] syslinux: depends on host-nasm
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <de4fdd99f77edcc954dbda2ed26e8b567862665c.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 966d0c2..192e905 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -31,8 +31,8 @@ $(BINARIES_DIR)/isolinux.bin: $(SYSLINUX_DIR)/.compiled
 $(BINARIES_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/.compiled
 	cp -a $(SYSLINUX_DIR)/core/pxelinux.bin $@
 
-syslinux: $(BINARIES_DIR)/isolinux.bin
-pxelinux: $(BINARIES_DIR)/pxelinux.bin
+syslinux: host-nasm $(BINARIES_DIR)/isolinux.bin
+pxelinux: host-nasm $(BINARIES_DIR)/pxelinux.bin
 
 pxelinux-clean syslinux-clean:
 	rm -f $(BINARIES_DIR)/isolinux.bin $(BINARIES_DIR)/pxelinux.bin
-- 
1.7.0.4
