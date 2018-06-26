From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jun 2018 20:11:31 +0200
Subject: [Buildroot] [PATCH v2,3/3] boost: fiber selects context
In-Reply-To: <20180626093137.5c3b0d22@windsurf.home>
References: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
 <20180625220237.15217-3-fontaine.fabrice@gmail.com>
 <20180626093137.5c3b0d22@windsurf.home>
Message-ID: <CAPi7W82dco--JgF7stzM3ga8HbTF_1SrxXJfNiO_ZD_6oyYDPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-26 9:31 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> Thanks for this new iteration!
>
> On Tue, 26 Jun 2018 00:02:37 +0200, Fabrice Fontaine wrote:
>
> >  config BR2_PACKAGE_BOOST_FIBER
> >       bool "boost-fiber"
> > +     depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> >       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >       # mips support uses the "pause" instruction, only available
> >       # since mips32r2/mips64r2.
> >       depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
> > +     depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
> >       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
> > +     select BR2_PACKAGE_BOOST_CONTEXT
> >       help
> >         C++11 userland threads library.
> >
> >  comment "boost-fiber needs a toolchain w/ NPTL"
> > +     depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >
> > +comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
> > +     depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> > +     depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > +
> >  comment "boost-fiber needs a toolchain not affected by GCC bug 85180"
> > +     depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> >       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
>
> Perhaps a single comment for the gcc bugs is enough, i.e:
>
> comment "boost-fiber needs a toolchain not affected by GCC bugs 64735,
> 85180"
>
> if you agree, no need to respin just for this change, we can fix it
> when applying.
>
I agree, you can update before applying, thanks.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180626/c3ecfe07/attachment.html>
