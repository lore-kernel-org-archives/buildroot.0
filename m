From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 14:07:27 +0100
Subject: [Buildroot] [PATCH v3 08/17] package/gnuradio: use the new
 fftw-single package
In-Reply-To: <20190101121657.GN26917@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-9-thomas.petazzoni@bootlin.com>
 <20190101121657.GN26917@scaer>
Message-ID: <20190101140727.12302abe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Jan 2019 13:16:57 +0100, Yann E. MORIN wrote:

> >  config BR2_PACKAGE_GNURADIO_FFT
> >  	bool "gr-fft support"
> > +	select BR2_PACKAGE_FFTW
> > +	select BR2_PACKAGE_FFTW_SINGLE  
> 
> So, here we're selecting both fftw and fftw-single, yet...

Well that's how the whole thing is designed: if you want to use one of
the fftw-* packages, you need to select both BR2_PACKAGE_FFTW or
BR2_PACKAGE_FFTW_SINGLE. See what the package/fftw/Config.in file looks
like with the whole series applied.

Note: I am not saying this is the only solution to do that, and that's
it's the best, I'm just saying that doing both of those selects is
needed with the solution proposed in this series.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
