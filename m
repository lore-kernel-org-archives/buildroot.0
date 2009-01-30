From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 10:31:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF39BE529@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Fri\,
	30 Jan 2009 10\:22\:37 +0100")
References: <20090130074016.0A323765E9@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1AF39BE4AC@EU1RDCRDC1WX029.exi.nxp.com>
	<1233306201.4147.79.camel@elrond.atmel.com>
	<C13DBBE85AD6974B85C118C35890CA5F1AF39BE529@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87myd9nnra.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

 Daniel> I have looked at the dbus makefile and under the section
 Daniel> dbus: uclibc ...... 
 Daniel> should you not add libxml2 or expat with a check on if it is enabled or not.

 Daniel> I can see the comment in dbus.mk but it stil seems this is
 Daniel> the only package that has done this fix.  Usually you just
 Daniel> add all the pkg dependencies to the packagename: ..... list
 Daniel> and buildroot seems to get it right in all the packages I
 Daniel> have built anyway, why is dbus different?

I added that comment long time ago as part of trying to get the
dependencies right to run the top level makefile with stuff in
parallel (-jX). We are not doing that (and it would take quite some
work to get there), so it can be ignored.

I would also think that simply adding expat/libxml to the dbus:
dependency would be enough,

-- 
Bye, Peter Korsgaard
