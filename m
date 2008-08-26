From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 10:32:40 +0100
Subject: [Buildroot] Static Library Building - On/Off/Configurable?
Message-ID: <1219743160.9701.5.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Currently many of the packages that are in buildroot have a setting of
--enable-static

This takes extra compile time and seems somewhat unnecessary.  It means
that it is not very configurable. (default on)
What are peoples opinion on using the following:

ifeq ($(BR2_PREFER_STATIC_LIB),y)
	OPT_STATIC = --enable-static
endif

This could be added(not quite like above but similar) to
Makefile.autotools.in, 
I believe that --enable-static is a default parameter to configure
scripts so that should be safe, its just it would mean a central
'switch' to enable static compilation and would make things a lot
simpler.

Dan Laird
