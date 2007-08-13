From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 13 Aug 2007 22:30:03 +0200
Subject: [Buildroot] Adding __UCLIBC__ to build
Message-ID: <1187037003.6223.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am looking at TinyX at the moment and there are tons of warnings due
to "bcopy", "bzero" and similar routines are beeing redefined.
They are defined in a header file, included by TinyX.

TinyX will test some flags to check the environment
and if no flag is found, it will default to 
defining such calls as macros.

I am thinking of adding a flag in package/Makefile.in
to cover such situations:

TARGET_CFLAGS+=-D__UCLIBC__

This would allow future situations like this to be easily handled.

FOr TinyX it can be added to the cross.def file instead.

Any comments?

Best Regards
Ulf Samuelsson
