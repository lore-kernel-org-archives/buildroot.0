From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 18:25:00 +0200
Subject: [Buildroot] [PATCH] doc/manual: fix generating manual after
	legacy overhaul
In-Reply-To: <5543A1C9.2070801@mind.be>
References: <1430492786-17842-1-git-send-email-yann.morin.1998@free.fr>
 <5543A1C9.2070801@mind.be>
Message-ID: <20150501162500.GG4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 17:54 +0200, Arnout Vandecappelle spake thusly:
> On 01/05/15 17:06, Yann E. MORIN wrote:
[--SNIP--]
> > Also, slightly re-order variables so the ones we override come right
> > after the common settings, moving the specific pnes at the end.
>                                                  ones
> 
>  And split into one variable per line.

No, I did not want to explicitly set one variable per line.

The fact that BR2_DEFCONFIG and BR2_EXTERNAL are on their own line each
is just becasue the line would be more than 80-char wide otherwise.

But if you prefer I put a single vazriable per line, I'm OK with that; I
also prefer a single variable per line.

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  docs/manual/manual.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> > index d5db2c2..2755582 100644
> > --- a/docs/manual/manual.mk
> > +++ b/docs/manual/manual.mk
> > @@ -12,8 +12,10 @@ MANUAL_RESOURCES = $(TOPDIR)/docs/images
> >  # should not be included in the manual.
> >  define MANUAL_GEN_LISTS
> >  	$(Q)$(call MESSAGE,"Updating the manual lists...")
> > -	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(@D) \
> > +	$(Q)$(COMMON_CONFIG_ENV) \
> > +		BR2_DEFCONFIG="" \
> >  		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
> > +		TOPDIR=$(TOPDIR) O=$(@D) \
> 
>  Except here you put two variables on a single line...

Because that was not the goal! ;-)

But I'll change.

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
