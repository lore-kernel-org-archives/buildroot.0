From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 20 Mar 2009 22:33:59 -0400
Subject: [Buildroot] ltp-testsuite package qustion
In-Reply-To: <49C441BF.3070005@tensilica.com>
References: <49C441BF.3070005@tensilica.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090147DD12@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, March 20, 2009 6:24 PM, Maxim Grigoriev wrote:
>
> Hello everybody,
> 
> Can somebody, please, tell me how I can change a version of 
> .../package/ltp-testsuite  ?
>
> Is 20070228 a default ?
> It seems to be hard-coded. And, ltp-testsuite patches do not apply
> to a newer version.
>
> On the  http://ltp.sourceforge.net/, the latest stable version is 
> claimed to be
>
>              ltp-full-20090228.tgz
>

In ./package/ltp-testsuite/ltp-testsuite.mk:

- LTP_TESTSUITE_VERSION:=20070228
+ LTP_TESTSUITE_VERSION:=20090228

> A Two-years old version does not work quite well with recent
> versions of tools and kernel / kernel headers.
>
> One of the issues I observe is an undefined macro OPEN_MAX, which
> was removed from limits.h. It's now a variable, which can be obtained,
> say, by
>
>              sysconf (_SC_OPEN_MAX).
>
> I'm hoping that switching to a newer version of LTP would fix this
> problem.
>
> Any help on this will be highly appreciated.

Regards,
Hartley
