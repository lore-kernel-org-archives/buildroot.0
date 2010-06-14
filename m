From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub/grub2: drop unnecessary
	dependency on uclibc
Message-ID: <20100614203439.2290B80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6b73b6548ffbed78b9979fe3b4f6f8848289749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk   |    2 +-
 boot/grub2/grub2.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 96b082d..74ea77f 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -96,7 +96,7 @@ ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 endif
 	touch $@
 
-grub: uclibc $(GRUB_DIR)/.installed
+grub: $(GRUB_DIR)/.installed
 
 grub-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_DIR) uninstall
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index a298ae6..06e1524 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -93,7 +93,7 @@ ifeq ($(BR2_TARGET_GRUB2_SPLASH),y)
 endif
 	touch $@
 
-grub2: uclibc $(GRUB2_DIR)/.installed
+grub2: $(GRUB2_DIR)/.installed
 
 grub2-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB2_DIR) uninstall
-- 
1.7.1
