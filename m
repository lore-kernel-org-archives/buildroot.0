From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:45:14 +0200
Subject: [Buildroot] [PATCH] package/jemalloc: filter on suported
 architectures
In-Reply-To: <1467740148-10178-1-git-send-email-yann.morin.1998@free.fr>
References: <1467740148-10178-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160706224514.213b3240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 19:35:48 +0200, Yann E. MORIN wrote:
> jemalloc has a hard-coded list of supported architectures, which it uses
> to define the minimum alignment for allocations. It whines at build time
> (not at configure time) when it does not know that alignment.
> 
> Fix that by making jemalloc depend on the known-supported architectures.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/674/674b6022f9a403528a758c0785656d2bda79e0a9/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/jemalloc/Config.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks, applied with a few minor modifications:

    [Thomas:
     - split ARM and AArch64 dependencies on two lines
     - for SuperH, instead of using BR2_sh && !BR2_sh2, explicitly list the
       SH4 variants, since only SH4 is supported by jemalloc.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
