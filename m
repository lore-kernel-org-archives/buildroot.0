From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Dec 2019 10:34:13 -0300
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.1.1
In-Reply-To: <20191202200601.418280-1-juju@cotds.org>
References: <20191202200601.418280-1-juju@cotds.org>
Message-ID: <CAOMZO5DnNwUP2H7AOD+zgLoBXWMwYVLem0CgL92iMdM-BJ++nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Mon, Dec 2, 2019 at 6:16 PM Julien Olivain <juju@cotds.org> wrote:
>
> This version is aligned with i.MX NXP BSP components version
> rel_imx_4.14.98_2.0.0_ga
>
> Signed-off-by: Julien Olivain <juju@cotds.org>

This seems to break freescale_imx8qxpmek_defconfig:

>>> firmware-imx 8.1.1 Installing to images directory
# SECO firmware is needed when generating imx8-boot-sd.bin which
# is done in post-image script.
cp /home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img
/home/fabio/buildroot/output/images/ahab-container.img
cp: cannot stat
'/home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img':
No such file or directory
package/pkg-generic.mk:339: recipe for target
'/home/fabio/buildroot/output/build/firmware-imx-8.1.1/.stamp_images_installed'
failed
make: *** [/home/fabio/buildroot/output/build/firmware-imx-8.1.1/.stamp_images_installed]
Error 1
