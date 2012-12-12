From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 23:54:06 +0100
Subject: [Buildroot] Random "Bus error" when building host-python
Message-ID: <20121212235406.768eb752@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

If you have looked at the autobuilder results recently, there are some
host-python errors sometimes:

 http://autobuild.buildroot.org/results/b01a3c7233d53578961b74fb6ffb006782a43944/build-end.log
 Free Electrons build server, targeting mipsel

 http://autobuild.buildroot.org/results/5c59266f72f234ee9863e3d54270487b05af3612/build-end.log
 gcc14 build server, targeting powerpc

 http://autobuild.buildroot.org/results/3cf01dabafd47813c6fe11d0250e57ef667e8d95/build-end.log
 gcc14 build server, targeting powerpc

 http://autobuild.buildroot.org/results/7722a16700231a49b736fae697532013dfccfd2a/build-end.log
 Free Electrons build server, targeting arm

Every time, the build fail with a "Bus error". The log is not clear
enough to really understand what process is failing with a Bus error.

As you can see, the problem is not specific to one build machine, or
one target architecture (well, since it's in host package, it's kind of
obvious, but not the build machine fact).

And the thing is that those problems are not reproducible. If you take
the exact same commit ID of Buildroot, the exact same configuration, on
the exact same build machine, the problem may or may not produce
itself. I tried to reproduce it using one of those build
configurations, and he wasn't produced.

On the other hand, I did try to reproduce some other build
configuration that failed in the autobuilders, and instead of having
the error reported by the autobuilder web interface, I felt into the
"Bus error" problem in host-python. I just restarted the build (not
from scratch, simply restarted the build), and it went on without
failing into the "Bus error" problem. So it seems like the problem is
not in the generated code (re-executing the same code sometimes work
sometimes doesn't work).

Does anyone has ideas on how to further investigate this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
