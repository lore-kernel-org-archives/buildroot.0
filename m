From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 15:13:34 +0200
Subject: [Buildroot] [PATCH] Add pandaboard support
In-Reply-To: <1303250132-14596-1-git-send-email-tremyfr@yahoo.fr> (Philippe
	Reynes's message of "Tue, 19 Apr 2011 23:55:32 +0200")
References: <1303250132-14596-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <8762q15f5t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:

Hi,

Thanks, see below for a few comments.

 Philippe> Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
 Philippe> ---
 Philippe>  .../u-boot-2010.12-fix-tty-on-pandaboard.patch     |   13 +++++++++++++
 Philippe>  configs/omap4_panda_config                         |   14 ++++++++++++++
 Philippe>  2 files changed, 27 insertions(+), 0 deletions(-)
 Philippe>  create mode 100644 board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
 Philippe>  create mode 100644 configs/omap4_panda_config

 Philippe> diff --git a/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
 Philippe> new file mode 100644
 Philippe> index 0000000..0233460
 Philippe> --- /dev/null
 Philippe> +++ b/board/arm/pandaboard/u-boot-patches/u-boot-2010.12-fix-tty-on-pandaboard.patch
 Philippe> @@ -0,0 +1,13 @@
 Philippe> +Index: u-boot-2010.12/include/configs/omap4_panda.h
 Philippe> +===================================================================
 Philippe> +--- u-boot-2010.12.orig/include/configs/omap4_panda.h	2010-12-22 20:22:14.000000000 +0100
 Philippe> ++++ u-boot-2010.12/include/configs/omap4_panda.h	2011-04-16 15:51:07.000000000 +0200
 Philippe> +@@ -148,7 +148,7 @@
 Philippe> + 
 Philippe> + #define CONFIG_EXTRA_ENV_SETTINGS \
 Philippe> + 	"loadaddr=0x82000000\0" \
 Philippe> +-	"console=ttyS2,115200n8\0" \
 Philippe> ++	"console=ttyO2,115200n8\0" \

Please document and sign-off-by on patches (using git style). Why is
this needed, is it going upstream?


 Philippe> +++ b/configs/omap4_panda_config
 Philippe> @@ -0,0 +1,14 @@
 Philippe> +BR2_arm=y
 Philippe> +BR2_SOURCEFORGE_MIRROR="easynews"

The custom sf.net mirror shouldn't be part of this defconfig.


 Philippe> +BR2_TOOLCHAIN_EXTERNAL=y

Why an external toolchain?


 Philippe> +BR2_TARGET_GENERIC_GETTY=y
 Philippe> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
 Philippe> +BR2_PACKAGE_UDEV=y

Why udev?


 Philippe> +BR2_TARGET_UBOOT=y
 Philippe> +BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
 Philippe> +BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/arm/pandaboard/u-boot-patches/"
 Philippe> +# BR2_TARGET_UBOOT_NETWORK is not set
 Philippe> +BR2_TARGET_XLOADER=y
 Philippe> +BR2_TARGET_XLOADER_BOARDNAME="omap4430panda"

We don't have an xloader package in BR yet. I haven't followed
pandaboard development recently - Has xloader development stabilized,
and is there a single well-defined upstream?

-- 
Bye, Peter Korsgaard
