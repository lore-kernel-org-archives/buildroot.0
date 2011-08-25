From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 25 Aug 2011 09:56:38 -0700
Subject: [Buildroot] bash instead of busybox
Message-ID: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I have a request to build a rootfs.jffs2 for an MPC8323 with bash
instead of busybox. So, ... I unset busybox in buildroot's make
xconfig and set bash. Then do a "make clean && make". At the end of
this, I see the two lines from makedevs. And, of course, to make it
worse, after I load it into the flash and boot from it, I do get a
shell of the form "sh-4.1#", so at least the file system boots. I
*think* at this point that a number of packages need to be added
starting with say, "ls" which I *think* is in the fileutils package.

I dont see fileutils as a package option in the buildroot xconfig.

Can someone offer a suggestion or two to a naive programmer to help
find some of the essential packages that are now missing?


>>>   Generating root filesystem image rootfs.jffs2
...table='target/generic/device_table.txt'
makedevs: line 42: regular file
'/home/ckrinke/asvn/trunk/buildroot-glibc/output/target/bin/busybox'
does not exist: No such file or directory
makedevs: line 49: regular file
'/home/ckrinke/asvn/trunk/buildroot-glibc/output/target/usr/share/udhcpc/default.script'
does not exist: No such file or directory


-- 
Charles Krinke
