From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 7 Jan 2010 06:46:30 +0000 (UTC)
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
References: <hi377d$1i5$1@ger.gmane.org> <hi3tpb$k7d$1@ger.gmane.org>
Message-ID: <hi4006$nin$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-07, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> Is BR2_PACKAGE_MTD/BR2_PACKAGE_MTD_UTILS actually what I need
>> to provide mtd.h for building the u-boot env set/get target
>> tools, or does mtd.h come from somewhere else?

It's actually mtd/mtd-user.h that's missing.  It looks like it
should come from the kernel headers. It's there in the kernel
source tree (and in /usr/include on my development hosts), but
it's missing from the toolchain's usr/include directory.

How do you get mtd/*.h header files included in /usr/include
when the toolchain is built?

-- 
Grant
