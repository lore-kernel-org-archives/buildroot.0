From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Thu, 12 Mar 2015 21:02:26 +0100
Subject: [Buildroot] [PATCH v6 3/3] GNURadio: new package
In-Reply-To: <5500CC64.50501@mind.be>
References: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
 <1426076003-12088-3-git-send-email-gwenj@trabucayre.com>
 <5500CC64.50501@mind.be>
Message-ID: <20150312210226.7f7f352d@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2015 00:14:44 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/03/15 13:13, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
>  Unfortunately I still have a few comments. But I think GNURadio is a really
> useful package for buildroot (or vice versa :-).
> 
> > ---
[snip]
> > +# host-python-cheetah is needed for volk to compile
> > +GNURADIO_DEPENDENCIES = \
> > +		host-python-cheetah \
> > +		host-swig \
> 
>  Isn't host-swig only needed when python is enabled? Or does volk also require it?
>
(host-)swig is only needed for the compilation. At runtime is no more needed.
>
[snip]
> > +endif
> > +
> > +# As soon as -mfpu=neon is supported by the compiler, gnuradio will try
> > +# to use it. But having NEON support in the compiler doesn't necessarily
> > +# mean we have NEON support in our CPU.
> > +ifeq ($(BR2_ARM_CPU_HAS_NEON),)
> > +GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
> 
>  I don't find anything that looks like this CMake variable in the source... Are
> you sure it does anything?
> 
Yes, it disable all hf/neon optimization. If it is use unconditionnaly the
previous WA is not needed but volk is not optimized for hf/neon.
> 
>  Regards,
>  Arnout
> 
Regards,

Gwen
