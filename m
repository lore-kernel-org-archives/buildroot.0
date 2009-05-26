From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 26 May 2009 14:44:16 -0400
Subject: [Buildroot] busybox.mk
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901862B06@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Commit a7ed91a957000fc16fd85720c70fb2e4561e1433 modified
busybox.mk as follows:

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fcec41a..4f1d038 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -92,7 +92,7 @@ endif


 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
-       $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+q      $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
                CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
                ARCH=$(KERNEL_ARCH) \
                EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)

Is the 'q' a typo?  If not what does it do?

Thanks,
Hartley
