From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 14:46:20 +0100
Subject: [Buildroot] [PATCH] package/wavemon: add upstream patch to fix
 musl/uclibc build issue
In-Reply-To: <20190122080105.12748-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 22 Jan 2019 09:01:05 +0100")
References: <20190122080105.12748-1-joerg.krause@embedded.rocks>
Message-ID: <87sgxkoleb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > In version 0.9.0 wavemon uses the GLIBC-specific extension `on_exit()`
 > which is not available in musl and uClibc.

 > According to the Linux kernel man page [1]: "Portable application should
 > avoid this function, and use the standard atexit(3) instead."

 > Add patch from upstream which is fixing this issue by dropping
 > `on_exit()` and using the standard `atexit()` instead. Note, that the commit
 > message of the upstream patch was changed to add some useful information.

 > [1] http://man7.org/linux/man-pages/man3/on_exit.3.html

 > Backported from: f6e20c9c6e9b50963caaf5483248d329473a6815

 > Fixes:
 > http://autobuild.buildroot.net/results/ae54441c65fe9a1bdcf743aa7f6a208e5545ca29
 > http://autobuild.buildroot.net/results/40fd66e6a351a1acd537ade715ab3e993eddb1c1

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
