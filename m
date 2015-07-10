From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 10 Jul 2015 19:02:25 +0200
Subject: [Buildroot] [PATCH v3 2/2] zeromq: depend on libsodium if
 available
In-Reply-To: <1432036871-3244-2-git-send-email-fhunleth@troodon-software.com>
References: <1432036871-3244-1-git-send-email-fhunleth@troodon-software.com>
 <1432036871-3244-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <559FFAA1.6040400@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

Le 19/05/2015 14:01, Frank Hunleth a ?crit :
> ZeroMQ doesn't require libsodium, but will enable CURVE security if it's
> available. This patch adds the optional dependency.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain Naour

> ---
> Changes v1 -> v2:
>   - added patch to series
> Changes v2 -> v3:
>   - no changes
> 
>  package/zeromq/zeromq.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
> index 7e9ed19..a876d5e 100644
> --- a/package/zeromq/zeromq.mk
> +++ b/package/zeromq/zeromq.mk
> @@ -34,4 +34,10 @@ ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
>  ZEROMQ_CONF_OPTS += --with-system-pgm
>  endif
> 
> +# ZeroMQ uses libsodium if it's available.
> +ifeq ($(BR2_PACKAGE_LIBSODIUM), y)
> +ZEROMQ_DEPENDENCIES += libsodium
> +ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
> +endif
> +
>  $(eval $(autotools-package))
> --
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
