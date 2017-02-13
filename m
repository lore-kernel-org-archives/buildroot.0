From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 13:35:07 +0100
Subject: [Buildroot] [PATCH v5] gqrx: new package
In-Reply-To: <20170213093839.38b994c9@x230.trabucayre.com>
References: <20170210140112.26552-1-gwenj@trabucayre.com>
 <20170212155348.0f14e2a3@free-electrons.com>
 <20170213093839.38b994c9@x230.trabucayre.com>
Message-ID: <20170213133507.67a46075@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 09:38:39 +0100, gwenhael.goavec wrote:

> I'm agree, maybe portaudio by default because gnuradio users seems to
> use it preferentially.

OK. portaudio only depends on thread support, and gnuradio already
needs thread support anyway. So you can directly:

	select BR2_PACKAGE_PORTAUDIO if !BR2_PACKAGE_ALSA_LIB

in the BR2_PACKAGE_GNURADIO_AUDIO option.

> > > +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio    
> > 
> > This one is also annoying. Did you see the work that was posted on the
> > mailing list a while ago to allow building all variants of fftw? This
> > would allow to select the fftw package like any other. It would be
> > really really better. If you have some time to pick up this work and
> > finalize it, it would be nice.
> >   
> Thanks to highlight this patch because I've missed this one. I've,
> recently, looking at a way to build all flavors for this package
> instead of just one.
> Currently, according to the precision specified, fftw produce a dynamic
> library with a name corresponding to the precision. All others files
> (headers and doc) are the same and there are no risk with overwrite.
> I must update this patch.

That would be nice. However, there were some issues with the patch, so
it is not going to be good as-is. Make sure to read the discussion I
had with the original submitter. I remember spending quite some time
interacting with him/her to try to find a good solution (but that
wasn't trivial).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
