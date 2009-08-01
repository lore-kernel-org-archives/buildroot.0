From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Aug 2009 17:41:28 +0000 (UTC)
Subject: [Buildroot] [Bug 523] pciutiles can't find libz
In-Reply-To: <bug-523-163@https.bugs.busybox.net/>
References: <bug-523-163@https.bugs.busybox.net/>
Message-ID: <20090801174128.50830777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=523





--- Comment #2 from Bernhard Reutner-Fischer <aldot@uclibc.org>  2009-08-01 17:41:27 UTC ---
(In reply to comment #0)
> Hi,
> 
> i was trying to compile pciutiles having zlib but it fails because can't find
> lz!
> 
> Probably a path mismatch, but i've done some tests without success. Zlib are
> there and works correctly, openssl compiles successfully!
> 
> Here there is the output
> make[2]: Leaving directory
> `/home/daniele/Development/OPBXA/buildroot-git/build_i686/pciutils-3.0.1/lib'
> /home/daniele/Development/OPBXA/buildroot-git/../targets/i686-opbxa-linux-gnu//bin/i686-opbxa-linux-gnu-gcc
> -O3 -pipe -O3  --sysroot
> /home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir/ -Wall -W
> -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes   -c -o lspci.o
> lspci.c
> /home/daniele/Development/OPBXA/buildroot-git/../targets/i686-opbxa-linux-gnu//bin/i686-opbxa-linux-gnu-gcc
> -O3 -pipe -O3  --sysroot
> /home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir/ -Wall -W
> -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes   -c -o common.o
> common.c
> /home/daniele/Development/OPBXA/buildroot-git/../targets/i686-opbxa-linux-gnu//bin/i686-opbxa-linux-gnu-gcc
>   lspci.o common.o lib/libpci.a  -lz -lresolv -o lspci
> /home/daniele/Development/OPBXA/targets/i686-opbxa-linux-gnu/bin/../lib/gcc/i686-opbxa-linux-gnu/4.3.3/../../../../i686-opbxa-linux-gnu/bin/ld:
> cannot find -lz
> 

broken toolchain and/or toolchain setup.
What does
$ grep TOOLCHAIN .config
say?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
