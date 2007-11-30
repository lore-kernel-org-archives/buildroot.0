From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 30 Nov 2007 12:51:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libosip2
In-Reply-To: <474FF6C3.8020107@promwad.com>
References: <20071130102837.4DBEBA6AB6@busybox.net>
	<474FF6C3.8020107@promwad.com>
Message-ID: <1196423486.4635.19.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-11-30 klockan 13:40 +0200 skrev Ivan Kuten:
> > 
> > 
> > Changeset:
> > Modified: trunk/buildroot/package/Config.in
> > ===================================================================
> > --- trunk/buildroot/package/Config.in	2007-11-30 09:12:09 UTC (rev 20593)
> > +++ trunk/buildroot/package/Config.in	2007-11-30 10:28:36 UTC (rev 20594)
> > @@ -153,6 +153,7 @@
> >  source "package/l2tp/Config.in"
> >  source "package/libcgi/Config.in"
> >  source "package/libcgicc/Config.in"
> > +source "package/libosip2/Config.in"
> >  source "package/libpcap/Config.in"
> >  source "package/links/Config.in"
> >  source "package/lrzsz/Config.in"
> > @@ -415,4 +416,14 @@
> >  source "package/php/Config.in"
> >  endif
> >  
> > +menuconfig BR2_GAMES
> > +	bool "Games"
> > +	default y
> > +	help
> > +	  Support for games
> > +
> > +if BR2_GAMES
> > +source "package/lxdoom/Config.in"
> > +endif
> > +
> >  endmenu

Mistake, trying to add Doom as well so that slipped through.
Doom fails to compile on ARM due to packing, but I might as well 
add it since is should compile on AVR32.

> 
> Hi Ulf,
> 
> Did you intentionally commit BR2_GAMES?
> You mentioned only libosip2 package in your commit log.
> 
> Regards,
> Ivan
-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
Mail: Box 2033, 174 50 Sundbyberg
Visit:Kavalleriv?gen 24, 174 58 Sundbyberg
Phone: +46 8 441 54 22, GSM: +46 706 22 44 57
eMail: ulf at atmel.com
