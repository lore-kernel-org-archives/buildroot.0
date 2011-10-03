From: phil.edworthy at renesas.com <phil.edworthy@renesas.com>
Date: Mon, 03 Oct 2011 09:44:09 +0100
Subject: [Buildroot] [PATCH 5/9] ext-toolchain: Add CodeSourcery
	SH	GNU/Linux 2011.03
In-Reply-To: <201110030028.37488.yann.morin.1998@anciens.enib.fr>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <3d4f1d5cfa5a643be95d5f5ffb8d0e235ca3ff8c.1317583191.git.thomas.petazzoni@free-electrons.com>
 <201110030028.37488.yann.morin.1998@anciens.enib.fr>
Message-ID: <OF520B29D1.28D19F8F-ON8025791E.002EFEB7-8025791E.002FFF72@eu.necel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> To: buildroot at busybox.net
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
buildroot at uclibc.org
> Date: 02/10/2011 23:45
> Subject: Re: [Buildroot] [PATCH 5/9] ext-toolchain: Add CodeSourcery SH 
GNU/Linux 2011.03
> Sent by: buildroot-bounces at busybox.net
> 
> Thomas, All,
> 
> On Sunday 02 October 2011 21:20:13 Thomas Petazzoni wrote:
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> But see below...
> 
> > ---
> >  toolchain/toolchain-external/Config.in   |   16 ++++++++++++++++
> >  toolchain/toolchain-external/ext-tool.mk |    3 +++
> >  2 files changed, 19 insertions(+), 0 deletions(-)
> > 
> > diff --git a/toolchain/toolchain-external/Config.in 
b/toolchain/toolchain-external/Config.in
> > index ac712ba..c50acc8 100644
> > --- a/toolchain/toolchain-external/Config.in
> > +++ b/toolchain/toolchain-external/Config.in
> > @@ -137,6 +137,21 @@ config 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
> >              - e500mc glibc, 32 bits
> >              - 970 glibc hard-float, 64 bits
> > 
> > +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> > +   bool "CodeSourcery SH 2011.03"
> > +   depends on BR2_sh4a || BR2_sh4aeb
> > +   select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> > +   select BR2_INSTALL_LIBSTDCPP
> > +   help
> > +     Toolchain for the SuperH architecture, from CodeSourcery. It
> > +     uses gcc 4.5.2, binutils 2.20, glibc 2.13, uClibc 0.9.30,
> > +     gdb 7.2.50 and kernel headers 2.6.38. It has support for
> > +     the following variants:
> > +            - SH4A, glibc, little endian
> > +            - SH4A, glibc, big endian
> > +            - SH4A, uClibc, little endian
> > +            - SH4A, uClibc, big endian
> > +
> >  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
> >     bool "CodeSourcery SH 2010.09"
> >     depends on BR2_sh4a || BR2_sh4aeb
> > @@ -238,6 +253,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> >     default "mips-linux-gnu"         if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
> >     default "powerpc-linux-gnu"      if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
> >     default "sh-linux-gnu"           if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
> > +   default "sh-linux-gnu"           if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> >     default "sh-uclinux"             if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
> >     default "sh-uclinux"             if 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
> 

> There is inconsistency in the SH? namings:
>  - sh4a: _SH201009
>  - sh2a: _SH2A_201009
> 
> Notice for sh2a we have an underscore between variant and version, but 
not
> sh4a. Also, for sh2a, we have the full variant name, not for sh4a.
> 
> That's what caused my confusion earlier. Maybe we could clean this up
> in a separate patch?

The SH2A toolchain is just for SH2A uclibc, but the other SH toolchains 
should work for all other SH architectures.

All SH toolchains other than SH2A should probably be like this:
config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
    bool "CodeSourcery SH 2010.09"
    depends on !BR2_sh2a

However, I don't think anything other than SH2A and SH4A have been used 
with Buildroot for a long while.

Thanks
Phil
