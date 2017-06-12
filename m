From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:11:22 +0200
Subject: [Buildroot] Pre-built Buildroot toolchains updated
Message-ID: <20170612231122.71cd02f0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

FYI, I have updated the pre-built Buildroot toolchains used by
autobuild.buildroot.org.

Main changes are:

 - Most toolchains now use gcc 6.x (instead of 5.x), since 6.x is our
   default version.

 - I've switched one toolchain to use gcc 7.x (br-arm-cortex-a9-glibc),
   so it's our first toolchain using gcc 7.x. You can expect some gcc
   7.x issues.

 - uClibc 1.0.25 is used.

 - Toolchains that were using gcc 4.8 are now using 4.9, since we have
   removed support for 4.8 in the internal toolchain backend.

 - Most toolchains now use 4.11 kernel headers instead of 4.10, because
   there is a variety here, with some toolchains using 3.10, 4.1, etc.
   I'm keeping some disparity here, just to test various combinations.

For the details, see:

  https://git.buildroot.org/buildroot-test/commit/?id=c4f9ab50e66d08a3d726f612364abb6a08f13f20

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
