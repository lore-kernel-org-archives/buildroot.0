From: John Stile <john@stilen.com>
Date: Tue, 29 Jan 2013 15:33:05 -0800
Subject: [Buildroot] configure buildroot to patch at91bootstrap
In-Reply-To: <20130129214230.699afd2e@skate>
References: <1359491391.7974.190.camel@genx> <20130129214230.699afd2e@skate>
Message-ID: <1359502385.7974.197.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2013-01-29 at 21:42 +0100, Thomas Petazzoni wrote:
> Dear John Stile,
> 
> On Tue, 29 Jan 2013 12:29:51 -0800, John Stile wrote:
> > I have modified output/build/at91bootstrap-1.16, and now I would like
> > to save the patch set and have it applied when I rebuild
> > at91bootstrap-1.16 from scratch.
> > 
> > To my buildroot .conf file, I added:
> > BR2_TARGET_AT91BOOTSTRAP_PATCH="$(TOPDIR)/board/atmel/at91sam9g20ek/at91bootstrap-patch"
> > but it is erased from .config after running make.
> 
> Never edit your .config file manually. There is no way it can work
> properly, unless you know precisely what you're doing.
> 
> The reason why a BR2_TARGET_AT91BOOTSTRAP_PATCH line gets removed is
> because this option simply doesn't exist.
> 
> Simply go in:
> 
>  Bootloaders
>   -> at91bootstrap
>     -> custom patch dir
> 
> And set your patch directory here.
There in lines the problem.
I do not have:
 Bootloaders
 -> at91bootstrap
 -> custom patch dir

My buildroot 2011.11 has:
 Bootloaders  --->
 [*] AT91 Bootstrap
 (at91sam9g20ek) Bootstrap board
 Boot Memory (NAND Flash)  --->
 [ ] AT91 DataFlashBoot

Is is possible to back-port the ability to patch at91bootstrap in
2011.11?

What release added it?
