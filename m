From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 7 Jan 2010 17:02:31 +0000 (UTC)
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
References: <hi377d$1i5$1@ger.gmane.org>
Message-ID: <hi5437$id4$1@ger.gmane.org>
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

I patched the bug in the mtd package so it's now building, but
it won't run:

   # flash_info
   flash_info: can't load library 'libgcc_s.so.1'

libgcc_s.so.1 appears in the staging directory,

   $ find . -name libgcc_s*
   ./output/staging/usr/arm-linux-uclibc/lib/libgcc_s.so
   ./output/staging/usr/arm-linux-uclibc/lib/libgcc_s.so.1

but it's not present in the target filesystem.

Am I having all of these problem becuase I shouldn't be using
HEAD, or am I doing something else wrong?

-- 
Grant Edwards                   grante             Yow! There's enough money
                                  at               here to buy 5000 cans of
                               visi.com            Noodle-Roni!
