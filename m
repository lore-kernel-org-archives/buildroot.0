From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 14:19:29 +0100
Subject: [Buildroot] core file
In-Reply-To: <B20373C250564070827FBAAEA65AE6B6@JohanW7>
References: <DC8F7388218A402C9FEADA4D9CC577B3@JohanW7>
 <20120315080021.24349b77@skate>
 <B20373C250564070827FBAAEA65AE6B6@JohanW7>
Message-ID: <20120315141929.1b885c74@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 15 Mar 2012 13:17:06 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> # curl
> ELF header=0x40074000
> First Dynamic section entry=0x40083ef0
> Scanning DYNAMIC section
> Done scanning DYNAMIC section

Seeing those messages, seems like you have built your uClibc with too
many debugging options.

> Reading symbols from /lib/libc.so.0.../home/johan/buildroot/output/toolchain/gdb-7.1a/gdb/utils.c:1246: internal-error: virtual
> memory exhausted: can't allocate 59954836 bytes.

And you have built it with debugging symbols it seems, so its size is
way too big to load on your target. Either use cross-gdb+gdbserver, or
don't compile the uClibc with debugging symbols.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
