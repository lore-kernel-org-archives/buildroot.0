From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 12 Feb 2008 10:24:08 +0100
Subject: [Buildroot] Best way to add custom step
References: <47B0661A.6070605@carallon.com>
	<000201c86d49$57af3700$2301a8c0@atmel.com>
	<47B16411.2080304@carallon.com>
Message-ID: <016101c86d5b$3a443820$2301a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> I need to add a custom step to my build process after the linux image is 
>>> built into the binaries directory. I was wondering about what was the 
>>> best way to go about this.
>>>
>>> I could add my changes to the top level makefile or to the 
>>> target\linux\Makefile.in file. Is one way better than the other? Is 
>>> there a better way of doing this?
>>>
>>> Thanks,
>>>
>> 
>> 
>> If it is board specific, then it makes more sense to put it
>> in target/device and let the target depend on the linux binary.
> 
> Thanks, after looking at it some more I realised this.
> 
>> 
>> What is the custom  step?
> 
> Need to wrap the kernel image with some extra bytes that include crc and 
> size so that nandboot accepts it.
> 
>> 


Any plans to build NAND boot within Buildroot?

What is NAND boot?

Best Regards
Ulf Samuelsson
