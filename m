From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 16:42:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/assimp: remove redundant ':'
 sign
In-Reply-To: <1525551191-7113-1-git-send-email-jerzy.m.grzegorek@gmail.com>
References: <1525551191-7113-1-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <20180507164212.52eac52b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 May 2018 22:13:10 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> ---
>  package/assimp/assimp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 4d44748..e391145 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -20,7 +20,7 @@ endif
>  # not passed) in gcc versions 5.x or older. The -Os optimization level
>  # causes a "unable to find a register to spill in class
>  # ?GENERAL_REGS?" error. -O2 works fine.
> -ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
> +ifeq ($(BR2_sh)$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),yy:)

I don't find the ":" to be really redundant. Yes, this ":" is not
technically needed, but it makes the construct very clear and avoids
any possible confusion.

So I think my preference would be to keep things as-is. I know in other
places we don't put a ":" when we need both options to be "y". But when
we have a case where some options need to be "y", some options need to
be empty, I find having a ":" between each to be clearer.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
