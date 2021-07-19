From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 19 Jul 2021 21:37:36 +0200
Subject: [Buildroot] [PATCH] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <20210718222449.3622228-1-festevam@gmail.com>
References: <20210718222449.3622228-1-festevam@gmail.com>
Message-ID: <CAB0FRsv3Wt=Hjon0FF+nqSh-HzNmsHbv8z12Cwbn+qK0N5DaSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Le lun. 19 juil. 2021 ? 00:25, Fabio Estevam <festevam@gmail.com> a ?crit :

> Currently mx6cubox uses a custom boot.scr.txt script
> and custom image generation scripts: genimage.cfg, post-build.sh
> and post-image.sh.
>
> Switch to using the more standard extlinux.conf solution
> and remove the custom scripts in favor of the standard
> board/freescale/common/imx/post-image.sh one.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi Francois and Baruch,
>
> I don't have access to mx6cubox. Please test this
> patch if you have a chance.
>
>
Hello Fabio,

with this new version, the boot is OK,
but there still an issue with the console variable:
# cat /proc/cmdline
root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200



> Is it safe to apply the U-Boot patch that changes the
> mmc device for all cubox/hummingboard variants?
>
> If it is OK, then I will send it to U-Boot upstream.
>
>
I think that the patch must be upstreamed.

Fran?ois


> Thanks
>
>  board/solidrun/mx6cubox/boot.scr.txt          |  7 -----
>  board/solidrun/mx6cubox/genimage.cfg          | 29 -------------------
>  ...xi-Fix-the-mmc-device-for-the-rootfs.patch | 29 +++++++++++++++++++
>  board/solidrun/mx6cubox/post-build.sh         |  8 -----
>  board/solidrun/mx6cubox/post-image.sh         | 14 ---------
>  .../boot/extlinux/extlinux.conf               |  4 +++
>  configs/mx6cubox_defconfig                    |  5 ++--
>  7 files changed, 36 insertions(+), 60 deletions(-)
>  delete mode 100644 board/solidrun/mx6cubox/boot.scr.txt
>  delete mode 100644 board/solidrun/mx6cubox/genimage.cfg
>  create mode 100644
> board/solidrun/mx6cubox/patches/uboot/0001-mx6cuboxi-Fix-the-mmc-device-for-the-rootfs.patch
>  delete mode 100755 board/solidrun/mx6cubox/post-build.sh
>  delete mode 100755 board/solidrun/mx6cubox/post-image.sh
>  create mode 100644
> board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210719/e72a17d4/attachment-0001.html>
