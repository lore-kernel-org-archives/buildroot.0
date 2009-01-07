From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 7 Jan 2009 21:22:43 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231356377.32308.424.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no>
	<87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no>
	<873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
	<1231356377.32308.424.camel@elrond.atmel.com>
Message-ID: <20090107202243.GA17480@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 07, 2009 at 08:26:17PM +0100, Ulf Samuelsson wrote:
> 
> It doesn't rebuild automatically right now.
> 
> I think that this is the main reason why I think 
> the toolchain should be separate.

> When the toolchain has been build it should generate
> Config.in files automatically, which is included
> by the Buildroot Config.in.

With only the options working with that specific toochain? 

That will hide the users real options.

> You will then have access to the toolchain
> parameters, but you will not have the ability
> to add packages depending on non avaialble options.

If it is possible to know this, the opposite is possible too, and that is 
to keep the available options instead of hiding it but show / tell the 
user that this will result in a recompiled toolchain.

(One reason I am a bit recultant to do this automagically, that it turning on the 
 nessesary toolchain options is that options like WCHAR adds alot.)

> If you can change an option easily which forces the rebuild
> of a toolchian, then you can also change an option by
> mistake making you lose a couple of hours...

Figuring out that the one little thing you wanted would be available if 
you just turned on something in the toolchain takes alot longer and 
frustrates alot more. That is the *users* time wasted, not CPU time.

I'd rather have a warning of some sort.



Thomas.
