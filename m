From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 14:57:22 +0100
Subject: [Buildroot] porting old build system to the buildroot
In-Reply-To: <CAPTQzAB=Gk7qrnaRbTbujQXKUbiF4Srgi7+8UibP4cAiN=AVCg@mail.gmail.com>
References: <CAPTQzAB=Gk7qrnaRbTbujQXKUbiF4Srgi7+8UibP4cAiN=AVCg@mail.gmail.com>
Message-ID: <20170212145722.2be8b56b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 14:46:57 +0200, Anatoly Asviyan wrote:

> I am porting old build system to the buildroot. How do I express
> "-mthumb -march=armv7-a -mcpu=cortex-a8 -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -DARM_NEON"
> as a buildroot's config?
> 
> Toolchains is CodeSourcery/arm-2009q1  arm-none-linux-gnueabi gcc 4.3.3
> 
> I've set correct values (I hope they are) in "Target options" menu, but
> still see gcc invocations without those flags.

Flags are passed inside the compiler wrapper, so you don't see them on
the command line. If you want to see them:

	export BR2_DEBUG_WRAPPER=1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
