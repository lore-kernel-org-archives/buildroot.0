From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Oct 2014 14:34:08 +0200
Subject: [Buildroot] [PATCH 0/2] New image target (x86/x64): raw disk image
Message-ID: <1413549250-2753-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These 2 patches allow the building of a new image for x86 and x64.
The "raw" image is a disk image, with a valid partition table and
MBR, that can directly written to a disk and will boot, or the file
is bootable in QEMU. Also cloud providers who use KVM (like Google)
should accept this as their VM image format.

Karoly Kasza (2):
  util-linux: option to enable fdisk for host build
  fs/rawimage: new rootfs image

 fs/Config.in                                       |    1 +
 fs/rawimg/Config.in                                |   17 ++++++++++
 fs/rawimg/genrawimg.sh                             |   35 ++++++++++++++++++++
 fs/rawimg/rawimg.mk                                |   13 ++++++++
 package/util-linux/Config.in.host                  |    9 +++++
 .../util-linux/util-linux-004-enable-fdisk.patch   |   34 +++++++++++++++++++
 package/util-linux/util-linux.mk                   |    5 +++
 7 files changed, 114 insertions(+)
 create mode 100644 fs/rawimg/Config.in
 create mode 100755 fs/rawimg/genrawimg.sh
 create mode 100644 fs/rawimg/rawimg.mk
 create mode 100644 package/util-linux/util-linux-004-enable-fdisk.patch

-- 
1.7.10.4
