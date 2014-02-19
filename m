From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 09:13:36 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <20140219024634.GT184@brightrain.aerifal.cx>
References: <20140218231447.524a1a20@skate>
 <20140218231759.GS184@brightrain.aerifal.cx>
 <20140219002643.50795999@skate>
 <20140219024634.GT184@brightrain.aerifal.cx>
Message-ID: <20140219091336.71fbd261@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rich Felker,

On Tue, 18 Feb 2014 21:46:34 -0500, Rich Felker wrote:

> > In fact, I am myself interested in musl: I have already added the
> > possibility of using external musl toolchains with Buildroot, and I
> > have started to work on integrating musl support in the internal
> > toolchain backend of Buildroot. So you can clearly expect musl to be
> > fully supported by Buildroot in the coming months.
> 
> Great. If you haven't already seen them, the GCC patches at
> http://musl.codu.org/ may be useful.

I have definitely seen them, and used them already in the preliminary
prototypes. I have even posted a bug report some time ago:

  https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on

> This sounds reasonable. In this light, it might be good to hold off on
> switching away from uClibc for a little longer. This would give some
> time to evaluate what can be done to maintain uClibc support, and if
> not, you would have a chance to evaluate musl in Buildroot to
> determine whether musl or glibc might be a better choice for the new
> default.

This discussion about changing the default C library is definitely not
something for which we expect to make a change in the immediate future.
We're just looking at options, and trying to see what can be done to
revive the uClibc project, which remains important at least to support
non-MMU architectures.

> (BTW, if you do switch the default, do you have a plan for
> how long uClibc support would be maintained as the non-default
> option?)

We haven't discussed this, but I believe we would in any case keep
uClibc support around, even if it's no longer the default. Simply
because there are several non-MMU architectures that we want to
support, and only uClibc supports such architectures.

> > Do you intend to have support for non-MMU architectures in musl?
> 
> At present there isn't a plan to, but we're not particularly opposed
> to it either. The big questions are how invasive it would be and
> whether we can provide full functionality in any reasonable way. The
> answers to those questions wouldn't translate directly to a yes or no
> but would be an important part of considerations. It would probably
> help to have someone familiar with the technical aspects of supporting
> non-MMU archs discuss it with us on our mailing list or IRC channel.

Ok.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
