From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 23:40:59 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/gcc: the ARC version of gcc
 needs host-flex/host-bison
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FF18A@de02wembxa.internal.synopsys.com>
References: <1368114785-14666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368114785-14666-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <E6BF041E97966E4DB955F0DF883AD2D6339FF18A@de02wembxa.internal.synopsys.com>
Message-ID: <20130513234059.740a720e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Fri, 10 May 2013 14:47:56 +0000, Mischa Jonker wrote:

> Thank you for fixing this. Is there any way I can sort the autobuilder results so that I can see specific build problems for ARC?

Build failures on the ARC architecture:

 * On the rt-tests package. See
   http://autobuild.buildroot.org/results/bfb/bfbd82224a80f4446c5f9c1a37b95e910c9f181a//
   for details. Looks like rt-tests want a NPTL toolchain.

 * On the OpenOCD package. See
   http://autobuild.buildroot.org/results/e18/e185b1ef573ddeca51ceb1d30298e611c6879b42//
   for details. It seems to be a toolchain problem: "{standard
   input}:449: Error: operand out of range (-514 is not between -512
   and 511)".

I've just put online a new version of http://autobuild.buildroot.org/,
which now uses a database. If you're interested, I can send you every
day a mail with the ARC build failures (and only the ARC ones), if any.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
