From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 17:51:38 +0100
Subject: [Buildroot] [PATCH] package/libbsd: not available for arc
In-Reply-To: <20171029173456.5007a31e@windsurf>
References: <20171029155547.25602-1-yann.morin.1998@free.fr>
 <20171029173456.5007a31e@windsurf>
Message-ID: <20171029165138.GD2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-29 17:34 +0100, Thomas Petazzoni spake thusly:
> On Sun, 29 Oct 2017 16:55:47 +0100, Yann E. MORIN wrote:
> > diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> > index 9b5b89812f..091b668075 100644
> > --- a/package/libbsd/Config.in
> > +++ b/package/libbsd/Config.in
> > @@ -1,7 +1,9 @@
> >  config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> >  	bool
> > -	# libbsd does not support the MicroBlaze ELF machine type (see local-elf.h)
> > -	default y if !BR2_microblaze
> > +	# libbsd does not support those architectures (see src/local-elf.h)
> > +	default y
> > +	depends on !BR2_microblaze
> > +	depends on !BR2_arcle && !BR2_arcle
> 
> Really? I guess you wanted to also exclude ARC big-endian, no?

Yeah, obviously. :-/

> Also, I believe it would be useful to explain in the commit log why
> this problem was not visible before: because libbsd depends on glibc,
> and we only recently enabled glibc support for ARC.

OK, will do.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
