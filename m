From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Mar 2013 08:28:21 +0100
Subject: [Buildroot] [PATCH 0 of 3] Fix oprofile build on powerpc
In-Reply-To: <patchbomb.1363111853@BEANTN0L019720>
References: <patchbomb.1363111853@BEANTN0L019720>
Message-ID: <20130313082821.1ac38352@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 12 Mar 2013 19:10:53 +0100, Thomas De Schampheleire wrote:

> Since the upstep of oprofile to 0.9.8, the powerpc build was broken.
> This series fixes this problem.
> 
> As the last patch indicates, this is compile tested on x86 and powerpc,
> but not runtime-tested.

I think those patches are good, but when I started working on this
issue, I also discovered that oprofile looks at /usr/include/linux by
default to find out whether perf is supported or not in the kernel.
Which obviously doesn't make sense in cross-compilation.

I've just pushed at
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=oprofile-ppc-fix&id=dda400c3f798ba49b1b638f927b3089a9df24105
the work I started some time ago, which was unfinished. Note that I
don't ask you to also fix those issues, I just thought it would be good
mentioning these other potential problems.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
