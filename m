From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:30:42 +0200
Subject: [Buildroot] [PATCH v1] package/flac: fix powerpc compile
 failure (missing sys/auxv.h)
In-Reply-To: <20190929194912.18502-1-ps.report@gmx.net>
References: <20190929194912.18502-1-ps.report@gmx.net>
Message-ID: <20190930223042.52edcb94@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 21:49:12 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1]:
> 
>   cpu.c:57:10: fatal error: sys/auxv.h: No such file or directory
> 
> From build/flac-1.3.3/src/libFLAC/cpu.c:
> 
>   56 #if defined FLAC__CPU_PPC
>   57 #include <sys/auxv.h>
>   58 #endif
> 
> Fixed by configure.ac patch checking for for sys/auxv.h before defining
> FLAC__CPU_PPC (fallback already implemented for ppc_cpu_info method in
> case FLAC__CPU_PPC is not defined).
> 
> [1] http://autobuild.buildroot.net/results/eb3a59a78dbb0c83cff78aac2384edea890af830
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ck-for-sys-auxv.h-before-defining-FL.patch | 36 +++++++++++++++++++
>  package/flac/flac.mk                          |  4 +++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch

Applied to master, thanks. Thanks a lot for investigating, fixing this
issue, and upstreaming the patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
