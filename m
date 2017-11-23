From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 23 Nov 2017 10:38:40 +0100
Subject: [Buildroot] [PATCH] package/directfb: fixes detection of tslib
 version during configure
In-Reply-To: <20171122215048.6a54cf98@windsurf.lan>
References: <1511110605-18646-1-git-send-email-julien.boibessot@free.fr>
 <20171122215048.6a54cf98@windsurf.lan>
Message-ID: <09a07d01-4010-1553-d9ba-0f8f88b10e94@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thomas,

On 22/11/2017 21:50, Thomas Petazzoni wrote:
> Hello,
>
> On Sun, 19 Nov 2017 17:56:45 +0100, julien.boibessot at free.fr wrote:
>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> What problem is this fixing? Is there an autobuilder failure related to
> this? If not, could you include a failing defconfig in the commit log,
> as well as the relevant part of the build log showing the failure?

As said in the commit log, directfb fails to detect tslib at configure
stage. There is no autobuilder failure as it doesn't cause a build
failure, only a runtime problem when trying to use directfb with tslib:
it just doesn't work.

>
> A small explanation would also be nice. Why is DirectFB checking for
> tslib-1.0 if it's named tslib? Mistake? Different version of tslib?

I don't know why directfb is checking for package name "tslib-1.0" but
in Buildroot's pkg-config, package is named "tslib". So at configure
time directfb doesn't find tslib in pkg-config list, and choose to not
compile tslib support.

Please find attached a sample defconfig showing the problem. My patch
was runtime tested on ARM9.

Best regards,
Julien


-------------- next part --------------
BR2_arm=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="apf28"
BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.62"
BR2_LINUX_KERNEL_DEFCONFIG="mxs"
BR2_LINUX_KERNEL_UIMAGE=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-apf28dev"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DIRECTFB=y
# BR2_PACKAGE_DIRECTFB_LINUXINPUT is not set
# BR2_PACKAGE_DIRECTFB_SERIALMOUSE is not set
BR2_PACKAGE_DIRECTFB_EXAMPLES=y
BR2_PACKAGE_SDL2=y
BR2_PACKAGE_SDL2_DIRECTFB=y
BR2_PACKAGE_SDL2_GFX=y
BR2_PACKAGE_SDL2_IMAGE=y
BR2_PACKAGE_SDL2_MIXER=y
BR2_PACKAGE_SDL2_NET=y
BR2_PACKAGE_SDL2_TTF=y
BR2_PACKAGE_LUAJIT=y
BR2_PACKAGE_LIBMODPLUG=y
BR2_PACKAGE_LIBVORBIS=y
BR2_PACKAGE_OPENAL=y
BR2_PACKAGE_PHYSFS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_LRZSZ=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=4227
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
