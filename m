From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:21:43 +0100
Subject: [Buildroot] [RFC PATCH 0/2] Add Freescale e5500 & e6500 support
In-Reply-To: <5484E01A.7080802@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
 <20141207234835.4fac269f@free-electrons.com>
 <5484E01A.7080802@zacarias.com.ar>
Message-ID: <20141208002143.55b94d12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 07 Dec 2014 20:17:46 -0300, Gustavo Zacarias wrote:

> > Patches applied. I must say I'm a bit confused by why we exclude PP64le
> > for those new platforms. Is there theoretically something that would
> > prevent those from being used in LE mode?
> 
> As far i was able to find out without hardware the fsl ppc64 SOCs aren't
> able to boot in LE mode.
> It's like ARM, if the peripherals aren't ready for it even though the
> CPU itself can do so it won't work right.

Hum, right. I worked on an ARM platform that does support both LE and
BE. For most things, there is no need for any sort of BE/LE handling at
the peripheral level, except maybe for DMA descriptors shared by the
CPU and device (even though the CPU could do the effort of doing things
LE even if the system is running BE).

> For example for pseries there's the pseries_le_defconfig, for the fsl 64
> bit chips there's corenet64_smp_defconfig but no LE counterpart.
> Even though CONFIG_CPU_LITTLE_ENDIAN can be toggled for said config i
> wasn't able to find anything related to actually booting that (and it's
> a pretty generic option).
> So i "erred" on the safe side.

Ok, works for me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
