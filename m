From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Jul 2016 11:05:56 +0200
Subject: [Buildroot] [PATCH 10/24 v2] package/perl: use dummy hostname
In-Reply-To: <9303aacab6fc99c113c9ca742beae73abbab47c6.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <9303aacab6fc99c113c9ca742beae73abbab47c6.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <43595887-2738-a08d-75e7-5b0a326a2cac@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> The hostname does not look like it serves any useful purpose, except
> maybe to set set perladmin email.
> 
> Which is undoubtfully useless on the target.
> 
> A followup commit will make the hostname depend on the default skeleton,
> so it won't always be available. We can not rely on it to be set.
> 
> Besides, even today it is not guaranteed to be set; a user may well
> leave it empty.
> 
> Use a dummy hostname.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/perl/perl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 11b10ff..29af7a4 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -54,7 +54,7 @@ PERL_CONF_OPTS = \
>  	-Dccflags="$(TARGET_CFLAGS)" \
>  	-Dldflags="$(TARGET_LDFLAGS) -lm" \
>  	-Dmydomain="" \
> -	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
> +	-Dmyhostname="noname" \
>  	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
>  	-Dosname=linux \
>  	-Dosvers=$(LINUX_VERSION) \
> 
