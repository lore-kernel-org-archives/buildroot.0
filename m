From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:27:51 +0200
Subject: [Buildroot] [PATCH] Makefile: do not purge locale-archive from
 target
In-Reply-To: <1403083410-4278-1-git-send-email-neumann@teufel.de>
References: <1403083410-4278-1-git-send-email-neumann@teufel.de>
Message-ID: <20140622222751.07fb50a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Wed, 18 Jun 2014 11:23:30 +0200, Sven Neumann wrote:
> The rules to purge unwanted locales from the target also removed
> the locale-archive file from /usr/lib/locale which contains the
> locale definitions explicitly generated for the target.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 14fca2b..d7590ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -516,7 +516,7 @@ LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
>  
>  define TARGET_PURGE_LOCALES
>  	rm -f $(LOCALE_WHITELIST)
> -	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
> +	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done

Hum, right, but isn't 'locale-archive' an archive of many locales?
Shouldn't we get rid of the locales we don't want from this archive?

Which toolchain have you used to get a locale-archive file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
