From: Rex Ashbaugh <rexa@xeratech.com>
Date: Wed, 25 Jul 2007 18:06:37 -0700
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
In-Reply-To: <1185407250.5580.17.camel@elrond.sweden.atmel.com>
References: <20070725173927.E0BE0A5E25@busybox.net>
	<20070725223934.GB11697@aon.at>
	<1185407250.5580.17.camel@elrond.sweden.atmel.com>
Message-ID: <6311fe0b0707251806x6e13d50dpefddd8ab6cc2a646@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DirectFB is not required.
SDL only needs the directfb.h header to build, in case directfb might be
invoked later at run time.
directfb is not used by default by SDL


-Rex


On 7/25/07, Ulf Samuelsson <ulf@atmel.com> wrote:
>
> tor 2007-07-26 klockan 00:39 +0200 skrev Bernhard Fischer:
> > On Wed, Jul 25, 2007 at 10:39:27AM -0700, ulf at uclibc.org wrote:
> > >Author: ulf
> > >Date: 2007-07-25 10:39:26 -0700 (Wed, 25 Jul 2007)
> > >New Revision: 19261
> > >
> > >Log:
> > >Make SDL seled DirectFB
> > >
> > >Modified:
> > >   trunk/buildroot/package/sdl/Config.in
> > >
> > >
> > >Changeset:
> > >Modified: trunk/buildroot/package/sdl/Config.in
> > >===================================================================
> > >--- trunk/buildroot/package/sdl/Config.in    2007-07-25 17:37:50 UTC
> (rev 19260)
> > >+++ trunk/buildroot/package/sdl/Config.in    2007-07-25 17:39:26 UTC
> (rev 19261)
> > >@@ -1,6 +1,7 @@
> > > config BR2_PACKAGE_SDL
> > >     bool "SDL"
> > >     default n
> > >+    select BR2_PACKAGE_DIRECTFB
> >
> > Why? It's perfectly fine to build SDL without
> > a) FB support (any FB support)
> > b) with the stock FB (no directfb)
> >
>
> The SDL compile failed since "directfb.h" could not be found
> so I made the assumption, that it was neccessary.
> Maybe I was wrong, but if it is not required, why the error message?
>
>
> > If you want directfb and directfb-support, the you should select it
> > manually, no?
>
> Best Regards
> Ulf Samuelsson
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070725/24f65d50/attachment.htm 
