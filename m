From: Mathieu <mbriand@adeneo-embedded.com>
Date: Tue, 07 Feb 2012 11:22:29 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <201202070000.34270.arnout@mind.be>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1328277370-18423-1-git-send-email-mbriand@adeneo-embedded.com>
 <201202070000.34270.arnout@mind.be>
Message-ID: <1328610149.18704.23.camel@mathieu-OptiPlex-745>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-02-07 at 00:00 +0100, Arnout Vandecappelle wrote:
Thank you for this contribution!  We certainly need more defconfigs.
> 
>  Below are a few comments on your patch.  Please consider them and if
> necessary re-post it.  If you will not be able to re-post it, let us
know
> so someone else can adopt it.
> 
>  We will certainly need a Signed-off-by tag on your patch, i.e. a line
saying
> 
> Signed-off-by: Your Name <your@email.address>
> 
> This is a short way for you to assert that you are entitled to
contribute
> the patch under buildroot's GPL license.  See 
> http://kerneltrap.org/files/Jeremy/DCO.txt for more details.

Ok

> 
> 
> On Friday 03 February 2012 14:56:10 Mathieu Briand wrote:
> > Buildroot config and Linux Kernel config.
> > Binaries blob not supported yet.
> 
>  What does 'Binaries blob' mean?

By 'Binaries blob' I mean Freescale Multimedia Codecs. Current buildroot
configuration will probably not allow users to use them.

> 
> > ---
> >  board/freescale/mx53loco/linux.config |  175 +++++++++++++++++++++++++++++++++
> >  configs/freescale_mx53loco_defconfig  |   19 ++++
> >  2 files changed, 194 insertions(+), 0 deletions(-)
> >  create mode 100644 board/freescale/mx53loco/linux.config
> >  create mode 100644 configs/freescale_mx53loco_defconfig
> 
>  The processor is called "i.MX53", I believe.  We also usually don't 
> include the vendor name in the processor identification.  So something
> like configs/imx53loco_defconfig is probably more appropriate.  OTOH,
> Freescale themselves seem to call i.MX3x processors "imx" and i.MX5x
> processors "mx5"...
> 

Ok for the vendor name.
For imx53/mx53 it seemed appropriate to name it mx53 since it's the name
in kernel and u-boot.

> 
> > diff --git a/board/freescale/mx53loco/linux.config b/board/freescale/mx53loco/linux.config
>  Personally I'd prefer to use a kernel defconfig (mx5_defconfig), but
> perhaps this one is more appropriate.
> 
> [snip]
> > diff --git a/configs/freescale_mx53loco_defconfig b/configs/freescale_mx53loco_defconfig
> > new file mode 100644
> > index 0000000..dbf0e2c
> > --- /dev/null
> > +++ b/configs/freescale_mx53loco_defconfig
> > @@ -0,0 +1,19 @@
> > +# Architecture
> > +BR2_arm=y
> > +BR2_cortex_a8=y
> > +
> > +# System
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
> > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/uboot-imx.git"
> > +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git"
> > +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
> 
>  I think it is better (more predictable) to specify an exact version instead
> of the latest HEAD.  Either a git sha or a tarball, e.g. 
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/snapshot/rel_imx_2.6.38_12.01.01.tar.gz
> (if that is a relevant snapshot at all).

Ok

> 
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mx53loco/linux.config"
> > 
> 
>  Regards,
>  Arnout
> 
