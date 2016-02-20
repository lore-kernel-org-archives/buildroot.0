From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 20 Feb 2016 14:45:55 +0100
Subject: [Buildroot] Buildroot for normal PC
In-Reply-To: <20160220101054.GA3418@free.fr>
References: <56C79CD9.3010503@dawncrow.de> <20160220101054.GA3418@free.fr>
Message-ID: <56C86E13.8040203@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 20.02.2016 um 11:10 schrieb Yann E. MORIN:
> Andr?, All,
>

Hi,

Thanks for the hints.
But I really need bare metal for my intents, qemu won't help.
As soon as I have more time I'll try, if I succeed I'll also try to upstream a defconfig.

> On 2016-02-19 23:53 +0100, Andr? Hentschel spake thusly:
>> I wanna try some more things with the Wine package in buildroot, but I
>> can't easily setup a testing environment for a PC.
> 
>     $ make list-defconfigs |grep x86
>       qemu_x86_64_defconfig               - Build for qemu_x86_64
>       qemu_x86_defconfig                  - Build for qemu_x86
> 
> So I'd suggest you use qemu for that.
> 
>> One part is which bootloader to use and how to pack everything together
>> to a bootable USB-Stick, HDD image or CD. (And I didn't found a defconfig
>> for that)...
> 
> No, we don't have a defconfig for a traditional PC.
> 
>> The other part is about the nvidia-driver, I'll need the legacy one for
>> my card. Can I simply alter the version number in the makefile?
> 
> I'm not sure the legacy driver has the same "layout" (in terms of
> buildsystem) as the current driver, so I would not bet on it...
> 
> However, if as I suggested above, you were to use qemu, you would not
> need to setup a bootloader. You can tell qemu to directly boot a kernel,
> see:
>     board/qemu/x86/readme.txt
> 
> As for the video driver, qemu does not (yet!) provide a 3D-accelerated
> graphics card, but you can use mesa3d for SW OpenGL if you need that.
> 
> I guess using qemu will be more efficient than using a real PC, at least
> as long as you're not looking at performance, and especially graphics
> performance.
> 
> Well, at least, that's what I would be doing. ;-)
> 
> Regards,
> Yann E. MORIN.
> 
