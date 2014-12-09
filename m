From: Karoly Kasza <kaszak@gmail.com>
Date: Tue,  9 Dec 2014 17:03:24 +0100
Subject: [Buildroot] [PATCH v2 0/3] New image target (x86/x64): raw disk
	image
Message-ID: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

These 3 patches allow the building of a new target for x86 and x64.
The "raw" image is a disk image, with a valid partition table and
MBR, that can directly written to a disk and will boot, or the file
is bootable in QEMU. Also cloud providers who use KVM (like Google)
should accept this as their VM image format.

Regards,
Karoly

Changes v1 -> v2:
  - package/util-linux: minimal wording
  - fs/rawimg: separated script into new host package like mke2img
  - package/mkrawimg: new host package

Karoly Kasza (3):
  util-linux: enable host fdisk
  package/mkrawimg: new package
  fs/rawimg: new rootfs target

 fs/Config.in                                       |    1 +
 fs/rawimg/Config.in                                |   15 ++++++++
 fs/rawimg/rawimg.mk                                |   13 +++++++
 package/Config.in.host                             |    1 +
 package/mkrawimg/Config.in.host                    |   13 +++++++
 package/mkrawimg/mkrawimg                          |   38 ++++++++++++++++++++
 package/mkrawimg/mkrawimg.mk                       |   14 ++++++++
 package/util-linux/Config.in.host                  |    9 +++++
 .../util-linux/util-linux-004-enable-fdisk.patch   |   34 ++++++++++++++++++
 package/util-linux/util-linux.mk                   |    5 +++
 10 files changed, 143 insertions(+)
 create mode 100644 fs/rawimg/Config.in
 create mode 100644 fs/rawimg/rawimg.mk
 create mode 100644 package/mkrawimg/Config.in.host
 create mode 100755 package/mkrawimg/mkrawimg
 create mode 100644 package/mkrawimg/mkrawimg.mk
 create mode 100644 package/util-linux/util-linux-004-enable-fdisk.patch

-- 
1.7.10.4
