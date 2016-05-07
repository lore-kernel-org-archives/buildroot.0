From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:20:09 +0200
Subject: [Buildroot] [PATCH] taskd: add patch to fix musl build issue
In-Reply-To: <1462577103-7598-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462577103-7598-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160507092009.5792b4c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 01:25:03 +0200, J?rg Krause wrote:
> taskd checks for `get_current_dir_name` but forgets to add a `cmakedefine`
> in cmake.h.in, so `HAVE_GET_CURRENT_DIR_NAME` is always undefined.
> 
> CMake detects correctly that the musl C library defines `get_current_dir_name`.
> However, as `HAVE_GET_CURRENT_DIR_NAME` is not set, the block of code evaluated
> cannot be compiled as musl does not define `PATH_MAX`.
> 
> Reported upstream:
> https://bug.tasktools.org/browse/TD-120
> 
> Fixes:
> http://autobuild.buildroot.net/results/121/121aa15235e06c80d65428626da5a2da9d11c9ba/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Thanks, applied!

I saw that you asked why I rejected some of Bernd's patches fixing musl
issues, and Arnout answered you.

This patch from you is exactly what I expect: a real analysis of the
problem, a proper Git formatted patch that has a good explanation other
than "fixes musl build" and an issue reported upstream. Simply perfect.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
