From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:56:31 +0100
Subject: [Buildroot] [PATCH 0/9] iso9660/grub improvements
Message-ID: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of commits that improves the iso9660/grub handling:

 * Ensures that grub is built with the iso9660 support when the
   iso9660 image format has been selected.

 * Add splashscreen support to Grub for the iso9660 image mechanism.

 * Do not include the initrd into the filesystem if it is built into
   the kernel image itself.

 * Related improvements/fixes

Thanks!

Thomas

Thierry Bultel (1):
  fs/iso9660: do not use an initrd in iso image when using initramfs

Thomas Petazzoni (8):
  fs/iso9660: put the Buildroot boot entry first in Grub menu.lst
  grub: enclose network driver options in a sub-menu
  grub: replace string option for filesystem selection by booleans
  fs/iso9660: select ISO9660 support in Grub
  linux: enable initrd/initramfs support when cpio rootfs is chosen
  grub: really disable splash screen support
  fs/iso9660: add Grub splashscreen support
  grub: align splashscreen handling with iso9660 code

 boot/grub/Config.in   | 48 ++++++++++++++++++++++++++++++++++++++++--------
 boot/grub/grub.mk     | 32 +++++++++++++++++++-------------
 boot/grub/menu.lst    | 11 +++++++----
 fs/iso9660/Config.in  |  1 +
 fs/iso9660/iso9660.mk |  9 +++++++++
 fs/iso9660/menu.lst   | 13 ++++++++-----
 linux/linux.mk        |  3 ++-
 7 files changed, 86 insertions(+), 31 deletions(-)

-- 
1.8.3.2
