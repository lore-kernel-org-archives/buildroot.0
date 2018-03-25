From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:40:31 +0200
Subject: [Buildroot] [PATCH] Config.in: add -Ofast option
In-Reply-To: <20180325082434.GF2620@scaer>
References: <1521735971-22210-1-git-send-email-joshua.henderson@microchip.com>
 <20180325082434.GF2620@scaer>
Message-ID: <20180325224031.55cfb6a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Mar 2018 10:24:34 +0200, Yann E. MORIN wrote:

> > +config BR2_OPTIMIZE_FAST
> > +	bool "optimize for fast"  
> 
> -Ofast was introduced in gcc-4.6, so you need a dependency:
>     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6

The "odd" thing being that menuconfig is organized as follows:

 Target options --->
 Build options --->
 Toolchain --->

The optimization level is selected in "Build options" and the compiler
version is basically decided in "Toolchain".

So if you select -Ofast in Build options, and then go in Toolchain
chose a < 4.6 compiler, your -Ofast selection would disappear.

But there's no good way around this, and using gcc < 4.6 is anyway very
rare these days, so I also agree that the "depends on" you suggest is
what makes the most sense.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
