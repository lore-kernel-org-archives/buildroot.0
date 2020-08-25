From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 09:33:45 +0200
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <VI1PR03MB4528133C5651F56F709E5ED698570@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824221903.167aeb55@windsurf.home>
 <VI1PR03MB452800581DAF06C2AC4B1B0298570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB4528133C5651F56F709E5ED698570@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200825093345.50f51945@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marie,

On Tue, 25 Aug 2020 07:26:18 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> Perhaps full rebuild necessary?

No, I don't think a full rebuild will help here.

> checking build system type... armv7l-unknown-linux-gnueabihf
> checking host system type... armv7l-unknown-linux-gnueabihf

On which RaspberryPi are you building ? It's detecting an ARMv7 core
here.

>  /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
> tmp-divrem_1.s: Assembler messages:
> tmp-divrem_1.s:130: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:146: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:159: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:176: Error: selected processor does not support `mls r1,r4,r3,r8' in ARM mode
> tmp-divrem_1.s:210: Error: selected processor does not support `mls r11,r4,r12,r3' in ARM mode
> make[3]: *** [Makefile:768: divrem_1.lo] Error 1

And it doesn't make any sense for ARMv7 to not have support for MLS if
I'm correct.

But more globally, why are you trying to build Buildroot on a
RaspberryPi itself? It's going to be massively slow compared to the
build time you would achieve on any reasonable x86-64 system.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
