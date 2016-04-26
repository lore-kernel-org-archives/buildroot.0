From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 26 Apr 2016 17:09:50 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <878u00o2oi.fsf@dell.be.48ers.dk>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

The following models have been checked on a custom buildroot branch of mine
(with a few changes), but it's based on the Latest stable release of
buildroot: 2016.02 and before executing a defconfig I executed a make clean

I've changed:
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

And these are the results:

i) Raspberry pi 1 B v2.1 (code: 000e): compile ok but it doesn't work. This
is my defconfig:
BR2_arm=y
BR2_arm1176jzf_s=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="tedpi"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot 2016.02"
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="tedpi"
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/tedpi-1b/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(TOPDIR)/board/tedpi-1b/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_BUSYBOX_WATCHDOG=y
BR2_PACKAGE_WIRINGPI=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_LIBRAW1394=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

ii) Raspberry pi 2 B v1.1 (code: a01041): compile ok but it doesn't work.
This is my defconfig:
BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="tedpi"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot 2016.02 "
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="tedpi"
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/tedpi-2b/post-build-flea3.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(TOPDIR)/board/tedpi-2b/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_BUSYBOX_WATCHDOG=y
BR2_PACKAGE_WIRINGPI=y
BR2_PACKAGE_FLYCAPTURE2_ARM_LIB=y
BR2_PACKAGE_FLYCAPTURE_ENABLE_PASSWORD=y
BR2_PACKAGE_FLYCAPTURE2_ARM_SNAPSHOT=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

iii) Raspberry pi 3 B v1.1 (code: a02082): compile and works fine (with the
overlay: pi3-disable-bt-overlay.dtb to access to the /dev/ttyAMA0 terminal)

Probably you can see something odd in my defconfig files...


Best regards

[image: photo] ?scar G?mez Fuente
Electronic Engineer & Degree in Physical Sciences
Mobile: 659.28.97.90
Email: oscargomezf at gmail.com
Website: www.oscargomezf.com
<http://facebook.com/oscargomezf>  <http://plus.google.com/oscargomezf>
<http://us.linkedin.com/in/oscargomezf>
<http://twitter.com/oscargomezf_com>

On 26 April 2016 at 16:38, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi Peter,
>  > I've tried to compile the repo version:
>  >
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
>
>  > with:
>  > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>
>  > For rpi/rpi2 and it doesn't work. The compiling is right but it doesn't
>  > work, I can see the message on /dev/ttyAMA0 terminal:
>
>  > Uncompressing Linux... done, booting the kernel.
>
>  > But it's stuck at this point, however in RPi3 works fine.
>
> So you are saying that the current raspberrypi_defconfig /
> raspberrypi2_defconfig doesn't boot on your rpi1 / rpi2 boards? That's
> odd as I verified raspberrypi_defconfig on my rpi1 (very old B version)
> the other day without problems.
>
> Are you sure you did a clean build of everything?
>
> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160426/b58b8fae/attachment.html>
