From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 17:39:43 +0200
Subject: [Buildroot] [git commit] Install DTB as part of images install
	command
Message-ID: <20130801155755.E8FA999C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=235535405cd076b31eb9d355a0e00ba663eca705
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installing DTB to the images directory, do this as part of the image
install commands rather than the target install commands.

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com.az>
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index fc379ec..578d535 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -265,11 +265,11 @@ endef
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	$(LINUX_INSTALL_DTB)
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
-	$(LINUX_INSTALL_DTB)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
