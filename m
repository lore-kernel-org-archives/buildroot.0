From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:10:16 +0100
Subject: [Buildroot] [PATCHv3 37/74] rp-pppoe: bail out of installation
 fails
In-Reply-To: <1417357142-14307-38-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-38-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171016.GQ4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Add an "|| exit 1" in the installation loop, otherwise if one of the
> file fails to install, the build doesn't abort.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In title:  s/of/if/

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rp-pppoe/rp-pppoe.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index 6827628..4e17f2d 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -19,7 +19,7 @@ RP_PPPOE_CONF_ENV = \
>  
>  define RP_PPPOE_INSTALL_TARGET_CMDS
>  	for ff in $(RP_PPPOE_TARGET_FILES); do \
> -		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff; \
> +		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
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
