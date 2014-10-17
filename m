From: =?UTF-8?B?U3TDqXBoYW5lIEFOQ0VMT1Q=?= <sancelot@free.fr>
Date: Fri, 17 Oct 2014 11:22:05 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <20141016100831.21a48426@free-electrons.com>
References: <543E3CBC.5080901@free.fr> <543F6BBE.3070000@free.fr>
 <20141016100831.21a48426@free-electrons.com>
Message-ID: <5440DFBD.3060503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/2014 10:08, Thomas Petazzoni wrote:
> Dear St?phane ANCELOT,
>
> On Thu, 16 Oct 2014 08:54:54 +0200, St?phane ANCELOT wrote:
>
>> I want being able to emulate an x86 32 bits platform from a 64 bits os
>> with qemu launched in buildroot.
>>
>> The build fails because --disable-system option is enabled and thus
>> inhibits selection target-list i386soft-mmu to build.
>> removing --disable-system this option will permit to build it.
> This is because for now the Qemu package for the host is for now
> limited to building the Qemu userspace emulation, and does not support
> building the Qemu system emulation.
>
>> Please correct it.
> Do you realize that you're talking to an open-source community, and not
> your employees? Asking for something to be fixed the way you did it is
> the best way to make the maintainers/developers angry and to ignore
> your problem.

Yes, I DO ! And I think I asked it politely. I am not a noobie in 
opensource community,
a bit surprised of your reply.  You may have had a bad day...or not read 
what I was trying to do...
but this should be off topic.

As contributor asking for qemu package in the target, I think normal 
trying it and improving it, if possible.
At time of writing  I managed to build the qemu system emulation, 
forcing it in the qemu.mk as a quick workaround:

ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
QEMU_OPTS += --enable-system
else
#QEMU_OPTS += --disable-system
endif



Regards.
S.Ancelot


> Best regards,
>
> Thomas
