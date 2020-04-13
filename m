From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:10:45 +0200
Subject: [Buildroot] [RESEND PATCH v2 3/3] configs,
 board/olpc: add OLPC XO-1.75 configuration
In-Reply-To: <20191030123909.443536-4-lkundrak@v3.sk>
References: <20191030123909.443536-1-lkundrak@v3.sk>
 <20191030123909.443536-4-lkundrak@v3.sk>
Message-ID: <20200413221045.7a09a505@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 13:39:09 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  board/olpc/xo-1.75/linux.config | 28 ++++++++++++
>  configs/olpc_xo175_defconfig    | 80 +++++++++++++++++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 board/olpc/xo-1.75/linux.config
>  create mode 100644 configs/olpc_xo175_defconfig

Forgot to say it in the review of PATCH 2/3: you need to update the
DEVELOPERS file.

> diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
> new file mode 100644
> index 0000000000..200d0f7c2b
> --- /dev/null
> +++ b/configs/olpc_xo175_defconfig
> @@ -0,0 +1,80 @@
> +BR2_arm=y
> +BR2_pj4=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Same as for PATCH 2/3: please create a minimal defconfig, not something
with glibc, systemd, and zillions of packages. I know it can be
frustrating, but we cannot have a random selection of packages for each
defconfig, or everyone will want to add his own packages because "it
makes sense for him".

Could you rework the defconfigs accordingly ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
