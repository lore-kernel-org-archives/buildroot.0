From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jan 2010 00:29:30 +0100
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
In-Reply-To: <hi377d$1i5$1@ger.gmane.org> (Grant Edwards's message of "Wed, 6
	Jan 2010 23:43:41 +0000 (UTC)")
References: <hi377d$1i5$1@ger.gmane.org>
Message-ID: <87wrzgnwdh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> The u-boot-env-tools-on-target build was failing because mtd.h
 Grant> wasn't found, so in an attempt to fix that I tried selecting
 Grant> BR2_PACKAGE_MTD and BR2_PACKAGE_MTD_UTILS.  Now that's failing
 Grant> to build because of undefined references to bcopy, bcmp, bzero
 Grant> (make output below).

 Grant> Is there a trick to get mtd stuff to build?

Yes, we need a workaround similar to what we are doing for
mtd-utils.git. I've checked in a fix for this earlier tonight.

This broke when we updated to mtd-tuils 1.2.0. I'll update to 1.3.1
tomorrow after a bit of testing.

 Grant> Is BR2_PACKAGE_MTD/BR2_PACKAGE_MTD_UTILS actually what I need
 Grant> to provide mtd.h for building the u-boot env set/get target
 Grant> tools, or does mtd.h come from somewhere else?

No, mtd.h normally comes from your kernel headers.

-- 
Bye, Peter Korsgaard
