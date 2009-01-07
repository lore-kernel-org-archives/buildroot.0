From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 21:31:10 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090107202243.GA17480@zelow.no> (Thomas Lundquist's message of
	"Wed\, 7 Jan 2009 21\:22\:43 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
	<1231356377.32308.424.camel@elrond.atmel.com>
	<20090107202243.GA17480@zelow.no>
Message-ID: <87mye2kgdt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

 Thomas> If it is possible to know this, the opposite is possible too,
 Thomas> and that is to keep the available options instead of hiding
 Thomas> it but show / tell the user that this will result in a
 Thomas> recompiled toolchain.

We already have this several places under packages/

comment "xorg requires a toolchain with LOCALE and WCHAR support"
comment "iperf requires a toolchain with C++ support enabled"

And so on.

 >> If you can change an option easily which forces the rebuild
 >> of a toolchian, then you can also change an option by
 >> mistake making you lose a couple of hours...

No, as packages/* depends on toolchain settings, they don't select
them.

 Thomas> Figuring out that the one little thing you wanted would be
 Thomas> available if you just turned on something in the toolchain
 Thomas> takes alot longer and frustrates alot more. That is the
 Thomas> *users* time wasted, not CPU time.

Exactly, that's what the current comments are for.

-- 
Bye, Peter Korsgaard
