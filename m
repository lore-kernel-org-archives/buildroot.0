From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:14:00 +0100
Subject: [Buildroot] [PATCHv3 44/74] irda-utils: add error handling to
 for loop
In-Reply-To: <1417357142-14307-45-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-45-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171400.GX4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alll,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/irda-utils/irda-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
> index e4958e5..2c35dff 100644
> --- a/package/irda-utils/irda-utils.mk
> +++ b/package/irda-utils/irda-utils.mk
> @@ -32,7 +32,7 @@ IRDA_UTILS_SBINS- += $(IRDA_UTILS_SBINS-y)
>  
>  define IRDA_UTILS_INSTALL_TARGET_CMDS
>  	for i in $(IRDA_UTILS_SBINS-y); do \
> -		$(INSTALL) -m 0755 -D $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i; \
> +		$(INSTALL) -m 0755 -D $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
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
