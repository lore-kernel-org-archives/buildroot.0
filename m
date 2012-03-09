From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Mar 2012 08:55:38 +0100
Subject: [Buildroot] [PATCH 13/13] package: move autotools specific
 stuff to pkg-autotargets.mk
In-Reply-To: <CAAXf6LU8ecs39yEpH7ZoRbtxTS2-Cj+uuow-yexJSYvP1hzOwA@mail.gmail.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <91711f9a8cd03a56455ba4516aaf235d90601d53.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LU8ecs39yEpH7ZoRbtxTS2-Cj+uuow-yexJSYvP1hzOwA@mail.gmail.com>
Message-ID: <20120309085538.36678360@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 9 Mar 2012 08:01:54 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Ok for the BR2_AC_BV_... move.
> 
> The last defines like DISABLE_NLS, DISABLE_LARGEFILES, ... are
> sometimes used outside of autotargets, e.g. in
> ./toolchain/gcc/gcc-uclibc-4.x.mk, toolchain/gdb/gdb.mk,
> ./package/newt/newt.mk.
> 
> I'm not sure if it's a good idea to move them, based on that
> observation.

Yes, I agree that this patch can definitely be discussed. I am not
totally sure myself that it is a good idea.

In the same way, the TARGET_CONFIGURE_OPTS, HOST_CONFIGURE_OPTS,
TARGET_MAKE_ENV and HOST_MAKE_ENV are somewhat specific to autotools,
but in fact used in many other locations as well.

In general, my goal is to cut down on the size, complexity and messiness
of /Makefile and /package/Makefile.in. Suggestions are welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
