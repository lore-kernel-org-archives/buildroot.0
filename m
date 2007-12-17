From: Ryan Ordway <rordway@oregonstate.edu>
Date: Mon, 17 Dec 2007 15:24:05 -0800
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <7E283458-5B84-4AF8-9B2E-7B6D42081922@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
	<6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
	<4766A061.7060308@promwad.com>
	<85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
	<47635.127.0.0.1.1197931767.squirrel@localhost>
	<7E283458-5B84-4AF8-9B2E-7B6D42081922@oregonstate.edu>
Message-ID: <0FA0EAE7-0236-46E2-94F1-F3C664582A6B@oregonstate.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Dec 17, 2007, at 2:53 PM, Ryan Ordway wrote:

>
> On Dec 17, 2007, at 2:49 PM, Ivan Kuten wrote:
>
>>>
>>>
>>> Of course, I can't get a 2.6.23 kernel to even boot at all, but that
>>> may be the same toolchain issues. My 2.6.21.6 kernel seems to be
>>> working ok
>>
>> As I understood 2.6.23 is not bootable at all? Is it differs by size
>> from 2.6.21.6 built by
>> correct toolchain?
>>
>> I have not bootable 2.6.23 kernel image of 4MB built by svn
>> toolchain and
>> the same kernel built by toolchain of 1O Oct 2007 is ok and is only
>> 1.2MB
>>
>> May be 2.18 binutils used in svn buildroot has some issues.
>>
>> Definitely svn ARM buildroot has some issues. Need to investigate
>> more.
>
>
> Correct. My 2.6.21.6 kernel is about 1.1MB. My 2.6.23.9 kernel is >
> 4MB. I get the "Uncompressing Linux....." etc. then a few gibberish
> characters and then it freezes. I'm assuming something is wacky about
> that particular toolchain combination. I'll try using binutils 2.17
> and see if that helps.


Oh, and the build that I have working thus far is:

svn snapshot from 05/21/2007 + Atmel patches from Ulf
gcc 4.0.4
binutils 2.17
uClibc 0.9.28.3
kernel 2.6.21.6 + atmel patches for 2.6.21
EABI

This has been working great for me since May/June, but I want to start  
working towards uClibc 0.9.29 and/or the most recent snapshots once  
the ARM NPTL stuff hits trunk. I've been having some weird threading  
problems using LinuxThreads.

Thanks,

Ryan

--
Ryan Ordway                           E-mail: rordway at oregonstate.edu
Unix Systems Administrator               rordway at library.oregonstate.edu
OSU Libraries, Corvallis, OR 97331    Office: Valley Library #4657
