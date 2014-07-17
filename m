From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 16:55:08 -0300
Subject: [Buildroot] [PATCH] linux: fix fallout from
	c78d57637cd57a383e44713eb27e654b3071340e
Message-ID: <1405626908-11988-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new variable LINUX_TARGET_NAME is unconditionally used but it may be
unset leading to a default kernel build (which might not be uImage or
other requested format).
See http://lists.busybox.net/pipermail/buildroot/2014-July/102069.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 928d93d..2a9bf3e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -106,7 +106,9 @@ LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 endif
+LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
 endif
+
 ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 endif
-- 
1.8.5.5
