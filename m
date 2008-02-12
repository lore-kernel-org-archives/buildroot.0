From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 12 Feb 2008 09:17:05 +0000
Subject: [Buildroot] Best way to add custom step
In-Reply-To: <000201c86d49$57af3700$2301a8c0@atmel.com>
References: <47B0661A.6070605@carallon.com>
	<000201c86d49$57af3700$2301a8c0@atmel.com>
Message-ID: <47B16411.2080304@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I need to add a custom step to my build process after the linux image is 
>> built into the binaries directory. I was wondering about what was the 
>> best way to go about this.
>>
>> I could add my changes to the top level makefile or to the 
>> target\linux\Makefile.in file. Is one way better than the other? Is 
>> there a better way of doing this?
>>
>> Thanks,
>>
> 
> 
> If it is board specific, then it makes more sense to put it
> in target/device and let the target depend on the linux binary.

Thanks, after looking at it some more I realised this.

> 
> What is the custom  step?

Need to wrap the kernel image with some extra bytes that include crc and 
size so that nandboot accepts it.

> 
> 
> 
> Best Regards
> Ulf Samuelsson

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
