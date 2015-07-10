From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 10 Jul 2015 08:26:01 -0500
Subject: [Buildroot] Buildroot for STM32F4 with Nuttx kernel
In-Reply-To: <20150710101923.67e70822@free-electrons.com>
References: <CAOudHSXE+XrCKsi=bT+XjfTUhU3W9YiW=MjjJN2t9KEX8nzh-Q@mail.gmail.com>
 <20150710101923.67e70822@free-electrons.com>
Message-ID: <CALq67GC+R5vXQTRFNugg=84dq1nf7qBvLcR+=29pxbeh5rLmTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Jul 10, 2015 at 3:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 9 Jul 2015 17:40:10 -0400, Cjw X wrote:
>
>> I modified buildroot to create a distribution for the STM32F4 processor.
>> (It should be fairly portable to different Cortex-M processors though, the
>> STM32F4 is the only one I've tested so far).

This is an idea that I thought about since I've been playing around
with NuttX on a Cortex-A5 (Atmel SAMA5D3 Xplained). I have briefly
looked at the repo but really haven't had an opportunity to try to use
it or look closely at it. I will try to do that this weekend.

>> So far it:
>> Builds the toolchain
>> Builds a modified Nuttx RTOS
>> Builds the icsp tools for programming and debugging (openocd/gdb)
>> It also integrates the filesystem buildroot generates into the Nuttx kernel
>> so it shows up in Nuttx's filesystem.
>>
>> It still has a ways to go, but right now it builds everything and works on
>> my hardware.
>> So far I've tested it on hardware I built, and on the STM32F407 discovery
>> board with the attached baseboard.
>>
>> You can find instructions here http://www.vxmdesign.com/STM32.html
>> The git repo is https://github.com/vxmdesign/prjpluto.git and
>> vdsc_defconfig is the config for the discovery board.
>
> Thanks for posting this! I had a look at the github repository, and I'm
> actually nicely surprised to see that the changes are not that big to
> make things work. Of course, there are some crude things here and there
> that would need to be addressed, but overall it doesn't seem
> completely crazy.
>
> I think the biggest question for me is whether it makes sense to have
> all this in Buildroot. On the one hand, I do understand the benefit of
> using Buildroot: all the toolchain logic is there, the logic to build
> packages is there, the menuconfig infrastructure makes things easy, etc.

To an extent NuttX is already using heavily modified version of
buildroot to generate a toolchain that provides support the NXFLAT
binary format (supports XIP).

http://sourceforge.net/projects/nuttx/files/buildroot/

> On the other hand, the biggest value of Buildroot is really in the
> "Target packages", and here none of them are usable because they are
> all Linux-specific.

I agree with this and which is why I ending up really not pursuing
this. The one thing with NuttX however is that it does have the
concept of "packages" applications that are external to the core NuttX
kernel which is where I see the benefit of having a higher level build
system for building and deploying a NuttX image.

Thanks for posting this as I am very interested in taking a look at this!

Thanks,
-Ryan
