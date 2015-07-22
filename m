From: Daniel Smolik <marvin@mydatex.cz>
Date: Wed, 22 Jul 2015 17:10:18 +0200
Subject: [Buildroot] buildroot for SAMA5D3 illegal instruction
In-Reply-To: <55AF3FF8.4020305@mydatex.cz>
References: <55AF3847.503@mydatex.cz>
 <20150722085912.66ff27e0@free-electrons.com> <55AF3FF8.4020305@mydatex.cz>
Message-ID: <55AFB25A.8040408@mydatex.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Smolik wrote:
> Thomas Petazzoni wrote:
>> Dear Daniel Smolik,
>>
>> Thanks for your report!
>>
>> On Wed, 22 Jul 2015 08:29:27 +0200, Daniel Smolik wrote:
>>
>>> I have compiled latest stable buildroot for SAMA5D3 (config attached) I booted to new root and sshd and some programs
>>> crash in illegal instruction opcode.
>>
>> I don't immediately see anything wrong in your configuration. Which
>> kernel are you using? Your Buildroot configuration builds a toolchain
>> with kernel headers 4.0, are you using a kernel version >= 4.0 ?
>>
>> Could you run sshd under gdb and see which instruction is considered to
>> be invalid? This would be the most helpful way to debug the problem.
>>
Many many thanks. Problem was in kernel headers. I run kernel 3.12.44 and use wrong headers.

Thanks again
		Dan





-- 
Mydatex s r.o.
http://www.mydatex.cz
email: smolik at mydatex.cz
mob: 604200362
tel: 226210085
