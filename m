From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:39:14 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/systat: fix linking
 with -lintl
In-Reply-To: <1439473701-21909-1-git-send-email-yann.morin.1998@free.fr>
References: <1439473701-21909-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818113914.6aec82ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 13 Aug 2015 15:48:21 +0200, Yann E. MORIN wrote:
> When lining, libraries should be listed in the reverse-dependency order,

lining -> linking

> that is the library/ies with no dependency last, preceded by libraries
> that depend on them.
> 
> And most importantly, libraries should be listed *after* the local
> objects, .o files.
> 
> Currently, sysstat uses CFLAGS to shoehorn the -lintl linker flags,
> which is incorrect, as the CFLAGS are passed before the object files.
> 
> However, sysstat has a LFLAGS variable that, presumably, is to be used
> to pass linker flags. This is where we want to shoehorn -lintl.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/8cc/8cc547074de23b9482ad110234ef7458a44e174a/
>     http://autobuild.buildroot.org/results/360/360f7b8252dc9f6bb47841b1d7207a121f90048c/
>     http://autobuild.buildroot.org/results/04c/04cfc76a09e089985549a4320f34f6669d21cab5/
>     http://autobuild.buildroot.org/results/818/818c08decf4a6190a9ed39915eae4cd3d2779880/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sysstat/sysstat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
