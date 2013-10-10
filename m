From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 17:06:58 +0200
Subject: [Buildroot] [PATCH] uboot: support -p option for mkenvimage
In-Reply-To: <1381399545-30713-1-git-send-email-spdawson@gmail.com>
References: <1381399545-30713-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131010170658.68908aae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Thu, 10 Oct 2013 11:05:45 +0100, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  boot/uboot/Config.in | 6 ++++++
>  boot/uboot/uboot.mk  | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 998cda2..c341670 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -242,6 +242,12 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
>  	  Size of envronment, can be prefixed with 0x for hexadecimal
>  	  values.
>  
> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +	string "Padding byte"
> +	default "0xff"
> +	help
> +	  Pad the image with the specified byte.

Maybe a few more words like in which cases this is useful, would be
nice to have I believe (I myself don't know when this option should be
used).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
