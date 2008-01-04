From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 4 Jan 2008 14:45:54 +0100
Subject: [Buildroot] [PATCH] Create /boot/uImage symlink to the
	currentkernel image
References: <d6cda7730801031650i439f5821h566eeef460615172@mail.gmail.com>
Message-ID: <028e01c85141$ba1d0fd0$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



| Hi,
| 
|   A while ago, the kernel naming have been changed to include $(DATE)
| which makes it annoying to keep track. This patch adds an option to
| the Advanced Kernel option to create an /boot/uImage symbolic link to
| the built kernel. Please consider applying, this really improves
| usability, if this naming scheme is to be kept.
| 
| Kind Regards,
|    Thiago A. Correa
|

Looking at your patch, I see that we are talking about two different things.
There is a feature to copy the linux kernel to /tftpboot directory,
which I thought you were referring to, but If you want the kernel inside
the root file system, then would it not make more sense to do:

-  cp -dpf $(LINUX26_KERNEL) $(TARGET_DIR)/boot/$(LINUX26_KERNEL_NAME)
+  cp -dpf $(LINUX26_KERNEL) $(TARGET_DIR)/boot/$(BR2_PACKAGE_LINUX_FORMAT)

where BR2_PACKAGE_LINUX_FORMAT could be
uImage, bzImage, vmlinux etc.

Best Regards
Ulf Samuelsson
