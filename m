From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 31 Jul 2007 12:15:26 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to
	run	target binaries	on build machine
In-Reply-To: <20070731093827.GA18869@zelow.no>
References: <1185796725.27015.7.camel@localhost.localdomain>
	<20070730185416.GA23362@zelow.no>
	<1185870123.14026.4.camel@localhost.localdomain>
	<20070731093827.GA18869@zelow.no>
Message-ID: <1185876926.18111.2.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 2007-07-31 at 11:38 +0200, Thomas Lundquist wrote:
> On Tue, Jul 31, 2007 at 10:22:03AM +0200, Hans-Christian Egtvedt wrote:
> > 
> > As I said, it tries to execute moc, but moc is compiled for the target.
> 
> Weird.
> 
> > The problem arises when building the target Qtopia, it tries to use moc
> > et.al compiled for the target architecture. And when running a
> > big-endian AVR32 binary on my little-endian x86 laptop, it fails ;)
> 
> But of course.
> 
> the weird part is that the makefile was made for compiling qtopia on
> ARM, which means moc & co was compiled for the right platform(s).

Just to clearify something, is moc & co meant to be compiled for the
target architecture?

If not, I do not really understand why this is a two stage build.

> > Suggestions are very welcome, I am trying to clean up this package.
> 
> I'll start working on fixing this right now.
> (Believe me, you'd like not to find out why it's as messy as it is.)

I have already dug a bit into it and have some suggestions when I
understand how it was ment to work. If you see a solution quickly, I
will gladly test a patch.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
