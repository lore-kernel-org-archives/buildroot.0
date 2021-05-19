From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 09:09:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/nasm: add CPE variables
In-Reply-To: <20210519070046.GE2268078@scaer>
References: <20210519064908.1633187-1-fontaine.fabrice@gmail.com>
 <20210519070046.GE2268078@scaer>
Message-ID: <CAPi7W827ELVBwqY4fSo6ikPmzc+ymbzVQUoCJnC2puG7UoPpLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 19 mai 2021 ? 09:00, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2021-05-19 08:49 +0200, Fabrice Fontaine spake thusly:
> > cpe:2.3:a:nasm:netwide_assembler is a valid CPE identifier for this
> > package:
> >
> >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anasm%3Anetwide_assembler
>
> I noticed that there are entries that do not look like they are valid
> nasm versions:
>
>     https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=CPEURI&keyword=cpe%3A2.3%3Aa%3Anasm%3Anetwide_assembler&status=FINAL&startIndex=280
>
>     cpe:2.3:a:nasm:netwide_assembler:12.14:rc1:*:*:*:*:*:*
Indeed, I assume that there is a spurious "1" and it should be
2.14.rc1: https://www.nasm.us/pub/nasm/releasebuilds/2.14rc1/
>     through
>     cpe:2.3:a:nasm:netwide_assembler:12.14:rc16_:*:*:*:*:*:*
And this one should be 2.14.rc16:
https://www.nasm.us/pub/nasm/releasebuilds/2.14rc16/
>
> That's a bit weird... :-/
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/nasm/nasm.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
> > index b44b97e62b..ecb0889363 100644
> > --- a/package/nasm/nasm.mk
> > +++ b/package/nasm/nasm.mk
> > @@ -9,5 +9,7 @@ NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
> >  NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
> >  NASM_LICENSE = BSD-2-Clause
> >  NASM_LICENSE_FILES = LICENSE
> > +NASM_CPE_ID_VENDOR = nasm
> > +NASM_CPE_ID_PRODUCT = netwide_assembler
> >
> >  $(eval $(host-autotools-package))
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
