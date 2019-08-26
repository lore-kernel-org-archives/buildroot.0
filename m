From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 26 Aug 2019 13:36:18 -0700
Subject: [Buildroot] [PATCH 0/1] board/mender: add a mender board example
 configuration.
Message-ID: <20190826203619.71720-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Buildroot currently has all of the needed packages to use Mender as the primary
update system. However; there isn't any documentation or examples now that
provide a starting point for users. This lack of documentation makes setting up
a Mender based update system difficult and time-consuming.

Provided in this patch series is a mender_x86_64_efi_defconfig -that sets up an
x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
QEMU environment. The system partition exchema comprises of two equally sized
root partitions and a 64M data partition that is mounted to /var/lib/mender as
a persistent data store partition.

There is a board/mender/readme.txt provided which gives users documentation on
how to flash the built image or boot the image using QEMU as well.

In the future, I want to also provide a raspberrypi example for Uboot users, and
possibly a orangepi and an IMX6 example as well.

Thanks!

Adam

Adam Duskett (1):
  board/mender: add a mender board example configuration.

 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 board/mender/linux.config                   | 64 ++++++++++++++++
 board/mender/mender_grubenv_defines         | 32 ++++++++
 board/mender/overlay/etc/fstab              | 10 +++
 board/mender/overlay/etc/mender/mender.conf | 10 +++
 board/mender/post-image-efi-gpt.sh          | 83 +++++++++++++++++++++
 board/mender/pre-image.sh                   |  9 +++
 board/mender/readme.txt                     | 58 ++++++++++++++
 configs/mender_x86_64_efi_defconfig         | 73 ++++++++++++++++++
 10 files changed, 341 insertions(+)
 create mode 100644 board/mender/linux.config
 create mode 100644 board/mender/mender_grubenv_defines
 create mode 100644 board/mender/overlay/etc/fstab
 create mode 100644 board/mender/overlay/etc/mender/mender.conf
 create mode 100755 board/mender/post-image-efi-gpt.sh
 create mode 100755 board/mender/pre-image.sh
 create mode 100644 board/mender/readme.txt
 create mode 100644 configs/mender_x86_64_efi_defconfig

-- 
2.21.0
