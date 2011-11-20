From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2011 09:33:38 +0100
Subject: [Buildroot] kernel build name
In-Reply-To: <1071622422.80.1321642895370.JavaMail.root@zimbra>
References: <1759685407.78.1321642881642.JavaMail.root@zimbra>
 <1071622422.80.1321642895370.JavaMail.root@zimbra>
Message-ID: <20111120093338.5b2ed793@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 18 Nov 2011 20:01:35 +0100 (CET),
kakuschky at elbe-net.de a ?crit :

> If I use make menuconfig my target is named
> "arm-unknown-linux-uclibcgnueabi"

See http://sourceware.org/autobook/autobook/autobook_17.html for a
description of what this is.

This is *not* the "kernel build name" as the topic of your e-mail
suggests.

> - arm is releated to the target platform
> - linux o.k. it's a linux kernel I want to build
> - eabi is the interface for embedded systems

No, EABI on ARM is not really related to whether it's embedded or not.
Originally Linux on ARM systems have been using a Linux-specific ABI,
since ARM did not standardize any ABI. Since ABI is now called OABI
(probably for Old ABI or Original ABI or something alike). Later on,
ARM standardized an ABI, called EABI, which Linux now uses.

> - uclib is because I'm linking against GNU uclibc?

Yes.

> - unknown
> 
> Can somebody explain me where to set the part which is named
> "unknown" ?

That's the vendor/manufacturer part of the host tuple. You can put
whatever you want here, and Buildroot simply puts "unknown". We could
have put "br" or "buildroot", it would have worked just as fine.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
