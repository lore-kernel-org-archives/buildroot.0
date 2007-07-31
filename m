From: Allan Clark <allanc@chickenandporn.com>
Date: Tue, 31 Jul 2007 08:26:49 -0400
Subject: [Buildroot] Qtopia4 fails building - target stage tries to run
	target binaries on build machine
In-Reply-To: <20070731093827.GA18869@zelow.no>
References: <1185796725.27015.7.camel@localhost.localdomain>
	<20070730185416.GA23362@zelow.no>
	<1185870123.14026.4.camel@localhost.localdomain>
	<20070731093827.GA18869@zelow.no>
Message-ID: <37c712e0707310526n3e3a8c64v33b7717bad6fd464@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/31/07, Thomas Lundquist <lists@zelow.no> wrote:
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

...but qmake and moc are supposed to run on the build host, not on the
target.  They are only used during development, not during runtime.

Allan
