From: Bob Bouterse <bob.bouterse@dm-holdings-na.com>
Date: Wed, 26 May 2010 16:15:28 -0400
Subject: [Buildroot] How does the Start and Entry Point addresses for a
 uImage get set?
In-Reply-To: <1274899552.26577.86.camel@bbouterse-debian.escient.local>
References: <1274899552.26577.86.camel@bbouterse-debian.escient.local>
Message-ID: <1274904928.26577.88.camel@bbouterse-debian.escient.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I found this. The real fix to my problem was the complete rebuild of
the kernel.

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
