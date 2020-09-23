From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 21:02:02 +0200
Subject: [Buildroot] [PATCH 1/3] configs: Add default configuration for
 Chromebook Elm.
In-Reply-To: <20200921181246.88781-2-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
 <20200921181246.88781-2-bilalwasim676@gmail.com>
Message-ID: <20200923210202.7e7424c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2020 23:12:44 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> The architecture of the MT8173 SoC is armv8-a in a big-little config.
> This SoC is supported by the Chrome-OS linux kernel, but the mainline
> support is reasonably good as well (benchmarks / conformance run fine)
> and so that is used. For now, the kernel is 5.9-rc5 which will be uprevd
> to 5.9 once its released.
> 
> The defconfig also lists all the tools (parted, vboot) that are necessary
> to create a bootable image.
> 
> Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>

The commit title should be:

	configs/chromebook_elm: new defconfig

and it should be squashed with your PATCH 3/3. Indeed as it is, your
PATCH 1/3 alone doesn't build: it depends on files added by PATCH 3/3.

>  configs/chromebook_elm_defconfig | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 configs/chromebook_elm_defconfig
> 
> diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
> new file mode 100644
> index 0000000000..9b467ec6a8
> --- /dev/null
> +++ b/configs/chromebook_elm_defconfig
> @@ -0,0 +1,35 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y

You'll need a:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y

but this option doesn't exist yet, so we'll have to add it.

Other than that, the defconfig looks good to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
