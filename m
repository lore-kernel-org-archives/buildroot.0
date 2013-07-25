From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jul 2013 10:11:59 -0300
Subject: [Buildroot] Problems building for ucLinux/ARM with elf2flt
	enabled
In-Reply-To: <CBB26B88EF85F6489575628B28ECBE6D43286066BE@ablexc01.internal.novero.com>
References: <CBB26B88EF85F6489575628B28ECBE6D432860618A@ablexc01.internal.novero.com>
 <CAAXf6LUU_SkD-KSEMgX3t64F=oK=qzuzuQJG5NJ5u2PzE8nZsA@mail.gmail.com>
 <CBB26B88EF85F6489575628B28ECBE6D4328606253@ablexc01.internal.novero.com>
 <CAAXf6LVTZW-vPP8riyEJNZT+rRdnJkzbu2LQiSr+RS-SAAEi6g@mail.gmail.com>
 <CBB26B88EF85F6489575628B28ECBE6D4328606695@ablexc01.internal.novero.com>
 <CAAXf6LVV2xDi6LCD6pefpOU8E1N_nGf5qojUDP28XrFpGxas3Q@mail.gmail.com>
 <CBB26B88EF85F6489575628B28ECBE6D43286066BE@ablexc01.internal.novero.com>
Message-ID: <51F1241F.6050609@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/2013 07:13 AM, Anna Fischer (novero/Bochum) wrote:
>>> Any pointers would be really appreciated.
>>
>> I'm afraid I'm not the person to help you here, I don't have any
>> experience with flat binaries in buildroot.
>> Others may be better suited. Thomas Petazzoni maybe?
>>
> 
> It seems as if by default FLAT binaries are not supported for the ARM architecture. It is only supported for Blackfin devices and m68k. Choosing the target binary format is disabled in by configuration because I use an ARM device.

The ARM nommu internal toolchain needs some work, similar to the
patchset i've sent for blackfin fixes.
For starters the tuple is wrong, it should be *-uclinux-* (instead of
*-linux-*) in package/Makefile.in
And there are other details regarding uclibc configuration for example
to fix.
It would probably be a good idea to add M-series and R-series cortex cpu
definitions too since those are the most likely to be used for nommu.
I'm looking into it but i make no promises, i lack hardware to test this
and qemu doesn't emulate anything useful regarding it.
Regards.
