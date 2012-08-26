From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Aug 2012 11:20:16 +0200
Subject: [Buildroot] [PATCH] luajit: bug fix - prevent target CFLAGS
 from being used in host tool compile.
In-Reply-To: <1344993930-2730-1-git-send-email-danomimanchego123@gmail.com>
References: <1344993930-2730-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20120826112016.13c9caae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 14 Aug 2012 21:25:30 -0400,
Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

> The luajit amalgamation compile starts with building a host tool, and then
> uses it to build itself. ?However, when CFLAGS is specified, as opposed to
> TARGET_CFLAGS, then it is used for both HOST and TARGET builds. ?So if you
> add something target specific into 'Target Optimizations' (for example,
> '-mfpu=neon -mfloat-abi=softfp' for ARM Cortex-A8), then it gets into the
> host tool compile, which then fails (because my build machine is not an
> ARM Cortext-A8). ?This can be fixed by using TARGET_CFLAGS and
> TARGET_LDFLAGS, instead of CFLAGS and LDFLAGS, respectively.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied, thanks. It fixes build issues like
http://autobuild.buildroot.net/results/022b73a989734d800225c91f419f18f4fc31c264/build-end.log.

Danomi, could you share what is your Buildroot configuration that uses
-mfpu=neon -mfloat-abi=softfp ? I might be interested in adding such a
configuration to the autobuilders.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
