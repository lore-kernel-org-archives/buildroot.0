From: Steve Calfee <stevecalfee@gmail.com>
Date: Sat, 25 Apr 2015 15:18:28 -0700
Subject: [Buildroot] Kernel panic - unable to mount root fs on
 unknown-block(0, 0) - i486
In-Reply-To: <236977f34e6d4035f5212cbba3baa244@www.startit.hu>
References: <20150424214951.GJ4244@free.fr>
 <236977f34e6d4035f5212cbba3baa244@www.startit.hu>
Message-ID: <CAJJ6jxtAFBmUQxA_x6KZb=uBZwr-AZ+kwy=_H0tqG_X79frXmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 24, 2015 at 4:08 PM, Pongr?cz Istv?n
<pongracz.istvan@gmail.com> wrote:
>
>
> ----------------eredeti ?zenet-----------------
> Felad?: "Yann E. MORIN" yann.morin.1998 at free.fr
> C?mzett: "Pongr?cz Istv?n"
> CC: "buildroot busybox.net" buildroot at busybox.net
> D?tum: Fri, 24 Apr 2015 23:49:51 +0200
> -------------------------------------------------
>
>
>> Pongr?cz, All,
>>
>> [Please, wrap lines at aronf ~72 chars, it's easier to read]
>>
>> On 2015-04-24 22:34 +0200, Pongr?cz Istv?n spake thusly:
>>> I have a problem with booting kernel built by buildroot on i486. The
>>> kernel (3.18.x) panicked: Kernel panic - not syncing: VFS:
>>> Unable to mount root fs on unknown-block(0,0)
>> [--SNIP--]
>>> I tried to boot from usb. There is no initramfs (initrd).
>>
>> For the record so it gets archived on the list, after our discussion
>> on IRC:
>>
>> - add 'rootwait' to the kernel command line, as USB can be pretty slow
>> to enumerate the devices on the bus
>>
>> Kernel seems to wait forever, so:
>>
>> - check that all is built-in: USB driver, USB mass-storage, SCSI
>> support, SCSI disk support (maybe a few things else...)
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>
> Follow up.
> I just created a new kernel from an "older" and proven working kernel.
> 3.16.7 - with initramfs. this kernel built outside of buildroot several months ago.
> -> .config copied to the 3.18.6 for buildroot, make oldconfig
> 3.18.6 - new kernel based on 3.16.7, without initrd
>
> kernel parameters are identical in both cases.
>
> The system built, the result is the following:
> - with kernel 3.18.6 - kernel panic (same as the original problem)
> - with 3.16.7 - the system boots up as expected. lsmod shows nothing (no module loaded...)
>
> So, I am working on fixing this issue.
>
> It should be something trivial, what I simply missed.
> I guess an initrd would be handy.
>
Interesting. Possibly related. I run tests on arm linux on a Marvel
kirkwood platform called dockstar.

I bought a new PC so I reinstalled buildroot. I built a with the
latest default kernel and linux hangs after uboot. I moved back to the
previous kernel version that worked 3.16.4 and it booted via nfs and
worked again.

So then I did a little binary searching and found kernels up to 3.16.7
boot properly, but 3.17 does not. So it looks like the uboot/kernel
environment broke starting at 3.17. I get no messages after uboot
starts the kernel. Does anyone know what to try next?

Regards, Steve
