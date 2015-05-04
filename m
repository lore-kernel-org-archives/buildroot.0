From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 23:22:17 +0200
Subject: [Buildroot] Autobuilder updates
Message-ID: <20150504232217.6832581d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A few news from the autobuilders setup:

 * Increased the timeout for builds from 4 hours to 8 hours, in an
   attempt to reduce the number of bogus build results simply hitting
   the timeout. This will require people running autobuilder instances
   to update their scripts, which might take a little bit of time (they
   have been notified).

 * Removed the musl based toolchain configuration from the
   autobuilders, for the duration of the stabilization phase. Musl is
   still causing build issues with a very large number of packages,
   causing quite a bit of noise in the build results. Such noise
   doesn't make the stabilization effort easy, and the musl support is
   still marked as experimental in Buildroot so it's an acceptable
   trade-off. The musl based configuration will be re-enabled once
   2015.05 is released, and provided enough work is done on musl
   support in the 2015.08 cycle, we'll keep this toolchain
   configuration in the autobuilders (and possibly add some more to
   test other architectures than ARM)

 * Re-enabled gcc75 as an autobuilder instance.

 * Merged some pending patches from Samuel Martin, which will include
   CMake related log files in the build results when the build failure
   occurs in a CMake package (similar to what we have been doing with
   saving config.log for autotools packages).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
