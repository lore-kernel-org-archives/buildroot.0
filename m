From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 21 Mar 2016 11:45:57 +0100
Subject: [Buildroot] [PATCH 0/5] Qt5 bump to 5.6.0 version
In-Reply-To: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <CAAMH-yv=4XGz0K0tP=c3yKgoYyvHKmf6R3_WR6UXedY_PfaejA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On Thu, Mar 17, 2016 at 10:42 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
> Qt-5.6.0 have been released yesterday and drop the support of Qt5Webkit
> and Qt5Quick1.
>
> All packages changed in this series have been compiled with:
>   - raspberry_defconfig + rpi_userland (brcm backend)
>   - firefly_rk3288_demo_defconfig + sunxi-mali (mali backend)
>   - own imx6q defconfig + imx-gpu-viv (vivante backend)
>
> More info on the release:
>   - http://blog.qt.io/blog/2016/03/16/qt-5-6-released/
>   - http://blog.qt.io/blog/2015/11/17/embedded-linux-news-in-qt-5-6/

Tested on a Nitrogen6QP_MAX (nitrogen6x defconfig), with the following config:
BR2_PACKAGE_QT5CINEX=y
BR2_PACKAGE_QT5CINEX_HD=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT53D=y
BR2_PACKAGE_QT5CONNECTIVITY=y
BR2_PACKAGE_QT5ENGINIO=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5WEBCHANNEL=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_G2D=y
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y

CinematicExperience-demo, hellogl2 and hellogles3 all run fine.

For the whole series:
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

One remark though, maybe we should get webengine in at the same time
since webkit has been removed. Otherwise it means users won't have any
option to display web content. I know I said I would look at webengine
but haven't had the time yet. Have you tested it?

Regards,
Gary
