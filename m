From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:16:42 +0100
Subject: [Buildroot] [PATCH] package/gcc/9.x: fix download url when
 using upstream gcc for csky
In-Reply-To: <20200312234127.449204-1-romain.naour@smile.fr>
References: <20200312234127.449204-1-romain.naour@smile.fr>
Message-ID: <20200314151642.3c205870@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Mar 2020 00:41:26 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> When the csky cpu support was added [1], the gcc download url was selected
> depending on the csky cpu architecture (BR2_csky) rather than the csky gcc
> fork version (BR2_GCC_VERSION_CSKY)[2].
> 
> When adding gcc 9.x version [3], we forgot to update the condition in order
> to use the url to the gcc csky fork only when BR2_GCC_VERSION_CSKY=y.
> 
> Due to this error, the toolchain build with the upstream gcc 9.x for csky
> cpu is broken due a download error.
> 
> Fix this by using BR2_GCC_VERSION_CSKY instead of BR2_csky.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/470072924
> 
> [1] 7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
> [2] https://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk?id=7873a5bd5ebbeb1674293dae6b06b50f0a1f2184#n19
> [3] 089000eccf584d611ad1a8e5400436952450e883
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
