From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 14:19:24 +0200
Subject: [Buildroot] [PATCH] package/cpio: add host version
In-Reply-To: <20190714090301.26552-1-yann.morin.1998@free.fr>
References: <20190714090301.26552-1-yann.morin.1998@free.fr>
Message-ID: <7761512e-bb70-ea06-14e8-a7f0df882964@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/07/2019 11:03, Yann E. MORIN wrote:
> The latest cpio has a --reproducible option, which may come handy when
> we try to, well, be reproducible...
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Atharva Lele <itsatharva@gmail.com>
> ---
>  package/cpio/cpio.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> index 9a09279572..d2814b87a5 100644
> --- a/package/cpio/cpio.mk
> +++ b/package/cpio/cpio.mk
> @@ -16,4 +16,7 @@ ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>  CPIO_DEPENDENCIES += argp-standalone
>  endif
>  
> +HOST_CPIO_CONF_OPTS = --bindir=$(HOST_DIR)/bin

 Why is this needed? For target it is needed because --prefix is set to /usr so
it would end up in /usr/bin and we want it in /bin. But for hsot, --prefix is
$(HOST_DIR).

 Regards,
 Arnout

> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 
