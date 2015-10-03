From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 23:25:06 +0200
Subject: [Buildroot] [PATCH 10/18] barebox: remove now-redundant ccache
 handling
In-Reply-To: <1442777030-24036-2-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777030-24036-1-git-send-email-arnout@mind.be>
 <1442777030-24036-2-git-send-email-arnout@mind.be>
Message-ID: <561047B2.4010301@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 20/09/2015 21:23, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  boot/barebox/barebox.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index e45976d..00e1537 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -52,8 +52,7 @@ else
>  BAREBOX_ARCH = $(KERNEL_ARCH)
>  endif
>  
> -BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
> -	$(TARGET_CROSS)"
> +BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
>  BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
>  
>  ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
> 
