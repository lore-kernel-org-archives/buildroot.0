From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 4 Mar 2018 20:24:52 -0300
Subject: [Buildroot] [PATCH 11/23] configs/imx6-sabresd: needs
 host-openssl for the Linux kernel build
In-Reply-To: <20180304213137.24681-12-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
 <20180304213137.24681-12-thomas.petazzoni@bootlin.com>
Message-ID: <CAOMZO5CgKRFwU_NDc6VmLYUwHiBrFvVjpoBn1Cram_vD9+Lu1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 4, 2018 at 6:31 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Fixes:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306836
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  configs/imx6-sabresd_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
> index edb4d7ed10..9999513914 100644
> --- a/configs/imx6-sabresd_defconfig
> +++ b/configs/imx6-sabresd_defconfig
> @@ -36,3 +36,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

It seems that all kernels >= 4.15 need to have
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL selected, right?

Can we have this selection made on a common place?

Thanks
