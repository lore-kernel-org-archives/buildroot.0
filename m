From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  8 Jan 2013 09:47:25 +0100
Subject: [Buildroot] [PATCH] linux: fix handle new dtb location since
	3.8-rc1 for appended dtbs
Message-ID: <1357634845-16507-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove a duplicated line to fix the following error:

linux/linux.mk:205: *** missing `endef', unterminated `define'.  Stop.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ec9cd2..fe5f738 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,7 +203,6 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 define LINUX_APPEND_DTB
-define LINUX_APPEND_DTB
 	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
 		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
-- 
1.8.0.3
