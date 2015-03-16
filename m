From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:16:20 +0100
Subject: [Buildroot] [PATCH buildroot-test] autobuild-run: do not build
 weston using an incompatible toolchain
In-Reply-To: <1425754144-37492-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425754144-37492-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150316221620.58c5b2b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 7 Mar 2015 18:49:04 +0000, Vicente Olivert Riera wrote:
> This external MIPS toolchain uses an old version of uClibc which doesn't
> include this patch:
> 
>   http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=3d1b82c7d9dce11c733fe23a85df7f975c7e2486
> 
> Because of that, weston package fails to build with this error message:
> 
> src/compositor.c: In function
> 'weston_compositor_set_presentation_clock_software':
> src/compositor.c:4283:3: error: 'CLOCK_MONOTONIC_RAW' undeclared (first
> use in this function)
>    CLOCK_MONOTONIC_RAW, /* no jumps, no crawling */
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d36/d367eda8b549b6facd624d0b44cfdc6eb0486c72/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
