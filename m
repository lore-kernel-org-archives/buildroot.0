From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 23:44:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
In-Reply-To: <1378262598.32360.5.camel@phoenix>
References: <1378262598.32360.5.camel@phoenix>
Message-ID: <20130905234414.45a8106a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 10:43:18 +0800, Axel Lin wrote:
> Current setting only allows blackfin to select uclinux as TARGET_OS.
> However, some noMMU ARM platforms that using FLAT binary format also need to
> select uclinux as TARGET_OS. Fix the dependency.

Are you sure uclinux as TARGET_OS is the right selection for ARM? The
release notes of gcc 4.7, at http://gcc.gnu.org/gcc-4.7/changes.html,
indicate:

""
The obsolete ports with alternatives are:

    arm*-*-rtems (use arm*-*-rtemseabi)
    arm*-*-linux-gnu (use arm*-*-linux-gnueabi)
    arm*-*-elf (use arm*-*-eabi)
    arm*-*-uclinux* (use arm*-*-uclinux*eabi)
""

So it looks like the arm-<something>-uclinux* tuple should not be used,
if I understand this correctly. Do you have more details about why
arm-<something>-uclinux* should be used?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
