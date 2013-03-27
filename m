From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Wed, 27 Mar 2013 23:01:15 +0000
Subject: [Buildroot] [PATCH] Install DTB as part of images install command
Message-ID: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Reuben Dowle <reuben.dowle@4rf.com>

When installing DTB to the images directory, do this as part of the image
install commands rather than the target install commands.

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com.az>
---
 linux/linux.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8a73767..f0d793b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -261,11 +261,11 @@ endef

 define LINUX_INSTALL_IMAGES_CMDS
        cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+       $(LINUX_INSTALL_DTB)
 endef

 define LINUX_INSTALL_TARGET_CMDS
        $(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
-       $(LINUX_INSTALL_DTB)
        # Install modules and remove symbolic links pointing to build
        # directories, not relevant on the target
        @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
--
1.7.10.4

The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
