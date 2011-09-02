From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Sep 2011 04:32:52 +0000 (UTC)
Subject: [Buildroot] [Bug 3271] netperf-2.4.5 fails to compile
In-Reply-To: <bug-3271-163@https.bugs.busybox.net/>
References: <bug-3271-163@https.bugs.busybox.net/>
Message-ID: <20110902043252.C35A78D3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3271

--- Comment #5 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
(In reply to comment #4)
> I downloaded the file from the following address. Switch to the chroot, compile
> http://uclibc.org/downloads/binaries/0.9.30.1/system-image-i686.tar.bz2?
> 
> # tar xjf system-image-i686.tar.bz2
> # tar xjf netperf-2.4.5.tar.bz2 -C rootfs/tmp
> # chroot rootfs
> # cd /tmp/netperf-2.4.5
> 
> /tmp/netperf-2.4.5 # gcc -v
> Invoked as gcc
> Reference path: /bin/..
> arg[ 0] = rawgcc
> arg[ 1] = -U__nptl__
> arg[ 2] = -v
> Using built-in specs.
> Target: i686-unknown-linux
> Configured with:
> /home/landley/firmware-0.9.6/build/temp-i686/gcc-core/configure
> --prefix=/home/landley/firmware-0.9.6/build/mini-native-i686/usr
> --disable-multilib --build=x86_64-walrus-linux --host=i686-unknown-linux
> --target=i686-unknown-linux --enable-long-long --enable-c99 --enable-shared
> --enable-threads=posix --enable-__cxa_atexit --disable-nls
> --enable-languages=c,c++ --disable-libstdcxx-pch --enable-sjlj-exceptions
> --program-prefix=
> Thread model: posix
> gcc version 4.1.2
> /tmp/netperf-2.4.5 # ls /lib/libc*
> /lib/libc.a                /lib/libcares.so.2         /lib/libcrypt.so.0       
>  /lib/libcurl.so
> /lib/libc.so               /lib/libcares.so.2.0.0     /lib/libcrypto.a         
>  /lib/libcurl.so.4
> /lib/libc.so.0             /lib/libcom_err.a          /lib/libcrypto.so        
>  /lib/libcurl.so.4.2.0
> /lib/libcares.a            /lib/libcrypt-0.9.30.1.so  /lib/libcrypto.so.0.9.8  
>  /lib/libcurses.a
> /lib/libcares.la           /lib/libcrypt.a            /lib/libcurl.a           
>  /lib/libcurses.so
> /lib/libcares.so           /lib/libcrypt.so           /lib/libcurl.la
> 
> /tmp/netperf-2.4.5 # ls /lib/ld-uClibc*
> /lib/ld-uClibc-0.9.30.1.so  /lib/ld-uClibc.so.0
> /tmp/netperf-2.4.5 # 
> 
> 
> CPU? Intel(R) Pentium(R) 4 CPU 2.40GHz
> MEM? 512MB

Seems like the toolchain's problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
