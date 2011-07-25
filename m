From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jul 2011 08:00:55 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] crosstool-ng-1.11.3 fails to build
In-Reply-To: <bug-3781-163@https.bugs.busybox.net/>
References: <bug-3781-163@https.bugs.busybox.net/>
Message-ID: <20110725080055.7B6D28B4A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

--- Comment #6 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
(In reply to comment #5)
> We believe this bug was solved as a side effect of:
> 
> http://git.buildroot.org/buildroot/commit/?id=ea23f34e25839a9559c3bb61cc5d9f54c89e137b
> 
> Please, give it a try, and re-open if it still fails for you.
> 
> Thank you!

It works this time.
But the following build of busybox is failed.
The error messages are as follows:
==========
libbb/lib.a(inet_common.o): In function `INET_rresolve':
inet_common.c:(.text.INET_rresolve+0xd8): warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
util-linux/lib.a(mount.o): In function `nfsmount':
mount.c:(.text.nfsmount+0xcc): warning: gethostbyname is obsolescent, use
getnameinfo() instead.
miscutils/lib.a(watchdog.o): In function `watchdog_main':
watchdog.c:(.text.watchdog_main+0xfc): undefined reference to `usleep'
networking/lib.a(ifupdown.o): In function `dhcp_down':
ifupdown.c:(.text.dhcp_down+0x24): undefined reference to `usleep'
networking/lib.a(traceroute.o): In function `traceroute_main':
traceroute.c:(.text.traceroute_main+0x434): undefined reference to `usleep'
procps/lib.a(top.o): In function `top_main':
top.c:(.text.top_main+0x21c): undefined reference to `usleep'
util-linux/lib.a(mdev.o): In function `mdev_main':
mdev.c:(.text.mdev_main+0x194): undefined reference to `usleep'
coreutils/lib.a(usleep.o):usleep.c:(.text.usleep_main+0x18): more undefined
references to `usleep' follow
collect2: ld returned 1 exit status
make[2]: *** [busybox_unstripped] Error 1
make[1]: *** [/opt/buildroot/output_hi3520/build/busybox-1.18.5/.stamp_built]
Error 2
make: *** [all] Error 2

Then, I use arm-linux-readelf to check whether 'libuClibc-0.9.31.so' contains
the symbol 'usleep'. And the answer is negative.

Why 'usleep.c' was not compiled?

BTW, erverything is ok when uClibc-0.9.30.3 was used.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
