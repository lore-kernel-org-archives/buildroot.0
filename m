From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:39:47 +0200
Subject: [Buildroot] [git commit] package/pkg-kconfig: quote
 HOSTCC_NOCCACHE
In-Reply-To: <20200830163025.49A1A819A4@busybox.osuosl.org>
References: <20200830163025.49A1A819A4@busybox.osuosl.org>
Message-ID: <712b0e2f-ff80-8b29-91f4-ff98062989b2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/08/2020 18:33, Arnout Vandecappelle (Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=94bb89ad578cbab1624af6492b25b74130500c29
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> HOSTCC may contain spaces, so needs to be quoted.
> 
> Most of the places where it is already quoted use double-quotes, so we
> use that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Somehow, the original thread doesn't appear in my mailbox, so I'm replying here.

 Obviously: applied to master, thanks. Yann has responded to Thomas's comments.
I've fixed the commit title.

 Regards,
 Arnout

> ---
>  package/pkg-kconfig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 45faf50e71..2aecf2e203 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -28,7 +28,7 @@ define kconfig-package-update-config
>  endef
>  
>  PKG_KCONFIG_COMMON_OPTS = \
> -	HOSTCC=$(HOSTCC_NOCCACHE)
> +	HOSTCC="$(HOSTCC_NOCCACHE)"
>  
>  # Macro to save the defconfig file
>  # $(1): the name of the package in upper-case letters
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
