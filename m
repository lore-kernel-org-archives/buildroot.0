From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 16:43:24 +0200
Subject: [Buildroot] [PATCH 3/4] package/s6-networking: support building
 with bearssl
In-Reply-To: <mOPrX3lWBVOCjFZcvH1LPTPlZLmdmDR8p6aErZQkA@cp4-web-038.plabs.ch>
References: <mOPrX3lWBVOCjFZcvH1LPTPlZLmdmDR8p6aErZQkA@cp4-web-038.plabs.ch>
Message-ID: <10b782de-489c-7f98-b446-4baece9b7a40@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/04/2021 00:47, Dick Olsson via buildroot wrote:
> Signed-off-by: Dick Olsson <hi@senzilla.io>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/s6-networking/s6-networking.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
> index 7f7da1fb71..2abb17ffda 100644
> --- a/package/s6-networking/s6-networking.mk
> +++ b/package/s6-networking/s6-networking.mk
> @@ -20,6 +20,9 @@ S6_NETWORKING_CONF_OPTS = \
>  ifeq ($(BR2_PACKAGE_LIBRESSL),y)
>  S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
>  S6_NETWORKING_DEPENDENCIES += libressl
> +else ifeq ($(BR2_PACKAGE_BEARSSL),y)
> +S6_NETWORKING_CONF_OPTS += --enable-ssl=bearssl
> +S6_NETWORKING_DEPENDENCIES += bearssl
>  endif
>  
>  define S6_NETWORKING_CONFIGURE_CMDS
> 
