From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 22:53:37 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/freescale-imx/firmware-imx:
 Clean up the image/target semantic
In-Reply-To: <1594382445-4464-5-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-5-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200711225337.579a2569@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 14:00:45 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> The newly introduced BR2_PACKAGE_FIRMWARE_IMX_xxx symbols shall be
> used in lieue of the SoC type when installing images or binaries on
> target.
> 
> These new symbols let us define FIRMWARE_IMX_INSTALL_IMAGES_CMDS and
> FIRMWARE_IMX_INSTALL_TARGET_CMDS based on platform needs rather than
> SoC type.
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

I've applied, with some changes:

- I dropped the BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW conditional, and
  instead just use conditions on BR2_PACKAGE_FIRMWARE_IMX_LPDDR4 and
  BR2_PACKAGE_FIRMWARE_IMX_DDR4

- I renamed FIRMWARE_IMX_PREPARE_DDR_FW to
  FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW, because what it does is really
  install the firmware.

- I've used the correct option names after my changes on PATCH 3/4.

- I simplified the VPU installation tweak for i.MX8X.

I've done a few tests, but if you can have a second look at what I
committed, it would be useful.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
