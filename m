From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 10 Nov 2014 10:41:30 +0100
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
 <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
 <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
Message-ID: <1811944.2Ar3jhLuFu@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Saturday 08 November 2014 13:56:27 Gary Bisson wrote:
> On Fri, Nov 7, 2014 at 9:43 AM, Jeff Horn <outforaride@gmail.com> wrote:
[...]
> > >   - Xorg support for imx6 is not yet merged (and we are looking for
> > >     testers :-) )
> > 
> > I can help test. I have a couple different i.MX6 boards (Wand,
> > SabreSD). We are not using X11 on our board. We are using just Qt5
> > with the eglfs platform.
> 
> Jerome, could you point us the patchset as well as the configuration you
> would like people to test?
The patchset is called "Add Xorg support for imx6"[1]. I have tested it with:

    BR2_ARM_EABIHF= both tested
    BR2_ARM_ENABLE_NEON=y
    BR2_ARM_FPU_NEON=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
    BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
    BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_XCB=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XSERVER_XORG_SERVER=y
    BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
    BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
    BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
    BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES=y

You may also interested by series I posted to add Xorg support for iMX5[2]. 
Finally, you may also have an opinion about series called "Better handling of 
freescale self-extractible binaries"[3].

For my part, I have planned to test gst1-imx this week.

[1] http://marc.info/?l=buildroot&m=141319864817617
[2] http://marc.info/?l=buildroot&m=141537589907416
[3] http://marc.info/?l=buildroot&m=141537622207763


[...]
-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
