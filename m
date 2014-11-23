From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:56:37 +0100
Subject: [Buildroot] [PATCH 1/5] toolchain-external: fix C++ build
 issues with the Blackfin toolchain
In-Reply-To: <20141123175430.GE11143@free.fr>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416764163-12826-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141123175430.GE11143@free.fr>
Message-ID: <20141123185637.5c00ad44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 23 Nov 2014 18:54:30 +0100, Yann E. MORIN wrote:
> On 2014-11-23 18:35 +0100, Thomas Petazzoni spake thusly:
> > The Blackfin toolchain install some libtool .la files, which none of
> > the other toolchains seem to do,
> 
> Well, with my crostool-NG toolchains, I have some, for example:
> 
>     ./armv6-rpi-linux-gnueabihf/libexec/gcc/armv6-rpi-linux-gnueabihf/4.9.1/liblto_plugin.la
>     ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libitm.la
>     ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libstdc++.la
>     ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libsupc++.la
>     ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libatomic.la
> 
> Or:
> 
>     ./x86_64-unknown-linux-uclibc/libexec/gcc/x86_64-unknown-linux-uclibc/4.9.1/liblto_plugin.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libitm.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libvtv.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libstdc++.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libsupc++.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libcilkrts.la
>     ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libatomic.la
> 
> So, I'm not so sure...

What do they contain?

At least, with the Blackfin toolchain, for some reason, libtool find it
smart to append the Buildroot sysroot path with the libdir value found
in the .la file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
