From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Dec 2015 17:08:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/gawk: clean the mpfr dependency
In-Reply-To: <5660D1B6.5040404@mind.be>
References: <cover.1449181275.git.yann.morin.1998@free.fr>
 <6dcb0e2bfe0573ddcfba8f9b7c90d18090c46a1a.1449181275.git.yann.morin.1998@free.fr>
 <5660D1B6.5040404@mind.be>
Message-ID: <20151205160851.GA3666@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-04 00:35 +0100, Arnout Vandecappelle spake thusly:
> On 03-12-15 23:22, Yann E. MORIN wrote:
> > When available, mpfr provides support for BIGNUM, which allows gawk to
> > work on arbitrarily-large numbers (hence the name).
> > 
> > Forcibly disable mpfr if the mpfr package is not enabled. Let
> > ./configure find it automatically when it is enabled.
> > 
> > To be noted, the host-gawk needs not have BIGNUM to build the target
>                              ^^^^^^^^^ doesn't need to have

No, sorry, this was correct english grammar:
    https://dictionary.cambridge.org/grammar/british-grammar/need

    We form the negative by adding not after need. Need not can be
    contracted to needn?t. We don?t use don?t/doesn?t/didn?t with the
    semi-modal verb need:

    You need not spend a lot of money on presents. (formal) (or You
    needn?t spend a lot of money on presents.)

    Not: You don?t need spend a lot of money on presents.

Or:
    http://www.merriam-webster.com/dictionary/need

    verbal auxiliary
    : be under necessity or obligation to <you need not answer>
    <she need only wait> 

In this case, 'need' is a verbal auxiliary, not a transitive verb (and
even less so an intransitive verb).

(yes, in case you still had a doubt, I speak british English, not
american English.)

> > variant with support for BIGNUM.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Just minor comments.
> 
> > ---
> >  package/gawk/gawk.mk | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> > index 6702c48..74c1fe4 100644
> > --- a/package/gawk/gawk.mk
> > +++ b/package/gawk/gawk.mk
> > @@ -7,7 +7,7 @@
> >  GAWK_VERSION = 4.1.3
> >  GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
> >  GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
> > -GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
> > +GAWK_DEPENDENCIES = host-gawk
> >  GAWK_LICENSE = GPLv3+
> >  GAWK_LICENSE_FILES = COPYING
> >  
> > @@ -16,6 +16,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> >  GAWK_DEPENDENCIES += busybox
> >  endif
> >  
> > +# When enabled, let ./configure find it automatically
> 
>  I think a more appropriate comment would be
> 
> # --with-mpfr requires an argument so just let configure
> # find it automatically.

OK, will fix.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
