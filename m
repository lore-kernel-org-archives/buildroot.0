From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 21:40:19 +0200
Subject: [Buildroot] autobuilder mess on gcc160: bogus results
Message-ID: <20190811214019.7b277dea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

To those of you following the build results on
http://autobuild.buildroot.net/, I'd like to let you know that a number
of gcc160 results from today are bogus. All failures like this:

ERROR: No hash found for bison-3.0.4.tar.xz
package/pkg-generic.mk:143: recipe for target '/home/buildroot/autobuild/instance-0/output/build/host-bison-3.0.4/.stamp_downloaded' failed

(and same for other packages)

are bogus and should not be considered. I mistakenly ran two instances
of the autobuild-run script in parallel, on the same machine, in the
same output folder. You can imagine the mess.

So, please ignore those build failures.

Thanks, and sorry for the mess.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
