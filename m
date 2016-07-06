From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jul 2016 16:03:18 +0000
Subject: [Buildroot] [Bug 9086] Syntax Error (missing ")" in
 boot/uboot/uboot.mk on line 203)
In-Reply-To: <bug-9086-163@https.bugs.busybox.net/>
References: <bug-9086-163@https.bugs.busybox.net/>
Message-ID: <bug-9086-163-L0lwS2mFBb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9086

--- Comment #2 from Jebodiah Sensai <dkaplan65@gmail.com> ---
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 065bdf9..7c3512a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -203,7 +203,7 @@ ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
 define UBOOT_GENERATE_ZYNQ_IMAGE
        $(HOST_DIR)/usr/bin/python2 \
                $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
-               -u $(@D)/$(firstword $(call
qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) \
+               -u $(@D)/$(firstword $(call
qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
                -o $(BINARIES_DIR)/BOOT.BIN
 endef
 UBOOT_DEPENDENCIES += host-zynq-boot-bin

-- 
You are receiving this mail because:
You are on the CC list for the bug.
