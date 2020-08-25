From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 10:17:09 +0200
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <VI1PR03MB45286F7ECB71FC95DB6A282798570@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824221903.167aeb55@windsurf.home>
 <VI1PR03MB452800581DAF06C2AC4B1B0298570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB4528133C5651F56F709E5ED698570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200825093345.50f51945@windsurf.home>
 <VI1PR03MB452849E1179528B11527FB1A98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200825094942.3c865b79@windsurf.home>
 <VI1PR03MB45288DDD5E2D82A0B4C15AC098570@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <VI1PR03MB45286F7ECB71FC95DB6A282798570@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200825101709.770f2520@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Aug 2020 07:56:18 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> Perhaps this parameter:
> 
> --with-arch=armv6

Yes, the problem is that the compiler provided in your Raspbian
distribution generates ARMv6 code by default, I guess to be compatible
with all RaspberryPi. But you're running on an ARMv7 RaspberryPi, so
GMP believes it can enable some ARMv6T2 optimizations... which are then
not recognized by your compiler.

I am not sure what is the correct way to fix this:

 - Should we consider it a bug that the host compiler you have
   installed does not by default generate binaries that match your host
   CPU architecture ?

 - Should we consider it a bug that GMP assumes without testing the
   compiler that the host CPU architecture detected at runtime is
   really supported by the compiler ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
