From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 09:31:59 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F74776.60503@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com> <20130117000037.39ccc628@skate>
 <50F74776.60503@petroprogram.com>
Message-ID: <20130117093159.2d46ecfd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 17 Jan 2013 02:36:06 +0200, Stefan Fr?berg wrote:

> Well, it's not *that* big.

It's not that big, but compared it to the size difference between
uClibc and glibc, and you'll see that switching to glibc is reasonable.

My perception is that uClibc is very relevant for non-MMU systems or
small systems (having limited quantity of flash/RAM), and on those
systems, we are not going to run a full-blown X.org stack with a window
manager and so on.

Whenever you start having X.org on a system and a window manager, most
likely you have hundreds of megabytes of flash, and therefore, the size
difference between uClibc and glibc (probably somewhere between 1 and
1.5 MB) isn't that much of a problem anymore.

> And IMHO those limitations are not really uClibc's fault at all.
> 
> It's because glibc offers stuff like (execinfo.h, mcheck.h,
> RTLD_DEEPBIND etc...) which are not listed in any standard (POSIX or
> otherwise)
> and which people happily use in their own coding projects while being
> unaware that they are not standard comforming
> and hence not easily portable.
> Im sure you noticed this when making that elfutils package Thomas. I
> had as hellish experience as you did when doing
> the initial build of that thing. All because the author of that
> software happened to be Ulrich Drepped, the father of glibc,
> so no wonder that it's code was littered with (non-standard)
> glibc-stuff.

Indeed. And I agree that fixing those compatibility problems in
elfutils is important, because using perf on low-end systems is useful.
However, getting cairo-dock to work with uClibc seems less important to
me, but...

> Also, it's a good learning experience for me while porting stuff to
> uClibc

... of course, for learning purposes, it's always useful!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
