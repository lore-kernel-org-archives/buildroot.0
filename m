From: trem <tremyfr@yahoo.fr>
Date: Mon, 02 May 2011 00:14:37 +0200
Subject: [Buildroot] [PATCH] Add pandaboard support
In-Reply-To: <8762q15f5t.fsf@macbook.be.48ers.dk>
References: <1303250132-14596-1-git-send-email-tremyfr@yahoo.fr>
	<8762q15f5t.fsf@macbook.be.48ers.dk>
Message-ID: <4DBDDB4D.6060401@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

All this work is based on this tutorial : http://www.elinux.org/Panda_How_to_kernel_new


On 26/04/11 15:13, Peter Korsgaard wrote:
>>>>>> "Philippe" == Philippe Reynes<tremyfr@yahoo.fr>  writes:
> Hi,
>
> Thanks, see below for a few comments.
>
>   Philippe>  Signed-off-by: Philippe Reynes<tremyfr@yahoo.fr>
>   Philippe>  ---
>   Philippe>   .../u-boot-2010.12-fix-tty-on-pandaboard.patch     |   13 +++++++++++++
>   Philippe>   configs/omap4_panda_config                         |   14 ++++++++++++++
>   Philippe>   2 files changed, 27 insertions(+), 0 deletions(-)
>   Philippe>   create mode 100644 board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
>   Philippe>   create mode 100644 configs/omap4_panda_config
>
>   Philippe>  diff --git a/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
>   Philippe>  new file mode 100644
>   Philippe>  index 0000000..0233460
>   Philippe>  --- /dev/null
>   Philippe>  +++ b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
>   Philippe>  @@ -0,0 +1,13 @@
>   Philippe>  +Index: u-boot-2010.12/include/configs/omap4_panda.h
>   Philippe>  +===================================================================
>   Philippe>  +--- u-boot-2010.12.orig/include/configs/omap4_panda.h	2010-12-22 20:22:14.000000000 +0100
>   Philippe>  ++++ u-boot-2010.12/include/configs/omap4_panda.h	2011-04-16 15:51:07.000000000 +0200
>   Philippe>  +@@ -148,7 +148,7 @@
>   Philippe>  +
>   Philippe>  + #define CONFIG_EXTRA_ENV_SETTINGS \
>   Philippe>  + 	"loadaddr=0x82000000\0" \
>   Philippe>  +-	"console=ttyS2,115200n8\0" \
>   Philippe>  ++	"console=ttyO2,115200n8\0" \
>
> Please document and sign-off-by on patches (using git style). Why is
> this needed, is it going upstream?
>
As it's based on a well known tutorial, I've supposed that it's already known by upstream project.
And I've done a quickly patch and I wait that upstream u-boot report this change.

I've done a new release of this patch in git format.

>   Philippe>  +++ b/configs/omap4_panda_config
>   Philippe>  @@ -0,0 +1,14 @@
>   Philippe>  +BR2_arm=y
>   Philippe>  +BR2_SOURCEFORGE_MIRROR="easynews"
>
> The custom sf.net mirror shouldn't be part of this defconfig.
>
>
yes, I remove it in the new defconfig.

>   Philippe>  +BR2_TOOLCHAIN_EXTERNAL=y
>
> Why an external toolchain?
>
>
simply because it's was faster to compile.

>   Philippe>  +BR2_TARGET_GENERIC_GETTY=y
>   Philippe>  +BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
>   Philippe>  +BR2_PACKAGE_UDEV=y
>
> Why udev?
>
It's requested by the pandaboard (see the link at the beginning of the answer).
>   Philippe>  +BR2_TARGET_UBOOT=y
>   Philippe>  +BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
>   Philippe>  +BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/arm/pandaboard/u-boot-patches/"
>   Philippe>  +# BR2_TARGET_UBOOT_NETWORK is not set
>   Philippe>  +BR2_TARGET_XLOADER=y
>   Philippe>  +BR2_TARGET_XLOADER_BOARDNAME="omap4430panda"
>
> We don't have an xloader package in BR yet. I haven't followed
> pandaboard development recently - Has xloader development stabilized,
> and is there a single well-defined upstream?
>
I've sent a patch to add x-loader, thomas has replied.
This patch (pandaboard support) depends on the former one (x-loader support).

I send a new release of the patch for the pandaboard support.

Regards,
Philippe
