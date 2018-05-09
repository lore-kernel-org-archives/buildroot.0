From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 10:53:14 +0200
Subject: [Buildroot] xfsprogs failing to build on your autobuilder
Message-ID: <20180509105314.2bc6d8d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

Since yesterday, xfsprogs has started failing to build, but it seems to
happen only your autobuilder (4 times so far):

  http://autobuild.buildroot.net/?reason=xfsprogs-4.15.1

xfsprogs hadn't failed to build since March 24th, and it suddenly
started failing to build again (but with a different error) since
yesterday, just on your autobuilder.

It fails with:

make[3]: *** No rule to make target `-lrt', needed by `xfs_scrub'.  Stop.

I don't immediately in the commits from the last few days what could
cause this. It fails on different architectures, with internal and
external toolchains, with uclibc and glibc. Seems weird.

Could you see if you can reproduce locally, and understand what's going
on ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
