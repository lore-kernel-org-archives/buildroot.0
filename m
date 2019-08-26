From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 26 Aug 2019 22:49:17 +0200
Subject: [Buildroot] [PATCH 0/1] board/mender: add a mender board
 example configuration.
In-Reply-To: <20190826203619.71720-1-aduskett@gmail.com>
References: <20190826203619.71720-1-aduskett@gmail.com>
Message-ID: <72f36376-dda6-3dde-d0f6-9367fe063a35@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam

Le 26/08/2019 ? 22:36, aduskett at gmail.com a ?crit?:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Buildroot currently has all of the needed packages to use Mender as the primary
> update system. However; there isn't any documentation or examples now that
> provide a starting point for users. This lack of documentation makes setting up
> a Mender based update system difficult and time-consuming.

just FYI, there is a section for Buildroot integrations on Mender hub :)
Maybe we can also provide this link somewhere ?

Thanks !

Pierre-Jean

> 
> Provided in this patch series is a mender_x86_64_efi_defconfig -that sets up an
> x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
> QEMU environment. The system partition exchema comprises of two equally sized
> root partitions and a 64M data partition that is mounted to /var/lib/mender as
> a persistent data store partition.
> 
> There is a board/mender/readme.txt provided which gives users documentation on
> how to flash the built image or boot the image using QEMU as well.
> 
> In the future, I want to also provide a raspberrypi example for Uboot users, and
> possibly a orangepi and an IMX6 example as well.
>
> Thanks!
> 
> Adam
> 
> Adam Duskett (1):
>    board/mender: add a mender board example configuration.
> 
>   .gitlab-ci.yml                              |  1 +
>   DEVELOPERS                                  |  1 +
>   board/mender/linux.config                   | 64 ++++++++++++++++
>   board/mender/mender_grubenv_defines         | 32 ++++++++
>   board/mender/overlay/etc/fstab              | 10 +++
>   board/mender/overlay/etc/mender/mender.conf | 10 +++
>   board/mender/post-image-efi-gpt.sh          | 83 +++++++++++++++++++++
>   board/mender/pre-image.sh                   |  9 +++
>   board/mender/readme.txt                     | 58 ++++++++++++++
>   configs/mender_x86_64_efi_defconfig         | 73 ++++++++++++++++++
>   10 files changed, 341 insertions(+)
>   create mode 100644 board/mender/linux.config
>   create mode 100644 board/mender/mender_grubenv_defines
>   create mode 100644 board/mender/overlay/etc/fstab
>   create mode 100644 board/mender/overlay/etc/mender/mender.conf
>   create mode 100755 board/mender/post-image-efi-gpt.sh
>   create mode 100755 board/mender/pre-image.sh
>   create mode 100644 board/mender/readme.txt
>   create mode 100644 configs/mender_x86_64_efi_defconfig
> 

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
