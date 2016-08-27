From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 17:05:30 +0200
Subject: [Buildroot] [PATCH 11/16 v3] docs/manual: document the
 br2-external ID
In-Reply-To: <75fb349e-9e9b-fe93-0626-ac23a217df89@gmail.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
 <75fb349e-9e9b-fe93-0626-ac23a217df89@gmail.com>
Message-ID: <20160827150530.GG5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-06 17:48 +0200, Romain Naour spake thusly:
> Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> > Update the manual with the new external.id mandatory file.
[--SNIP--]
> > diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> > index 9ad177d..839d1b1 100644
> > --- a/docs/manual/customize-outside-br.txt
> > +++ b/docs/manual/customize-outside-br.txt
[--SNIP--]
> > @@ -77,27 +108,23 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
> >     make it appear in the top-level configuration menu, and includes
> >     +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
> >  +
> > -.Note
> > -Providing +Config.in+ and +external.mk+ is mandatory, but they can be
> > -   empty.
> > -+
> >  The main usage of this is to store package recipes. The recommended
> >     way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
> >     looks like:
> >  +
> >  ------
> > -source "$BR2_EXTERNAL/package/package1/Config.in"
> > -source "$BR2_EXTERNAL/package/package2/Config.in"
> > +source "$BR2_EXTERNAL_BAR_42/package/package1/Config.in"
> > +source "$BR2_EXTERNAL_BAR_42/package/package2/Config.in"
> >  ------
> >  +
> >  Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:

s/BR2_EXTERNAL/BR2_EXTERNAL_BR_42/

> >  ------
> > -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
> > +include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42)/package/*/*.mk))
> >  ------
> >  +
> > -And then in +$(BR2_EXTERNAL)/package/package1+ and
> > -   +$(BR2_EXTERNAL)/package/package2+ create normal Buildroot
> > +And then in +$(BR2_EXTERNAL_FOO_42)/package/package1+ and
> > +   +$(BR2_EXTERNAL_FOO_42)/package/package2+ create normal Buildroot
> 
> Here BR2_EXTERNAL_FOO or BR2_EXTERNAL_BAR_42 ?
> BR2_EXTERNAL_BAR_42 it seems ;-)

Yes.

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
