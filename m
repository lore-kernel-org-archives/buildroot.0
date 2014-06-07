From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 11:13:23 +0200
Subject: [Buildroot] Building Perl in parallel
Message-ID: <20140607111323.0a9c117a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Unless I'm mistaken, the build of Perl is currently using $(MAKE1),
which means it is not parallelized. Dallas Clement asked recently on
the list how to make his build faster (his Buildroot build currently
takes 1.5 hours on a fast machine with lots of RAM and fast I/O).

It turns out that Perl is the package that takes the biggest amount of
time amongst all the packages. See the attached build time graph.

However, it seems that other build systems are building Perl in
parallel. A quick Google search shows that Yocto used to have patches
to build Perl in parallel
(https://lists.yoctoproject.org/pipermail/poky/2011-March/004520.html)
and that they were backported from upstream. Maybe upstream Perl is now
working fine for parallel builds?

It would be interesting if you could have a look to see if enabling
parallel build for Perl would be possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build.hist-build.pdf
Type: application/pdf
Size: 66437 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140607/4814fdcd/attachment.pdf>
