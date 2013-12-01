From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 02:04:48 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: move to
 bootloaders menu
In-Reply-To: <20131128211605.GC3337@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
 <20131128210834.3c78df23@skate> <20131128211605.GC3337@free.fr>
Message-ID: <529A8B30.4080008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/13 22:16, Yann E. MORIN wrote:
> Thomas, All,
>
> On 2013-11-28 21:08 +0100, Thomas Petazzoni spake thusly:
>> >On Fri, 22 Nov 2013 23:50:56 +0100, Yann E. MORIN wrote:
>>> > >From: "Yann E. MORIN"<yann.morin.1998@free.fr>
>>> > >
>>> > >rpi-firmware, although it does contain the GPU firmware, also serves as
>>> > >the bootloader. As a reminder, here is an overview of how the RPi boots:
>>> > >   - GPU exits reset
>>> > >   - GPU loads its firmware from the first, FAT32-formatted partition
>>> > >   - GPU reads its config file from the same partition
>>> > >   - GPU loads kernel from the same partition, into RAM
>>> > >   - GPU de-asserts the reset of the ARM core (CPU)
>>> > >   - CPU exits reset and starts executing kernel code
>>> > >
>>> > >So, although the largest part of rpi-firmware is indeed the GPU firmware,
>>> > >the first purpose it serves is as a bootloader for the ARM core.
>>> > >
>>> > >People that do not want to use the GPU (eg. headless, no multimedia...)
>>> > >will still want to select rpi-firmware.
>>> > >
>>> > >Having rpi-firmware in target packages -> hardware-handling -> firmware
>>> > >is a bit misleading in this case.
>>> > >
>>> > >Hence, move rpi-firmware from the target packages submenu, into the
>>> > >bootloaders submenu.
>>> > >
>>> > >Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
>> >
>> >I must say I am not entirely convinced this change is necessary.
> It is not_necessary_. I find it more coherent with the upstream docs
[snip]

  We can have the best of both worlds: just move the source line from 
package/Config.in to boot/Config.in, and no dicking about with changing 
config names...

  Calling the stuff in boot/ BR2_TARGET instead of BR2_PACKAGE is IMHO 
just creating confusion. Even having the boot/ directory at all is 
pointless (i.e. historical accident) if you ask me.

  So I would be more convinced to move everything from boot/ to packages/ 
than the other way round :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
