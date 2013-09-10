From: =?ISO-8859-1?Q?Peter_K=FCmmel?= <syntheticpp@gmx.net>
Date: Tue, 10 Sep 2013 21:18:38 +0200
Subject: [Buildroot] backtrace()  depth
Message-ID: <522F708E.2070004@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've a question about the depth of a backtrace.

I've configured uClibc/Buildroot to build libubacktrace-0.9.33.2.so
via the standard Buildroot menuconfigs:
Buildroot 2013.02, GCC 4.7.2 by Buildroot, uClibc-0.9.33

When I call backtrace() on a segfault, I only see the function
where the segfault is produced, and not much more (only /lib/libc.so.0,
and two more addresses). The function name could be demanded correctly,
so I assume the compiler flags are ok (-rdynamic).

The segfault is not in the main thread
(overall 4 threads, /lib/libpthread-0.9.33.2.so)
And the bt looks equal for debug and release builds.

A build with crosstool-ng and eglibc produces the same bad backtrace.

Is there a way to get a more complete backtrace?

Many thanks,
Peter
