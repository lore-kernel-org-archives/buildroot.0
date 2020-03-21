From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:20:59 +0100
Subject: [Buildroot] [PATCH 5/5] configs/freescale_imx8q{m,
 xp}mek: bump BSP components to 4.19.35_1.1.0
In-Reply-To: <20200320163158.18341-6-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
 <20200320163158.18341-6-maeva.manuel@oss.nxp.com>
Message-ID: <20200321162059.32bae555@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Mar 2020 17:31:58 +0100
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> The package imx-seco has been added in the defconfigs.
> 
> Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>

Thanks! However, we still have some NXP platforms that don't use 4.19:

$ grep "LINUX_KERNEL.*4\.14" configs/freescale_*
configs/freescale_imx8mmevk_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
configs/freescale_imx8mqevk_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"

Could you have a look at switching them to 4.19, provided of course you
have the HW to test them ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
