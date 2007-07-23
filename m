From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 14:10:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbset
In-Reply-To: <20070723105207.GD7044@aon.at>
References: <20070723090059.A7303A6816@busybox.net>
	<20070723105207.GD7044@aon.at>
Message-ID: <1185192626.21840.6.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-23 klockan 12:52 +0200 skrev Bernhard Fischer:
> On Mon, Jul 23, 2007 at 02:00:59AM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-07-23 02:00:58 -0700 (Mon, 23 Jul 2007)
> >New Revision: 19209
> >
> >Log:
> >Add fbset 'frame buffer set' package
> >
> >Added:
> >   trunk/buildroot/package/fbset/
> >   trunk/buildroot/package/fbset/Config.in
> >   trunk/buildroot/package/fbset/fbset-2.1-avr32.patch
> >   trunk/buildroot/package/fbset/fbset.mk
> >
> >Modified:
> >   trunk/buildroot/package/Config.in
> >
> >
> >Changeset:
> >Modified: trunk/buildroot/package/Config.in
> >===================================================================
> >--- trunk/buildroot/package/Config.in	2007-07-23 08:59:10 UTC (rev 19208)
> >+++ trunk/buildroot/package/Config.in	2007-07-23 09:00:58 UTC (rev 19209)
> >@@ -287,6 +287,7 @@
> > source "package/directfb/Config.in"
> > if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || BR2_avr32
> 
> bringing any arch into play here is wrong. Remove this, please.
> 

OK, I'll fix that, but AFAIK it is broken in busybox so It needs
to be visible even if it is a busybox package 
until someone fixes busybox.

I will remove the complete conditional until then.
I could do:
if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || BR2_ADD_BROKEN_BUSYBOX
instead.

I dont want that all BUSYBOX packages becomes visible just
because fbv and fbset needs to be visible.



> > source "package/fbv/Config.in"
> >+source "package/fbset/Config.in"
> > endif
> > source "package/jpeg/Config.in"
> > source "package/libpng/Config.in"
