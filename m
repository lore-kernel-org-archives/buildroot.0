From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] syslinux: depends on host-nasm
Message-ID: <20100614203441.1D6D8804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5fe862e61e705590d49f479f2d15ac167228bae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
