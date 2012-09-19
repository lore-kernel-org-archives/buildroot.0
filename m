From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 18 Sep 2012 21:44:14 -0400
Subject: [Buildroot] rootfs hooks okay to use?
Message-ID: <CANxTyt7HEBtj+WUzAcwii7n9K3drUEz=34yMAOeN8FHOG2DqfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I tried adding something like this to one of our proprietary packages:

+define TEST_PRE_GEN_HOOK_FIXUP
+ echo "This is a test hook"
+endef
+
+ROOTFS_CRAMFS_PRE_GEN_HOOKS    += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_CLOOP_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_EXT2_PRE_GEN_HOOKS      += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_JFFS2_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_UBIFS_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_SQUASHFS_PRE_GEN_HOOKS  += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_TAR_PRE_GEN_HOOKS       += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_CPIO_PRE_GEN_HOOKS      += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_ISO9660_PRE_GEN_HOOKS   += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_INITRAMFS_PRE_GEN_HOOKS += TEST_PRE_GEN_HOOK_FIXUP
+ROOTFS_ROMFS_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP

But when I run make, I get:

fs/cpio/cpio.mk:32: *** missing separator (did you mean TAB instead of 8
spaces?).  Stop.
make: *** [all] Error 2

So - are the rootfs hooks okay for general use, or are they reserved
strictly for fs/*/*.mk use?

Thanks again,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120918/62815c5c/attachment.html>
