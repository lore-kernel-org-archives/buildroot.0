From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 15:18:08 +0200
Subject: [Buildroot] [PATCH v5 3/3] board: Add Kontron SMARC-sAL28
 support
In-Reply-To: <20200604221123.1850-3-michael@walle.cc>
References: <20200604221123.1850-1-michael@walle.cc>
 <20200604221123.1850-3-michael@walle.cc>
Message-ID: <20200912151808.7672244e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Fri,  5 Jun 2020 00:11:22 +0200
Michael Walle <michael@walle.cc> wrote:

> Now that upstream supports this board add buildroot support for it, too.
> 
> This supports:
>  - latest upstream linux kernel. Since the support for this board and
>    its SoC is still in active development, we want to follow the
>    upstream kernel releases for now.
>  - building an image which can be installed to eMMC, SD card or USB
>    thumb drive.
>  - upstream u-boot patches are pending, therefore no support for
>    building a bootloader for now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

Thanks. I've applied your patch, with some minor changes.

Changed the commit title to follow the format:

	configs/foo_defconfig: new defconfig

> +BR2_KERNEL_DTB_KEEP_DIRNAME=y

I fixed the name of this option, as pointed by Heiko.

> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_IPROUTE2=y

I dropped this, as we want our defconfigs to be minimal.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
