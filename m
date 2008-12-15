From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 15 Dec 2008 14:01:38 +0100
Subject: [Buildroot] at91sam9g20dfc_defconfig - no u-boot (mkimage)???
References: <20081211203155.142270@gmx.net>
Message-ID: <D8B83A55773742C0B892ACBCDC81537D@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi guys...just downloaded the latest trunk to test the AT91SAM9G20 build.
> I notice that there is no u-boot monitor option under Ateml Device
> Support.  When I try to build it anyway, I get an error saying mkimage is
> not found...obviously because u-boot has not been built yet.
>
> Anyone else find this?
>
> Thanks, Matt.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>

I don't think U-Boot is supported in the main U-Boot tree,
and it is not supported in my u-boot-1.2.0 derivative.
The only U-boot version supporting the T91SAM9G20 is
the Atmel 1.1.5 derivative, which does not have a build script
in Buildroot.
I think that I built the SAM9260 first and then the SAM9G20
so mkimage was already there
You can do the same, by first build u-boot for the AT91SAM9260, which
and then build SAM9G20.

Since mkimage can be built using any architecture,
it should perhaps always be built using a "known" architecture.




Best Regards
Ulf Samuelsson
