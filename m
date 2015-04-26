From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:22:21 +0200
Subject: [Buildroot] [PATCH v2 3/3] xdriver_xf86-video-imx: new package
In-Reply-To: <1417252360-10929-4-git-send-email-jezz@sysmic.org>
References: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
 <1417252360-10929-4-git-send-email-jezz@sysmic.org>
Message-ID: <20150426122221.305dc5a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 29 Nov 2014 10:12:40 +0100, J?r?me Pouiller wrote:
> X.Org driver for iMX5 GPU. Most of patches come from Yocto project.
> 
> Tested using:
>     mx5loco_defconfig +
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>     BR2_PACKAGE_QT5=y
>     BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>     BR2_PACKAGE_QT5BASE_EXAMPLES=y
>     BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
>     BR2_PACKAGE_QT5BASE_XCB=y
>     BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
>     BR2_PACKAGE_QT5BASE_GIF=y
>     BR2_PACKAGE_QT5BASE_JPEG=y
>     BR2_PACKAGE_QT5BASE_PNG=y
>     BR2_PACKAGE_QT5QUICKCONTROLS=y
>     BR2_PACKAGE_XORG7=y
>     BR2_PACKAGE_XSERVER_XORG_SERVER=y
>     BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
>     BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
>     BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX=y
>     BR2_PACKAGE_FREESCALE_IMX=y
>     BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53=y
>     BR2_PACKAGE_GPU_AMD_BIN_MX51=y
>     BR2_PACKAGE_GPU_AMD_BIN_MX51_EXAMPLES=y
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/x11r7/Config.in                            |   1 +
>  .../0001-Update-to-newer-swap-macros.patch         |  65 ++
>  .../0002-Fix-error-unknown-type-name-uint.patch    |  33 +
>  .../0003-support-glibc-2.20.patch                  |  57 ++
>  ...video-API-forward-and-backward-compatible.patch | 787 +++++++++++++++++++++
>  ...-xf86-video-imxfb-fix-m4-hardcodded-paths.patch |  53 ++
>  .../0006-xserver-1.14-compat.patch                 |  34 +
>  package/x11r7/xdriver_xf86-video-imx/Config.in     |  33 +
>  .../xdriver_xf86-video-imx.mk                      |  15 +
>  9 files changed, 1078 insertions(+)
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0002-Fix-error-unknown-type-name-uint.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0003-support-glibc-2.20.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-compatible.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/Config.in
>  create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk

Applied after doing some minor tweaks to the Config.in file, thanks.

Also, I noticed that Arch has some patch to make it work with X server
1.17. Maybe we should integrate this patch as well? Could you retest
this driver with the latest Buildroot, which has X server 1.17, and see
if the additional Arch patch is needed or not?

See
https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/xf86-video-imx/xserver-1.17-compat.patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
