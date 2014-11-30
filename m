From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:11:03 +0100
Subject: [Buildroot] [PATCHv3 71/74] php: install configuration file
 unconditionally
In-Reply-To: <1417357142-14307-72-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-72-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130181103.GA4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/php/php.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 9456f1c..caaf548 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -238,10 +238,8 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
>  define PHP_INSTALL_FIXUP
>  	rm -rf $(TARGET_DIR)/usr/lib/php
>  	rm -f $(TARGET_DIR)/usr/bin/phpize
> -	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
> -		$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
> -			$(TARGET_DIR)/etc/php.ini; \
> -	fi
> +	$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
> +		$(TARGET_DIR)/etc/php.ini
>  endef
>  
>  PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
