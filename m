From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:15:40 +0200
Subject: [Buildroot] [git commit] docs/manual/beyond-buildroot: building and
	testing live-CDs
Message-ID: <20150710171600.F3BDA8190F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=618346836ede2f6945899209744aafbd38a84c82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: reworked a bit the phrasing, plus mention that Grub 2 is
supported.]

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/beyond-buildroot.txt |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index b8b1973..63b0c1f 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -21,6 +21,35 @@ Remember to add this path to +/etc/exports+.
 
 Then, you can execute a NFS-boot from your target.
 
+==== Live CD
+
+To build a live CD image, enable the _iso image_ option in the
+_Filesystem images_ menu. Note that this option is only available on
+the x86 and x86-64 architectures, and if you are building your kernel
+with Buildroot.
+
+You can build a live CD image with either IsoLinux, Grub or Grub 2 as
+a bootloader, but only Isolinux supports making this image usable both
+as a live CD and live USB (through the _Build hybrid image_ option).
+
+You can test your live CD image using QEMU:
+
+-------------------
+qemu-system-i386 -cdrom output/images/rootfs.iso9660
+-------------------
+
+Or use it as a hard-drive image if it is an hybrid ISO:
+
+-------------------
+qemu-system-i386 -hda output/images/rootfs.iso9660
+-------------------
+
+It can be easily flashed to an USB drive with +dd+:
+
+-------------------
+dd if=output/images/rootfs.iso9660 of=/dev/sdb
+-------------------
+
 === Chroot
 
 If you want to chroot in a generated image, then there are few thing
