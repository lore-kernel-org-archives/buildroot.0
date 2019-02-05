From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 22:09:40 +0100
Subject: [Buildroot] [PATCH v4 17/17] package/liquid-dsp: drop support
 for fftw-double and fftw-long-double
In-Reply-To: <1548078671-63318-17-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-17-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190205220940.3dbda336@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jan 2019 14:51:11 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> liquid-dsp has the following code:
> #if HAVE_FFTW3_H && !defined LIQUID_FFTOVERRIDE
> #   include <fftw3.h>
> #   define FFT_PLAN             fftwf_plan
> #   define FFT_CREATE_PLAN      fftwf_plan_dft_1d
> #   define FFT_DESTROY_PLAN     fftwf_destroy_plan
> #   define FFT_EXECUTE          fftwf_execute
> #   define FFT_DIR_FORWARD      FFTW_FORWARD
> #   define FFT_DIR_BACKWARD     FFTW_BACKWARD
> #   define FFT_METHOD           FFTW_ESTIMATE
> #else
> #   define FFT_PLAN             fftplan
> #   define FFT_CREATE_PLAN      fft_create_plan
> #   define FFT_DESTROY_PLAN     fft_destroy_plan
> #   define FFT_EXECUTE          fft_execute
> #   define FFT_DIR_FORWARD      LIQUID_FFT_FORWARD
> #   define FFT_DIR_BACKWARD     LIQUID_FFT_BACKWARD
> #   define FFT_METHOD           0
> #endif
> 
> So, if it uses the external fftw library, it can only use the fftwf
> variant, i.e the fftw-single variant. Otherwise, it uses its internal
> FFT library.
> 
> There is no way for liquid-dsp to use fftw-double or fftw-long-double.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 10 ----------
>  1 file changed, 10 deletions(-)

Applied to master, thanks. I have applied *before* all other patches,
because it's really a preparation fix that is useful independently from
the rest of the FFTW rework.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
