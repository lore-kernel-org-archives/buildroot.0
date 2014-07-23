From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:52:14 +0200
Subject: [Buildroot] No ldconfig on target when using glibc
In-Reply-To: <20140722122701.GB29579@rmm-p1267483>
References: <20140722122701.GB29579@rmm-p1267483>
Message-ID: <20140723215214.2d192c4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 22 Jul 2014 14:27:01 +0200, Eric Le Bihan wrote:

> Since version 215, systemd installs a unit file to run /sbin/ldconfig when
> starting the target. Building a target image with systemd implies using a
> glibc-based toolchain. But when doing so, ldconfig is not installed on the
> target, which causes the unit to fail (the system is usable, though).
> 
> On the other hand, when building a target image with uClibc, ldconfig is
> installed.
> 
> Is it a bug or a feature? Am I missing something?

The ldconfig handling needs love. We even try to run ldconfig on the
build machine at the end of the build, and we have a very old patch
sitting about this: http://patchwork.ozlabs.org/patch/255486/.

Someone needs to look which C library needs ldconfig, and which
doesn't, and take actions to clean this up.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
