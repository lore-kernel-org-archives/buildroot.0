From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 15:14:06 -0300
Subject: [Buildroot] [PATCH 2/2] u-boot: build signed image for OMAP
 processors
In-Reply-To: <1315934373-16561-2-git-send-email-luca@lucaceresoli.net>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
 <1315934373-16561-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <0ff71aac702ca25e3bc08f5749fd98e3@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Sep 2011 19:19:33 +0200, Luca Ceresoli wrote:

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  boot/uboot/Config.in |   15 +++++++++++++++
>  boot/uboot/uboot.mk  |   24 ++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 0 deletions(-)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index a0b2bfc..5a8af98 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -91,6 +91,21 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
>
>  endchoice
>
> +config BR2_TARGET_UBOOT_OMAP_IFT
> +	depends on BR2_TARGET_UBOOT_FORMAT_BIN
> +	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
> +	bool "produce a .ift signed image (OMAP)"
> +	help
> +	  Use gpsign to produce an image of u-boot.bin signed with
> +	  a Configuration Header for booting on OMAP processors.

Maybe make it depend on BR2_ARCH = arm || armeb to avoid pointless 
options for other architectures?
Regards.
