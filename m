From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 14:33:36 +0100
Subject: [Buildroot] [Fwd: Re: Struggling with undefined reference to
	`__fgetc_unlocked']
In-Reply-To: <1188211076.7840.5.camel@localhost.localdomain>
References: <46CDB91F.80307@st.com>
	<d6cda7730708230953y52b03167t55d124cb50b67603@mail.gmail.com>
	<46CDBC95.7040803@st.com>
	<d6cda7730708231025t391a2263xed883aa16e1a8e84@mail.gmail.com>
	<20070823201759.GO11697@aon.at>
	<1188211076.7840.5.camel@localhost.localdomain>
Message-ID: <d6cda7730708270633g41662ec3h345cd0fb256756c1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    Good to see you around, hopefully we will see some patches closing
the gap between the svn and atmel buildroot :)
    Actually current SVN is still unable to build qtopia. To be more
precise, current SVN fails building the toolchain now *sigh*. But
-r19700 (4 revisions ago) has the exact same problem, and qtopia4.mk
haven't been touched in the between. The patch I sent last night to
the list fixes the build. Also, on the AVR32, for some reason make
install doesn't copy over qatomic_avr32.h. The patch I sent also
addresses this, perhaps not in the best way possible, but I can't
figure out how to do it in a qtopia patch as there is no differences
between the avr32 and the arm as far as qt build system is concerned.
They are both in the appropriate folder names and .pri files.

    Still on the Qtopia subject, one has to do LIBS -= -ldl in a
qtopia project to be able to link. Linker complains about undefined
symbols. This I have been trying to fix since friday with no success,
so I took the easy path in my project for now, not linking against
libdl.so

Cheers,
    Thiago A. Correa

On 8/27/07, Hans-Christian Egtvedt <hcegtvedt@atmel.com> wrote:
>
> On Thu, 2007-08-23 at 22:18 +0200, Bernhard Fischer wrote:
> > On Thu, Aug 23, 2007 at 06:25:59PM +0100, Thiago A. Corr?a wrote:
> > >Thanks for the help. It was indeed using the uClibc includes with the
> > >CXXFLAGS/CFLAGS being set at the qtopia4.mk. I will send a patch as
> > >soon as I confirm this is working. But at least so far compilation got
> > >past rcc.
> >
> > There was talks about qtopia before. IIRC there is no need to compile it
> > for the host in the first place.
>
> Correct, only a two-stage build for the target is necessary. But Qtopia
> compiles some tools with the host compiler (qmake, moc, rcc and uic).
>
> Before the late fixes in Qtopia in Buildroot, some bad CFLAGS and
> CXXFLAGS was set when configuring, causing the Qtopia build system to
> use wrong headers (i.e. target headers when compiling the host tools).
>
> AFAIK everything should be in order in latest SVN.
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
>
