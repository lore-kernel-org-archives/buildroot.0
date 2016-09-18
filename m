From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:00:00 +0200
Subject: [Buildroot] [PATCH 01/11] Update genimage configuration file
 for Arietta-G25 in order to build a bootable SD card image named
 "sdcard.img"
In-Reply-To: <1470827167-9426-3-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-3-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918200000.527a4c8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:05:57 +0200, Biagio Montaruli wrote:

>  image boot.vfat {
>  	vfat {
> -		file zImage {
> -			image = "zImage"
> -		}
> -
> -		file acme-arietta.dtb {
> -			image = "at91-ariag25.dtb"
> -		}
> -
> -		file boot.bin {
> -			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
> +		files = {
> +			"zImage",
> +			"acme-arietta.dtb",
> +			"boot.bin"
>  		}

If I apply just this patch, it breaks the build because there is not
file named acme-arietta.dtb produced by the existing Arietta defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
