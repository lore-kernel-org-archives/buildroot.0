From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 23:38:59 +0100
Subject: [Buildroot] [PATCH 1/1] board: add support for Banana Pro
In-Reply-To: <20170113185424.7031-1-joerg.krause@embedded.rocks>
References: <20170113185424.7031-1-joerg.krause@embedded.rocks>
Message-ID: <20170305233859.0885f887@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Jan 2017 19:54:24 +0100, J?rg Krause wrote:
> The board support package includes the following components:
>  - U-Boot 2016.11
>  - Linux 4.9.3
>  - packages:
>    - resize2fs to expand the minimal rootfs

We're not doing this in other defconfigs, so I've removed this. Note
that the ext2 options allow you to request the filesystem to be larger
than the amount of files to store in it (but we also don't use that in
our defconfigs).

>  board/lemaker/bananapro/boot.cmd                   |  5 ++
>  board/lemaker/bananapro/genimage.cfg               | 37 ++++++++++
>  board/lemaker/bananapro/linux-wifi.fragment        | 23 ++++++
>  ...ts-sun7i-Enable-audio-codec-on-Banana-Pro.patch | 35 +++++++++
>  ...-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch | 85 ++++++++++++++++++++++
>  board/lemaker/bananapro/post-build.sh              | 12 +++
>  board/lemaker/bananapro/post-image.sh              | 16 ++++
>  board/lemaker/bananapro/readme.txt                 | 71 ++++++++++++++++++
>  .../lib/firmware/brcm/brcmfmac43362-sdio.txt       | 56 ++++++++++++++
>  configs/bananapro_defconfig                        | 80 ++++++++++++++++++++
>  10 files changed, 420 insertions(+)

You forgot to add yourself in the DEVELOPERS file, so I've added that.

>  create mode 100644 board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch
>  create mode 100644 board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch

Don't forget to send a follow-up patch when those are merged upstream,
and available in a stable kernel release :)


> +Resizing the roof filesystem
> +============================
> +
> +By default Buildroot creates a minimal root file system with very
> +little free space. You can expand the filesystem using the resize2fs
> +tool on the target:
> +
> +  # resize2fs /dev/mmcblk0p2

I've dropped this paragraph.

> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

I didn't see why C++ was needed, so I dropped it. wchar is indeed
needed for alsa.

> +# For expanding the root filesystem
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y

And I've dropped this.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
