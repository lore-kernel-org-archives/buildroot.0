From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 08 Jan 2009 00:42:57 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090107202243.GA17480@zelow.no>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
	<1231356377.32308.424.camel@elrond.atmel.com>
	<20090107202243.GA17480@zelow.no>
Message-ID: <1231371777.32308.608.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 21:22 +0100 skrev Thomas Lundquist:
> On Wed, Jan 07, 2009 at 08:26:17PM +0100, Ulf Samuelsson wrote:
> > 
> > It doesn't rebuild automatically right now.
> > 
> > I think that this is the main reason why I think 
> > the toolchain should be separate.
> 
> > When the toolchain has been build it should generate
> > Config.in files automatically, which is included
> > by the Buildroot Config.in.
> 
> With only the options working with that specific toochain? 
> 
> That will hide the users real options.

If the user wants to know which options he has to build the
toolchain, then he will have to configre the toolchain.

It is the same with busybox, uClibc and linux. 
You can only configure  a few things from buildroot.

> 
> > You will then have access to the toolchain
> > parameters, but you will not have the ability
> > to add packages depending on non avaialble options.
> 
> If it is possible to know this, the opposite is possible too, and that is 
> to keep the available options instead of hiding it but show / tell the 
> user that this will result in a recompiled toolchain.

I think it could be harder to implement.
I do agree that you do not want a package to be totally
invisible, just because of an toolchain option.
I think that if a package IS disabled, then it could still be visible,
but the reason for it to be impossible to select is shown.


> (One reason I am a bit recultant to do this automagically, that it turning on the 
>  nessesary toolchain options is that options like WCHAR adds alot.)
> 
> > If you can change an option easily which forces the rebuild
> > of a toolchian, then you can also change an option by
> > mistake making you lose a couple of hours...
> 
> Figuring out that the one little thing you wanted would be available if 
> you just turned on something in the toolchain takes alot longer and 
> frustrates alot more. That is the *users* time wasted, not CPU time.

You need the information, but if you instead of:

[ ] socat

would get

--- socat -- needs toolchain with WCHAR

Would that be uncacceptable?

Maybe you could get an even better
description if each package had 
a menuconfig if the package cannot be
selected with the package name in CAPITALS.

[ ] NO SOCAT 

If cyou check the box you get
?
[*] NO SOCAT 
--- toolchain must be built with WCHAR enabled
--- socat requires pacakge <x>

You may have to set a global variable to enable 
the reason for hiding a package.

Will complicate the Config.in files a lot, but 
would sure be nice.
It is hard searching through the Config tree help



> I'd rather have a warning of some sort.
> 
> 
> 
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
