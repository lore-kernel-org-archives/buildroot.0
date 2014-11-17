From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 22:49:27 +0100
Subject: [Buildroot] [PATCH v3 5/5] package: linux-fusion: use install
	instead of cp
In-Reply-To: <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141117214927.GJ12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
> in order to not depend on the previous permissions of the file
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a comment below...

> ---
>  package/linux-fusion/linux-fusion.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
> index c5e7976..001388c 100644
> --- a/package/linux-fusion/linux-fusion.mk
> +++ b/package/linux-fusion/linux-fusion.mk
> @@ -36,8 +36,8 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
>  		$(LINUX_FUSION_MAKE_OPTS) \
>  		INSTALL_MOD_PATH=$(TARGET_DIR) \
>  		-C $(@D) install
> -	mkdir -p $(LINUX_FUSION_ETC_DIR)
> -	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
> +	$(INSTALL) -D -m 644 package/linux-fusion/40-fusion.rules \
> +		$(LINUX_FUSION_ETC_DIR)/40-fusion.rules

Here, you used a correct construct when calling isntall. ;-)

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.1.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
