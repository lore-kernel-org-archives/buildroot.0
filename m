From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 31 Dec 2018 15:52:43 +0200
Subject: [Buildroot] [PATCH v3 17/17] package/liquid-dsp: drop support
 for fftw-double and fftw-long-double
In-Reply-To: <20181231133030.25991-18-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-18-thomas.petazzoni@bootlin.com>
Message-ID: <20181231135243.ervwrfcyyelpcgbl@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Dec 31, 2018 at 02:30:30PM +0100, Thomas Petazzoni wrote:
> liquid-dsp has the following code:
> 

Something seems to be missing here. Stripped lines with '#' prefix?

baruch

> So, if it uses the external fftw library, it can only use the fftwf
> variant, i.e the fftw-single variant. Otherwise, it uses its internal
> FFT library.
> 
> There is no way for liquid-dsp to use fftw-double or fftw-long-double.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index 6aa27a5248..64c403e87f 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -40,16 +40,6 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
>  LIQUID_DSP_CONF_OPTS += --enable-simdoverride
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
> -LIQUID_DSP_LDFLAGS += -lfftw3
> -LIQUID_DSP_DEPENDENCIES += fftw-double
> -endif
> -
> -ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
> -LIQUID_DSP_LDFLAGS += -lfftw3l
> -LIQUID_DSP_DEPENDENCIES += fftw-long-double
> -endif
> -
>  LIQUID_DSP_CONF_OPTS += \
>  	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
>  	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
