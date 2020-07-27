From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:25:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-imx:
 install mx8qm-ahab-container.img
In-Reply-To: <20200220021858.700249-2-thomas.petazzoni@bootlin.com>
References: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
 <20200220021858.700249-2-thomas.petazzoni@bootlin.com>
Message-ID: <20200727152515.7b9624d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 03:18:57 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit ensures the mx8qm-ahab-container.img file gets installed
> for the i.MX8 platform (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8). This
> is needed for board/freescale/common/imx/imx8-bootloader-prepare.sh to
> find this file when creating the bootloader image.
> 
> Note that it means that the default FIRMWARE_IMX_INSTALL_TARGET_CMDS
> that applies to all platforms except i.MX8M, i.MX8MM and i.MX8X also
> no longer applies to i.MX8. But this is anyway probably relevant, as
> most likely i.MX8 also needs a special variant of
> FIRMWARE_IMX_INSTALL_TARGET_CMDS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> NOTE: some review on this patch from i.MX people would be greatly
> appreciated. Thanks!
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

This patch has been rendered useless by
https://git.buildroot.org/buildroot/commit/?id=97d54bdcb2185914e232749fa4171601a9ec7f0d
where the imx-seco package now properly installs ahab-container.img for
the BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y configuration.

So I've marked this patch as not applicable.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
