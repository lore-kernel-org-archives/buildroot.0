From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 29 May 2018 16:49:14 +0000
Subject: [Buildroot] [git commit branch/2018.02.x] util-linux: add two
 upstream patches to fix blocking on getrandom() with recent kernels
In-Reply-To: <20180528074724.D400282A4A@busybox.osuosl.org>
References: <20180528074724.D400282A4A@busybox.osuosl.org>
Message-ID: <1527612552.31570.109.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-05-28 at 09:48 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=c4d86707cd67817496fa7a904b73b2538ad4058c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x
> 
> As part of the fix for CVE-2018-1108 (kernel drivers before version 4.17-rc1
> are vulnerable to a weakness in the Linux kernel's implementation of random
> seed data.  Programs, early in the boot sequence, could use the data
> allocated for the seed before it was sufficiently generated), the kernel
> random number generator initialization routine was changed.  See the
> project-zero writeup for more details:
> 
> https://bugs.chromium.org/p/project-zero/issues/detail?id=1559

What's ironic here is that due to the kernel's random data not being
good enough, after waiting a full second, util-linux falls back to
random data that is even worse.

If one looks at the system as a whole, I think rather than "fix" CVE-
2018-1108 what has really happened is that a kernel problem has been
traded for an even worse userspace problem.
