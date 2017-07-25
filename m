From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:39:13 +0200
Subject: [Buildroot] [PATCH] busybox: fix build on SPARC and SPARC64
In-Reply-To: <20170714211204.25823-1-thomas.petazzoni@free-electrons.com>
References: <20170714211204.25823-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170725233913.5ddf1d92@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 23:12:04 +0200, Thomas Petazzoni wrote:
> Since we introduced the support for building Busybox as individual
> binaries, Busybox started failing to build on SPARC/SPARC64 with this
> feature enabled:
> 
> appletlib.c:(.text.find_applet_by_name+0x14): relocation truncated to fit: R_SPARC_GOT13 against symbol `applet_nameofs' defined in .rodata.applet_nameofs section in libbb/lib.a(appletlib.o)
> appletlib.c:(.text.find_applet_by_name+0x18): relocation truncated to fit: R_SPARC_GOT13 against symbol `applet_names' defined in .rodata.applet_names section in libbb/lib.a(appletlib.o)
> [...]
> 
> This commit adds two patches to Busybox to fix this issue, by adding
> -fPIC to CFLAGS when building on SPARC/SPARC64. The patches have been
> submitted upstream.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/90144369ccea8c41ec7643a79a7ebfaa9b7db95c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...clude-per-arch-Makefile-before-Makefile.f.patch | 46 +++++++++++++
>  ...h-sparc-sparc64-Makefile-define-ARCH_FPIC.patch | 79 ++++++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
>  create mode 100644 package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
