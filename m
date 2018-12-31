From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:54:31 +0100
Subject: [Buildroot] [PATCH v3 17/17] package/liquid-dsp: drop support
 for fftw-double and fftw-long-double
In-Reply-To: <20181231135243.ervwrfcyyelpcgbl@sapphire.tkos.co.il>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-18-thomas.petazzoni@bootlin.com>
 <20181231135243.ervwrfcyyelpcgbl@sapphire.tkos.co.il>
Message-ID: <20181231145431.176e640e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 15:52:43 +0200, Baruch Siach wrote:

> On Mon, Dec 31, 2018 at 02:30:30PM +0100, Thomas Petazzoni wrote:
> > liquid-dsp has the following code:
> >   
> 
> Something seems to be missing here. Stripped lines with '#' prefix?

Aah, yes, indeed. The code is:

#if HAVE_FFTW3_H && !defined LIQUID_FFTOVERRIDE
#   include <fftw3.h>
#   define FFT_PLAN             fftwf_plan
#   define FFT_CREATE_PLAN      fftwf_plan_dft_1d
#   define FFT_DESTROY_PLAN     fftwf_destroy_plan
#   define FFT_EXECUTE          fftwf_execute
#   define FFT_DIR_FORWARD      FFTW_FORWARD
#   define FFT_DIR_BACKWARD     FFTW_BACKWARD
#   define FFT_METHOD           FFTW_ESTIMATE
#else
#   define FFT_PLAN             fftplan
#   define FFT_CREATE_PLAN      fft_create_plan
#   define FFT_DESTROY_PLAN     fft_destroy_plan
#   define FFT_EXECUTE          fft_execute
#   define FFT_DIR_FORWARD      LIQUID_FFT_FORWARD
#   define FFT_DIR_BACKWARD     LIQUID_FFT_BACKWARD
#   define FFT_METHOD           0
#endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
