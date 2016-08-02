From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:21:55 +0200
Subject: [Buildroot] [RFC] toolchain: libatomic needs NTPL threads
	support
In-Reply-To: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
References: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160802212155.751a8f24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 19:25:55 +0200, Romain Naour wrote:
> Cairo package fail to build when BR2_TOOLCHAIN_HAS_LIBATOMIC is set and
> BR2_TOOLCHAIN_HAS_THREADS_NPTL is not set:
> m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -latomic
> 
> Fixes:
> [arm]
> http://autobuild.buildroot.net/results/3d8dc45e41a043d2c2c26bfb26c3617499fbe671
> [m68k]
> http://autobuild.buildroot.net/results/318e01406e3e92eb589ee5b2231c671a4dbb6da4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Do you have some evidence to explain this NPTL dependency? Indeed,
looking at libatomic/configure.ac in the gcc sources, I only see a test
on thread support, done by testing if pthread_create() is available.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
