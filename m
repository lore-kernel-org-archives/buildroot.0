From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Sat, 28 Jan 2012 21:03:50 +0000
Subject: [Buildroot] first things first for a newbie
In-Reply-To: <CAGm1_ks0o1+P_6a_V1Ty9Y8SGMW6A8NNOa+EaJqcTvFLS-J-Eg@mail.gmail.com>
References: <CAPEB33x-LxCP9mz0hhH6dr5-Hftke3EjNLyVMt4s7kfd_0cCiw@mail.gmail.com>
 <CAGm1_ks0o1+P_6a_V1Ty9Y8SGMW6A8NNOa+EaJqcTvFLS-J-Eg@mail.gmail.com>
Message-ID: <CAPEB33x-HBHgErro7-Qb-dLs9Nm=wCo7GCMWu43Zjo7e+M1kvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,
  I've already tested CS and EDLK ToolChain. For "normal" use they are good
enough and work well. But they are 2 thinks I don't like:
    i)    We are dependant of a company (i.e DENX, MENTOR GRAPHIC...) they
do what they like...
    ii)   When you want to use MPFR/OMP or some other features I think is
better to know how to build his own personnal stuff.

   That's why I try to learn this way. And it's a good training I guess
before going further :o))

bye

Johann

On 28 January 2012 19:39, Yegor Yefremov <yegorslists@googlemail.com> wrote:

> On Sat, Jan 28, 2012 at 8:32 PM, MERCADIER Johann
> <johann.mercadier@imerir.com> wrote:
> > Hello everybody,
> >   I am newbie in the embedded computer world. I first start with
> Buildroot
> > as it seems to be more "simple" and straight forward while having to deal
> > with just few configs and cards.
> >   But! nothing seems to way it should and I feel pretty annoyed by this
> as I
> > cannot find any relevant help on the internet or through misc. books.
> Most
> > of the time what I found is tutorial where everything seems to work fine.
> >   So my first question is why Buildroot has no Forum or a good developped
> > FAQ? I don't really understand why it so great to work with mailing
> list? If
> > I have to I will do it this way  (o_-)
> >
> >   My second question is more technical and is related to PandaBoard. I
> > finally decided to by one for misc purposes. To build everything I need I
> > got first Buildroot 2011.11
> >
> >    I use the following:
> >      BR2_DEFAULT_KERNEL_HEADERS="3.0.4"
> >      BR2_UCLIBC_VERSION_STRING="0.9.32"
> >      BR2_BINUTILS_VERSION="2.21.1"
> >      BR2_TOOLCHAIN_BUILDROOT=y
> >      BR2_cortex_a9=y
> >      BR2_ARM_TYPE="ARM_CORTEXA9"
> >      BR2_ARM_EABI=y
> >      BR2_ARCH="arm"
> >      BR2_ENDIAN="LITTLE"
> >      BR2_GCC_TARGET_TUNE="cortex-a9"
> >      BR2_GCC_TARGET_ARCH="armv7-a"
> >      BR2_GCC_TARGET_ABI="aapcs-linux"
> >      BR2_arm=y
> >
> >   When I try to build the TC it doesn't work well and I get an issue with
> > 'gettext' while I've got everything on my host computer. I then remove
> all
> > related part to gettext as i18n stuff and WCHAR then I got a TC. Then I
> do
> > again a 'make menuconfig' add the locale and do a 'time make V=1' I got
> a TC
> > whith the locale. strange behaviour, probably some dependencies and jobs
> to
> > be done in a given order?
> >   On the next stage I try to go further  configuring the uClibc, busybox,
> > and file support everything working fine, then I got such a kind of
> error if
> > I try to add GDB for the target, host, and server part
> > "
> >
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:22:29:
> > error: expected ')' before 'ucs'
> >
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:72:21:
> > error: expected ')' before 'ucs'
> >
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:139:28:
> > error: expected ';', ',' or ')' before '*' token
> >
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:161:32:
> > error: expected ')' before 'ucs'
> >
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:230:32:
> > error: expected ';', ',' or ')' before '*' token
> > make[3]: *** [wcwidth.o] Error 1
> > make[2]: *** [all-readline] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [all] Error 2
> > make: ***
> >
> [/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/build/gdb-7.3.1-target/gdb/gdb]
> > Error 2
> > "
> >  I don't know what to look after, should I have a look into the
> 'wcwidth.c'
> > program file? Could it be wrong? or it come from some other part.
>
> Have you tried one of the CodeSourcery toolchains? It will save a lot
> of build time.
>
> Yegor
>



-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120128/2e15a143/attachment.html>
