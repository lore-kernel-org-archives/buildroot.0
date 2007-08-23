From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 23 Aug 2007 18:25:59 +0100
Subject: [Buildroot] [Fwd: Re: Struggling with undefined reference to
	`__fgetc_unlocked']
In-Reply-To: <46CDBC95.7040803@st.com>
References: <46CDB91F.80307@st.com>
	<d6cda7730708230953y52b03167t55d124cb50b67603@mail.gmail.com>
	<46CDBC95.7040803@st.com>
Message-ID: <d6cda7730708231025t391a2263xed883aa16e1a8e84@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the help. It was indeed using the uClibc includes with the
CXXFLAGS/CFLAGS being set at the qtopia4.mk. I will send a patch as
soon as I confirm this is working. But at least so far compilation got
past rcc.

On 8/23/07, Carmelo AMOROSO <carmelo.amoroso@st.com> wrote:
> Thiago A. Corr?a wrote:
> > That file actually calls fgetc, so I guess it's a dreadfull define :P
> >
> > I suppose it is using uClibc headers instead of the native compiler ones.
> >
> Run the compiler with -v to see which -I directives it is using... where
> it is looking for C headers.
> If you are using a plain g++ from the host, I don't think it's using
> uClibc headers.
> > On 8/23/07, Carmelo AMOROSO <carmelo.amoroso@st.com> wrote:
> >
> >> my reply below
> >>
> >> -------- Original Message --------
> >> Subject:        Re: [Buildroot] Struggling with undefined reference to
> >> `__fgetc_unlocked'
> >> Date:   Thu, 23 Aug 2007 18:42:31 +0200
> >> From:   Carmelo Amoroso <carmelo.amoroso@st.com>
> >> Organization:   STMicroelectronics
> >> To:     "Thiago A. Corr?a" <thiago.correa@gmail.com>
> >> References:
> >> <d6cda7730708230925x19bc0901v9a6dd1f18ee325ec@mail.gmail.com>
> >> <46CDB759.709@st.com>
> >> <d6cda7730708230939p7b126fe1mbe28768aa4413bb4@mail.gmail.com>
> >>
> >>
> >>
> >> Thiago A. Corr?a wrote:
> >>
> >>> Hi Carmelo,
> >>>
> >>>    That command returned
> >>> gentoo-vm buildroot # readelf -s /lib/libc.so.6 | grep fgetc_unlocked
> >>>   1868: 0005e040    40 FUNC    WEAK   DEFAULT   11 fgetc_unlocked@@GLIBC_2.1
> >>> gentoo-vm buildroot #
> >>>
> >>>    I'm guessing the prepended underscores are due to mangling, but
> >>> could be wrong.
> >>>
> >>>
> >> Not, they are part of the symbol's name... you need to fix qtopia to
> >> call the fgetc_unlocked.
> >>
> >> Cheers
> >>
> >>> On 8/23/07, Carmelo AMOROSO <carmelo.amoroso@st.com> wrote:
> >>>
> >>>
> >>>> Thiago A. Corr?a wrote:
> >>>>
> >>>>
> >>>>> Hi,
> >>>>>
> >>>>>    I'm struggling with qtopia. During the link of rcc (which is a host
> >>>>> tool, natively compiled) I get:
> >>>>>
> >>>>> I googled for the error, but could only find ppl complaining about
> >>>>> this when linking against uClibc, when this should be linking against
> >>>>> the system glibc. Does anyone has an idea of what I could try?
> >>>>>
> >>>>> Regards,
> >>>>>     Thiago A. Correa
> >>>>>
> >>>>>
> >>>>>
> >>>> Which glibc version have you installed on your host?
> >>>> For example, on my RHEL 3 there is glibc-2.3.4 which doesn't contain the
> >>>> __fgetc_unlocked
> >>>> symbol, while fgetc_unlocked (no underscore prepending)...
> >>>> so just check your glibc by running 'readelf -s /lib/libc.so.6 | grep
> >>>> fgetc_unlocked'
> >>>> and see what it returns.
> >>>>
> >>>> Regards,
> >>>> Carmelo
> >>>>
> >>>>
> >>>>
> >>>>> _______________________________________________
> >>>>> buildroot mailing list
> >>>>> buildroot at uclibc.org
> >>>>> http://busybox.net/mailman/listinfo/buildroot
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at uclibc.org
> >> http://busybox.net/mailman/listinfo/buildroot
> >>
> >>
>
>
