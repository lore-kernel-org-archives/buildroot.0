From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 06:27:51 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Dec 2017 19:47:08 +0100, Johannes Schmitz wrote:

>  config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
>  	string "Size of environment"
>  	help
> -	  Size of envronment, can be prefixed with 0x for hexadecimal
> -	  values.
> +	  Size of environment in bytes, can be prefixed with 0x for
> +	  hexadecimal values. Needs to match exactly for correct CRC

"Needs to match exactly" with what ?

It needs to match with the size of the environment declared in the
U-Boot configuration.

> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +	hex "Padding byte"
> +	default 0x00
> +	help
> +	  The byte used for padding at the end of the environment image.

I'm still not sure what is the point of customizing the padding byte.
Does someone has a use-case for that ? If not, I'm not sure it makes
sense to add a Buildroot option for it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
