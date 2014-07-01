From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Jul 2014 21:16:00 +0300
Subject: [Buildroot] [PATCH 01/10] arch: deprecate the AVR32 architecture
In-Reply-To: <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140701181600.GR4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 01, 2014 at 08:03:00PM +0200, Thomas Petazzoni wrote:
> The AVR32 architecture from Atmel is obsolete since a long time, not
> supported upstream in most of the toolchain components (requires a
> special version of gcc, an old version of uClibc, etc.). Until
> February, Simon Dawson was making an excellent job at maintaining
> AVR32 in Buildroot, and fixing all the issues caused by this
> architecture. However, Simon focus has changed, and despite his call
> for a new maintainer for AVR32 in Buildroot, nobody stepped up.
> 
> The issue of maintaining AVR32 is becoming worse and worse, so this
> patch proposes to deprecate it for 2014.08, but keeping the support
> around, to remove it for sure in 2014.11.
> 
> Cc: Simon Dawson <spdawson@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 1f60f81..77fae7a 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -56,6 +56,12 @@ config BR2_aarch64
>  config BR2_avr32
>  	bool "AVR32"
>  	select BR2_SOFT_FLOAT
> +	# This architecture is obsolete and complicated to maintain to
> +	# do the lack of upstream support in the major toolchain

s/to do/due to/

baruch

> +	# components. If you're interested by AVR32, contact the
> +	# Buildroot community. Otherwise, its support will be removed
> +	# in 2014.11.
> +	depends on BR2_DEPRECATED_SINCE_2014_08
>  	help
>  	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
>  	  Atmel.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
