From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 7 Jan 2010 06:08:43 +0000 (UTC)
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
References: <hi377d$1i5$1@ger.gmane.org>
Message-ID: <hi3tpb$k7d$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-06, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> The u-boot-env-tools-on-target build was failing because mtd.h
> wasn't found, so in an attempt to fix that I tried selecting
> BR2_PACKAGE_MTD and BR2_PACKAGE_MTD_UTILS.  Now that's failing
> to build because of undefined references to bcopy, bcmp, bzero
> (make output below).
>
> Is there a trick to get mtd stuff to build?

Found it:

https://bugs.uclibc.org/show_bug.cgi?id=841

I'm getting the feeling tht I should have stuck with the last
release instead of using HEAD.  So far the number of packages
that won't build cleanly is at 4 and counting.

> Is BR2_PACKAGE_MTD/BR2_PACKAGE_MTD_UTILS actually what I need
> to provide mtd.h for building the u-boot env set/get target
> tools, or does mtd.h come from somewhere else?

Still working on that one.

-- 
Grant
