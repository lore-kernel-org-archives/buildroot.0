From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Feb 2017 23:01:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-20
In-Reply-To: <20170221224804.5f901ab5@free-electrons.com>
References: <20170221072902.80C59207F9@mail.free-electrons.com>
 <20170221224230.245a035a@gmx.net>
 <20170221224804.5f901ab5@free-electrons.com>
Message-ID: <20170221230119.5750f9cd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Feb 2017 22:48:04 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

Hello Thomas,

> Hello,
> 
> On Tue, 21 Feb 2017 22:42:30 +0100, Peter Seiderer wrote:
> 
> > >       xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/ce6f506f610434dff1d0eb64644be0200d7c52f6  
> > 
> > ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
> >  #error Target architecture was not detected as supported by Double-Conversion.
> > 
> > Tried to compile with 'QT5BASE_CONFIGURE_OPTS += -no-doubleconversion', but gives:
> > 
> > Qt Core:
> >   DoubleConversion ....................... no
> >     Using system DoubleConversion ........ no
> > 
> > [...]
> > 
> > ERROR: Your C library does not provide sscanf_l or snprintf_l.
> > You need to use libdouble-conversion for double/string conversion.
> > 
> > Disable BR2_PACKAGE_QT5_VERSION_LATEST for xtensa (or xtensa/uClibc combination)?
> > 
> > 
> > Similare failure for arc:
> > 
> > >          arc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/fda8a5165cc599adfa4b3cb012916fa4dc38aeca  
> 
> Or add support to the double-conversion code?
> 
> For example, m68k support was contributed upstream:
> 
>   https://github.com/google/double-conversion/commit/da11179623145f53b204105a93b8bbca431141da

Seems simple ;-), but I think it should be done by someone with access to the target arch who can
run the double-conversion test suite...

> 
> But indeed, for the release, disabling unsupported architectures is
> probably best. Can you send a patch?

Can do..., depending on BR2_xtensa or (BR2_xtensa && BR2_TOOLCHAIN_USES_UCLIBC)?

Regards,
Peter

> 
> Thanks,
> 
> Thomas
