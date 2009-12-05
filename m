From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 5 Dec 2009 14:27:39 -0600
Subject: [Buildroot] Help?  What happend to the Help on 2009.11?
In-Reply-To: <200912051228.38084.minimod@morethan.org>
References: <200912050946.13315.minimod@morethan.org>
	<200912051228.38084.minimod@morethan.org>
Message-ID: <200912051427.41212.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat December 5 2009, Michael S. Zick wrote:
> On Sat December 5 2009, Michael S. Zick wrote:
> > Help not being displayed by menu config on at least some things.
> > 
> 

Parser is just fine, it is menuconfig that is broke.
make config
(The old style, nothing fancy, config - works just fine.)

Now that I can test my help messages....

Mike
> Interesting...
> 
> Tried the update directions to update the config used by 2.6.31.5 -
> It gets into a pissy-fit about our symbols not having the form
> "CONFIG_*" - - - just ignore that.
> (And the fact that make oldconfig re-writes it to suit itself.)
> 
> choice 
>   prompt "whatever"
>   help
>     Some sort of meaningfull message.
> - - - - - - -
> endchoice
> 
> **DOES NOT** work in the kernel.org version either.
> Yes, Virginia, they use that form see: choice of kernel compression.
> 
> This parser is badly broken and has been for years...
> Might just be easier to patch the language description.  ;)
> 
> Mike
> 
> > Found by:
> > clean clone of repository;
> > checkout tag 2009.11
> > make menuconfig
> > 
> > now select 'help' on the first screen.
> > Note lack of help text (it used to default to the general help).
> > What is that 'selected by: m' ??  I don't recall seeing that before.
> > 
> > exit back to first screen;
> > select 'Target Architecture'
> > select 'help'
> > 
> > "There is no help available for this option."
> > ???
> > Say what?  That choice statement still has help text on it.
> > 
> > Makes it sort of hard to test my new help messages (on a different clone).
> > 
> > Mike
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
