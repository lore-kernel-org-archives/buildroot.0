From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 14:33:13 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: add support for gcc
 version dependency
In-Reply-To: <1439036584.12501.5.camel@embedded.rocks>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804194948.GV3647@free.fr>
 <20150805121441.13c3a165@free-electrons.com>
 <1439036584.12501.5.camel@embedded.rocks>
Message-ID: <20150808143313.2a5d6fff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 08 Aug 2015 14:23:04 +0200, J?rg Krause wrote:

> > Thanks! I've used your regexp, and also copy/pasted your explanation
> > into the code. I just had to replace $ by $$ to cope with make 
> > escaping.
> 
> This regex does not produce the version string 5 for my GCC 5.2
> toolchain built with BR and included as external toolchain.
> 
> $ output/host/usr/bin/arm-linux-gcc --version
>     arm-linux-gcc (Buildroot 2015.08-rc1-01365-gec8cd42) 5.2.0
>     Copyright (C) 2015 Free Software Foundation, Inc.
>     This is free software; see the source for copying conditions.  There
>     is NO
>     warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>     PURPOSE.
> 
> $ output/host/usr/bin/arm-linux-gcc --version | sed -r -e '1!d;
> s/^[^)]+\) ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$$//;'
>     5.2

Hum, that's because the version number if 5.2.0, and we're removing
only one digit at the end. It's weird, because I'm pretty sure I tested
with a gcc 5.x toolchain, and I remember it was working fine. But the
version reported by gcc was 5.1, not 5.1.0.

Did maybe gcc 5.1 report 5.1, while gcc 5.2 reports 5.2.0 ?

If that's the case, then I don't see any other possibilities than
having a different case for gcc 4.x and gcc >= 5.x.

Yann ?

Thanks for the report,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
