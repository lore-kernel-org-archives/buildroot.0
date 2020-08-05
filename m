From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 14:40:24 +0200
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: add dependency to
 host python3
In-Reply-To: <20200804082906.118090-1-eugen.hristev@microchip.com>
References: <20200804082906.118090-1-eugen.hristev@microchip.com>
Message-ID: <20200805144024.7b823f6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Aug 2020 11:29:06 +0300
Eugen Hristev <eugen.hristev@microchip.com> wrote:

> Starting with version 3.9.3, AT91Bootstrap adds dependency for host
> python3.
> Python2 was deprecated so moving to Python3.
> AT91Bootstrap only requires Python3 at build time, for some scripts that
> generate specific metadata.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - fix typo s/boot/build
> 
>  boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 5cf865c681..a601f35a4b 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -6,6 +6,8 @@
>  
>  AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
>  
> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3

In fact the Python dependency is not needed in all situations: it's
only NAND-based configuration that need Python if I understand
correctly.

So I think we should handle this with a
BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON option, a bit like what U-Boot
is doing, but perhaps without the python2/python3 choice.

Could you work on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
