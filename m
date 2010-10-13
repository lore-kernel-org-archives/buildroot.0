From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 12 Oct 2010 23:53:47 -0500
Subject: [Buildroot] mkfs.jffs2 image is not usable
Message-ID: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

With the latest git of buildroot I have been unable to create a rootfs.jffs2
image that is usable on my i.mx35 arm platform.  But, the same $(TARGET_DIR)
created as a cpio image is usable when mounted as a nfs based rootfs.

When I try using the jffs2 image I get error messages during the kernel boot
like:

jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x813c6fd8 (calculated 0xe41eb0b1)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x6fd8 instead
jffs2_scan_eraseblock(): Node at 0x0000000c {0x1985, 0xe001, 0x0000002b) has invalid CRC 0x1804b18f (calculated 0x7d266ee6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 0x002b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0xb18f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x1a8d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: 0x0403 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x00000078
You cannot use older JFFS2 filesystems with newer kernels
Empty flash at 0x0000a46c ends at 0x0000a470

I have an older jffs2 image that works fine but I'm not sure when I created
it and what might have changed in buildroot.

I'm using the same steps in RedBoot to program the images so the problem is
not in the writing of the image to flash.

I have also tried manually creating the jffs2 image using mkfs.jffs2 from
${HOST_DIR)/usr/sbin.  That image give me error messages similar to the
ones above.  Interestingly, the two image files differ in size slightly.

I also tried installing the mtd utils locally on my Debian system and then
created the jffs2 image using /usr/sbin/mkfs.jffs2.  This image is the
same size as the one manually created using the $(HOST_DIR) one, but the
files are very different.  When I boot with that image I don't get any
error messages by the kernel boot hangs after:

Freeing init memory: 208K

Can anyone offer some ideas of suggestions?

Thanks,
Hartley
