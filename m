From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 10:23:44 +0200
Subject: [Buildroot] [PATCH 5/5] configs/nitrogen8m: Add new defconfig
In-Reply-To: <20180719101000.2b07e7f8@windsurf>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-6-gary.bisson@boundarydevices.com>
 <20180719101000.2b07e7f8@windsurf>
Message-ID: <20180719082344.GA26603@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jul 19, 2018 at 10:10:00AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 19 Jul 2018 09:32:53 +0200, Gary Bisson wrote:
> > NXP i.MX8MQ based SBC with 2GB of LPDDR4 and 8GB eMMC.
> > 
> > More details on the platform here:
> > https://boundarydevices.com/product/nitrogen8m
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> >  configs/nitrogen8m_defconfig | 54 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 configs/nitrogen8m_defconfig
> 
> DEVELOPERS entry + .gitlab-ci.yml update are missing.

DEVELOPERS should be fine since I have:
F:	configs/nitrogen*

.gitlab-ci.yml was forgotten indeed, I'll add it to V2.

> > +# System
> > +BR2_TARGET_GENERIC_GETTY=y
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-nitrogen8m.dtb"
> 
> UBOOT_DIR is properly going to be expanded by the post-build script ?

My understanding is that the Makefile is expanding it already. What I
know for sure is that I receive the proper value in the script.

Regards,
Gary
