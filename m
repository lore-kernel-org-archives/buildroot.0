From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Jan 2009 10:00:37 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231371777.32308.608.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 08 Jan 2009 00\:42\:57 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
	<1231356377.32308.424.camel@elrond.atmel.com>
	<20090107202243.GA17480@zelow.no>
	<1231371777.32308.608.camel@elrond.atmel.com>
Message-ID: <87ljtmrx3e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Figuring out that the one little thing you wanted would be
 >> available if you just turned on something in the toolchain takes
 >> alot longer and frustrates alot more. That is the *users* time
 >> wasted, not CPU time.

 Ulf> You need the information, but if you instead of:

 Ulf> [ ] socat

 Ulf> would get

 Ulf> --- socat -- needs toolchain with WCHAR

 Ulf> Would that be uncacceptable?

That's what we have already for a bunch of packages.

 Ulf> Maybe you could get an even better
 Ulf> description if each package had 
 Ulf> a menuconfig if the package cannot be
 Ulf> selected with the package name in CAPITALS.

 Ulf> [ ] NO SOCAT 

 Ulf> If cyou check the box you get
 Ulf> ?
 Ulf> [*] NO SOCAT 
 Ulf> --- toolchain must be built with WCHAR enabled
 Ulf> --- socat requires pacakge <x>

No, packages should just select their (library) dependencies, instead
of asking the user to hunt around for those dependencies.

So in short:
 - Depend on toolchain details (and display comment if not available)
 - Select package dependencies

-- 
Bye, Peter Korsgaard
