From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 09:49:42 +0200
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <VI1PR03MB452849E1179528B11527FB1A98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824221903.167aeb55@windsurf.home>
 <VI1PR03MB452800581DAF06C2AC4B1B0298570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB4528133C5651F56F709E5ED698570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200825093345.50f51945@windsurf.home>
 <VI1PR03MB452849E1179528B11527FB1A98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200825094942.3c865b79@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Aug 2020 07:43:06 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> it is a Raspberry Pi Compute Module 3 Plus. This is the output during startup:
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.4.51-v7+ (dom at buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1333 SMP Mon Aug 10 16:4
> 5:19 BST 2020
> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] OF: fdt: Machine model: Raspberry Pi Compute Module 3 Plus Rev 1.0
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] Reserved memory: created CMA memory pool at 0x37400000, size 64 MiB
> [    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
> [    0.000000] On node 0 totalpages: 242688
> [    0.000000]   Normal zone: 2133 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 242688 pages, LIFO batch:63
> [    0.000000] percpu: Embedded 20 pages/cpu s49856 r8192 d23872 u81920
> [    0.000000] pcpu-alloc: s49856 r8192 d23872 u81920 alloc=20*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> 
> pi at raspberrypi:~/buildroot/buildroot-2020.08-rc1 $ uname -a
> Linux raspberrypi 5.4.51-v7+ #1333 SMP Mon Aug 10 16:45:19 BST 2020 armv7l GNU/Linux

OK, this is really an ARMv7 system. Could you also provide the output
of "gcc -v" on this platform ?

> First it was just a mistake, I took the wrong windows to compile buildroot
> and thought if this is the only bug, it is worth reporting.

I think in general there is no reason for Buildroot to not work on
non-x86 systems. We even used to have an autobuilder running on a
PowerPC64 system. However, since using Buildroot on non-x86 systems is
not that common, it is pretty likely that there will be a few issues
here and there, like you're experiencing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
