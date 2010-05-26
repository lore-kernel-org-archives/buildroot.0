From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Thu, 27 May 2010 05:14:51 +1000
Subject: [Buildroot] How does the Start and Entry Point addresses for a
 uImage get set?
In-Reply-To: <1274899552.26577.86.camel@bbouterse-debian.escient.local>
References: <1274899552.26577.86.camel@bbouterse-debian.escient.local>
Message-ID: <1274901291.23700.5.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bob,

On Wed, 2010-05-26 at 14:45 -0400, Bob Bouterse wrote:
> Thanks for the beagleboard patch! I have morphed it into an omap3_evm
> configuration. But I have hit a mystery...
> When the uImage for my kernel is created with mkimage, the start address
> is being set to 0x00008000, it should be 0x80008000 . The zreladdr-y in
> linux/arch/arm/mach-omap2/Makefile.boot is set to 0x80008000 . 
> 
> Does anyone know how this gets set in the uImage header?
> 
> FYI, I found that the parameters to mkimage were set to zero in
> buildroot/target/u-boot/Makefile.in . I modified these to 0x80000000,
> and that corrected the problem, but I can't believe this is hard coded.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



> Does anyone know how this gets set in the uImage header?

It doesn't, at least not the final execution address.
It's up to the actual HW to map the final address.
This is also why you found you had to "hard code" the exec addy.

Note that the linker must know where the code will execute on the target, case you don't have 
relocatable (position independent) code.
This is not to be confused with usage of the MMU, which maps virtual addresses.

HTH !

B rgds
Kris
