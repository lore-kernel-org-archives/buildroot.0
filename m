From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 14 Sep 2009 17:42:02 +0200
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
References: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs><4AADDC89.7070302@atmel.com>
	<87ljkh3m2e.fsf@macbook.be.48ers.dk>
Message-ID: <000401ca3556$08f25800$223118ac@GLAMDRING>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Ulf> Sagaert Johan skrev:
> >> Hi
> >> Did anyone succeed in building the UBOOT 2009.08 version for ARM
> >> (at91sam9260_config)?
> >> I always end up with this error :
> >>
>
> Ulf> Yes, I can build 2009.08 in my personal git tree.
> Ulf> git://git.busybox.net/~ulf/git/atmel-2009-08
>
> Ulf> You need some fixes, which are present there.
> Ulf> While I did not test the SAM9260 as such, this is a generic
> Ulf> problem for ARM, which gets fixed by my patches.
>
> Patches are welcome - Are they in upstream u-boot git?
>
> -- 
> Bye, Peter Korsgaard
>

They were proposed and rejected because it is not needed by the ELDK
Embedded Linux Development Kit, provided by Denx.

The decision makers for U-boot, think that everyone should compile using 
ELDK,
and  really do not care if the Buildroot toolchain can build U-Boot or not.

This is an old problem, and if you build older u-boots for AT91
the existing patches will handle the problem

If the buildroot compiler can handle "-msoftfloat" the problem will go away 
by itself.


Best Regards
Ulf Samuelsson 
