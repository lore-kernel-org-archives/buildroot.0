From: Michele Bucca <michele.bucca@gmail.com>
Date: Wed, 6 Jun 2018 22:29:33 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
In-Reply-To: <20180606204952.58f73809@windsurf>
References: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
 <20180606204952.58f73809@windsurf>
Message-ID: <CAPa8UMezPR1Wuh43Pbt_RAVXFmRCCDRu=Yn1V4s-YpdE2fLA-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-06-06 20:49 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Wed, 6 Jun 2018 17:41:53 +0200, Michele Bucca wrote:
>
>> My host system is Debian Jessie 8.10 x86_64
>> I attach my .config file: what can I do to fix the iissue?
>
> Is this what you have after a complete rebuild ? Make sure you have the
> same error after doing "make clean; make".
>
> See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
> more details.
>

Yes, it shows the same error [1]. By the way here's  the output of a
clean build that I've made with the commands :

make clean
LC_ALL=C make

[1] https://pastebin.com/Z6vUVmRE

my config is the following:

BR2_x86_i686=y
BR2_KERNEL_HEADERS_4_15=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_PASSWD_SHA256=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_SETXKBMAP=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCALC=y
BR2_PACKAGE_XAPP_XCLIPBOARD=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XEDIT=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XINPUT=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
BR2_PACKAGE_XTERM=y
BR2_TARGET_ROOTFS_INITRAMFS=y
BR2_TARGET_ROOTFS_ISO9660=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SYSLINUX=y


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
