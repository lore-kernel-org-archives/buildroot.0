From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:10:24 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM11 MPCore CPU target support
In-Reply-To: <20151128143030.GA3816@free.fr>
References: <BLU437-SMTP302AFC715EFB42C4E0320FC1020@phx.gbl>
 <20151128143030.GA3816@free.fr>
Message-ID: <20151223231024.3c760e7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Sergi sent a v2 of his patch... but your suggestion doesn't work. See
below.

On Sat, 28 Nov 2015 15:30:30 +0100, Yann E. MORIN wrote:

> I wonder if we should not make VFP optional, and change the CPU nme on
> whether the user has enabled VFP, like:
> 
>     config BR2_arm11mpcore
>         bool "mpcore"
>         [...]
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>         [...]
> 
>     config BR2_GCC_TARGET_CPU
>         [...]
>         default "mpcore"        if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
>         default "mpcorenovfp"   if BR2_arm11mpcore
>         [...]

This doesn't work, because BR2_ARM_CPU_HAS_VFPV2 is not a user visible
option, and there is nothing that selects it in the current Buildroot.
Therefore the "mpcore" case can never be reached.

Consequently, I am tempted to take v1 of Sergi's patch. Yes, it means
we don't support the no-VFP variant of ARM11 MPCore, but I'm not sure
there are lots of ARM11 MPCore without a VFP, so maybe supporting
mpcorenovfp is not worth the effort for the moment.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
