From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 15:58:40 +0100
Subject: [Buildroot] [PATCH v3] mpv: add support for Raspberry Pi "rpi"
 output
In-Reply-To: <20171024090740.13683-1-mahyar.koshkouei@gmail.com>
References: <20171024090740.13683-1-mahyar.koshkouei@gmail.com>
Message-ID: <20180101155840.455bea53@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Oct 2017 10:07:40 +0100, Mahyar Koshkouei wrote:
> mpv now compiles with the "rpi" video driver that provides hardware
> acceleration on the Raspberry Pi.
> 
> Tested working on a Raspberry Pi 1 Model B+ and Zero.
> 
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

I've applied your patch, but I have some comments/questions below.

> diff --git a/package/mpv/0003-rpi-fix-linking-errors.patch b/package/mpv/0003-rpi-fix-linking-errors.patch
> new file mode 100644
> index 0000000000..0e65a5a3eb
> --- /dev/null
> +++ b/package/mpv/0003-rpi-fix-linking-errors.patch
> @@ -0,0 +1,90 @@
> +From fe482a600d507dc7ce77f6d154a9e8b395f74fdd Mon Sep 17 00:00:00 2001
> +From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
> +Date: Tue, 24 Oct 2017 09:47:38 +0100
> +Subject: [PATCH] rpi: fix linking errors
> +
> +Fixes linking issues when compiling with Raspberry Pi support.
> +
> +Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
> +---
> +Status: pull request https://github.com/mpv-player/mpv/pull/4883

Could you try to revive this discussion, which seems to have stalled ?


> +# Raspberry Pi support
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)

I don't see why the rpi-firmware dependency was necessary. Yes, it was
there for ffmpeg, but I've also committed a patch to drop it. I removed
it as well from your mpv change. Hopefully I was not mistaken :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
