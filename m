From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 10 Sep 2013 21:40:09 +0200
Subject: [Buildroot] backtrace() depth
In-Reply-To: <522F708E.2070004@gmx.net>
References: <522F708E.2070004@gmx.net>
Message-ID: <CAHXCMMLoHUQSjzgPpubAXvYGFw=dmWDPShVKBsOx3KWLPCmUtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,


2013/9/10 Peter K?mmel <syntheticpp@gmx.net>

> I've a question about the depth of a backtrace.
>
> I've configured uClibc/Buildroot to build libubacktrace-0.9.33.2.so
> via the standard Buildroot menuconfigs:
> Buildroot 2013.02, GCC 4.7.2 by Buildroot, uClibc-0.9.33
>
> When I call backtrace() on a segfault, I only see the function
> where the segfault is produced, and not much more (only /lib/libc.so.0,
> and two more addresses). The function name could be demanded correctly,
> so I assume the compiler flags are ok (-rdynamic).
>
> The segfault is not in the main thread
> (overall 4 threads, /lib/libpthread-0.9.33.2.so)
> And the bt looks equal for debug and release builds.
>
> A build with crosstool-ng and eglibc produces the same bad backtrace.
>
> Is there a way to get a more complete backtrace?
>

Is the strip command set to none (under the "Build options" menu)?
if not, then you should certainly added the binaries you are debgging to the
BR2_STRIP_EXCLUDE_FILES or  BR2_STRIP_EXCLUDE_DIRS lists.


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/22183164/attachment.html>
