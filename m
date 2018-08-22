From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:13:39 +0200
Subject: [Buildroot] [PATCH] libusbgx: fix build with glibc
In-Reply-To: <20180822072002.23657-1-gwenj@trabucayre.com>
References: <20180822072002.23657-1-gwenj@trabucayre.com>
Message-ID: <20180822131339.49d4410e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gwenhael,

On Wed, 22 Aug 2018 09:20:02 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Without sys/sysmacros.h and with glibc build fails with error like:
> libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `minor'
> libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `major'
> libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `makedev'
> 
> backport and adapt pr #28 (https://github.com/libusbgx/libusbgx/pull/28)
> 
> fix:
> http://autobuild.buildroot.net/results/872e2ab084c0c9bf466265d2f66140fbba692ee6/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

This error only happened once so far, on the next branch. Is it related
to the bump of glibc 2.28 or is it also needed with older glibc
versions ?

I'm trying to figure out if this fix should be applied to the next
branch (where we have updated glibc to 2.28) or to master (where we
have glibc 2.27).

I would suspect it is related to glibc 2.28, otherwise the problem
would have already popped up on master. If that is the case, then the
commit log should say it's related to glibc 2.28.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
