From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 08:04:09 +0200
Subject: [Buildroot] [PATCH 1/1] exim: enable plaintext and cram-md5
	authenticators
References: <1431878301-13745-1-git-send-email-pud@nerdpunx.net>
Message-ID: <XnsA4A15215AE77EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mirko Langisch <pud@nerdpunx.net> wrote in 
news:1431878301-13745-1-git-send-email-pud at nerdpunx.net:

> Signed-off-by: Mirko Langisch <pud@nerdpunx.net>
> ---
>  package/exim/exim.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index ed309de..b852793 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -46,6 +46,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
>       $(call exim-config-change,PCRE_CONFIG,no)
>       $(call exim-config-change,HAVE_ICONV,no)
>       $(call exim-config-unset,EXIM_MONITOR)
> +     $(call exim-config-change,AUTH_PLAINTEXT,yes)
> +     $(call exim-config-change,AUTH_CRAM_MD5,yes)
>  endef
>  
>  ifeq ($(BR2_PACKAGE_DOVECOT),y)

lgtm

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
