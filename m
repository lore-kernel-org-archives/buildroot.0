From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:12:45 +0100
Subject: [Buildroot] [PATCHv3 41/74] flot: add error handling to for loop
In-Reply-To: <1417357142-14307-42-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-42-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171245.GU4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/flot/flot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flot/flot.mk b/package/flot/flot.mk
> index 79bdf1f..58e3ff1 100644
> --- a/package/flot/flot.mk
> +++ b/package/flot/flot.mk
> @@ -27,7 +27,7 @@ FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
>  
>  define FLOT_INSTALL_TARGET_CMDS
>  	for i in $(FLOT_FILES); do \
> -		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
> +		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js || exit 1; \
>  	done
>  endef
>  
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
