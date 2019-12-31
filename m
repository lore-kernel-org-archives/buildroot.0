From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 18:27:56 +0100
Subject: [Buildroot] [PATCH] package/php: remove sample config in new
 location
In-Reply-To: <20191128130316.6004-1-p.debruijn@unilogic.nl>
References: <20191128130316.6004-1-p.debruijn@unilogic.nl>
Message-ID: <20191231172756.GC3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2019-11-28 14:03 +0100, Pascal de Bruijn spake thusly:
> From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
> 
> the upstream php-fpm sample configuration is placed in
> 
>   /etc/php-fpm.d/www.conf.default
> 
> in recent version of php, so adjust the build cleanup
> accordingly
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 007b8a6..c83f04a 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -346,7 +346,7 @@ endef
>  define PHP_INSTALL_FPM_CONF
>  	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
>  		$(TARGET_DIR)/etc/php-fpm.conf
> -	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
> +	rm -rf $(TARGET_DIR)/etc/php-fpm.d

I've changed that to only remove the file, not the whole directory, in
case an other (built earlier) package installs files there.

Applied to master with that fix, thanks.

Regards,
Yann E. MORIN.

>  	# remove unused sample status page /usr/php/php/fpm/status.html
>  	rm -rf $(TARGET_DIR)/usr/php
>  endef
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
