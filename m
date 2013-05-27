From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 13:24:55 +0200
Subject: [Buildroot] kernel panic on VIA C3 Samuel2
In-Reply-To: <51A3368F.4010607@gmail.com>
References: <51A3368F.4010607@gmail.com>
Message-ID: <20130527132455.43298317@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 May 2013 12:33:51 +0200, area234 at gmail.com wrote:

> a root fs built with buildroot-2013.05-rc2 and defconfig BR2_x86_c3=y 
> BR2_TOOLCHAIN_EXTERNAL=y, terminates booting with a kernel panic at init 
> start, when run on a VIA EPIA PD board with Eden 600+256MB.
> The same root fs works fine on qemu and on a netbook (atom n570+1GB). 
> This happens with different types of linux kernels and different boot 
> loaders.

The base library configuration for the CodeSourcery x86 toolchain is
Intel Pentium 4. I am not sure the VIA C3 implements the Pentium 4
instruction set, I am not very familiar with those x86 clones.

> The problem disappears changing the busybox of buildroot with a 
> statically linked one.

Hum, this is interesting. Maybe when it's statically linked you don't
hit the problematic code paths?

Can you paste the complete panic message, so we can have a look?

> What is wrong with the VIA board? Any suggestion is appreciated, thank 
> you in advance.

Probably nothing is wrong with the VIA board, most likely with the
toolchain configuration.

Can you try BR2_x86_c3=y, dynamic linking, with the Buildroot internal
toolchain?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
