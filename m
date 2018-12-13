From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:18:46 +0100
Subject: [Buildroot] [PATCH] package/liquid-dsp: add missing dependency
 on fftw
In-Reply-To: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
References: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181213211846.18b89259@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 10:04:58 +0100, Thomas Petazzoni wrote:
> When one of BR2_PACKAGE_FFTW_PRECISION_* is enabled, liquid-dsp links
> against fftw3f, fftw3 or fftw3l, but forgets to add the fftw package
> in its dependencies. It works fine in practice because "fftw" is
> before "liquid-dsp" in the alphabetic ordering, but building with
> "make liquid-dsp" or with per-package directory causes a build
> failure.
> 
> Fix that by adding the missing dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
