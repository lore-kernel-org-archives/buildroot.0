From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 11 Nov 2009 11:52:43 -0800
Subject: [Buildroot] building kernel modules
In-Reply-To: <20091111005818.GC29442@buzzloop.caiaq.de>
References: <4AF34ADF.7090303@cs.ucsb.edu> <4AF7A886.8000703@cs.ucsb.edu>
	<20091109065815.GZ14091@buzzloop.caiaq.de>
	<4AF899C8.5010702@cs.ucsb.edu>
	<20091109225951.GI14091@buzzloop.caiaq.de>
	<4AF9A069.80404@cs.ucsb.edu>
	<20091111005818.GC29442@buzzloop.caiaq.de>
Message-ID: <4AFB160B.6070001@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Mack wrote:
> On Tue, Nov 10, 2009 at 09:18:33AM -0800, Roman Chertov wrote:
>> Turns out it was a division of a long that was causing that.  After I
>> changed the long to a uint32_t then the problem went away.  Now, I have
>> to figure out why I cannot insert the module.
>>
>> musec_can: unknown relocation: 40
>> insmod: can't insert
>> '/proj/tools/can_driver/musec_can/src/musec_can.ko': invalid module format

This was due to a kernel bug
http://lkml.indiana.edu/hypermail/linux/kernel/0903.3/02813.html
The patch provided in the link fixed the problem for me.


>>
>> Modules built during the kernel built work fine.  I guess I have to
>> figure out what linker setting I am missing.
> 
> See dmesg for more of the reason. There's a comprehensive guideline I
> can point you to, just in case that differs from what you did:
> 
>   http://lwn.net/Articles/21823/
> 
>>> After all, what you're seeing is an effect that has to do with your
>>> code, the kernel and gcc. And not with buildroot :)
>> True.  I was just hoping that somebody would give me a starting point as
>>   I new to cross compiling :)  Thanks for the help.
> 
> No problem :)
> 
> Daniel
> 
