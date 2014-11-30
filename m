From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:00:03 +0100
Subject: [Buildroot] [PATCHv3 29/74] wipe: don't install man pages
In-Reply-To: <1417357142-14307-30-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-30-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130170003.GI4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> We don't support installing documentation on the target, so there's no
> point in having explicit code to do so.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/wipe/wipe.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
> index 4deabab..ee4682c 100644
> --- a/package/wipe/wipe.mk
> +++ b/package/wipe/wipe.mk
> @@ -13,7 +13,6 @@ WIPE_LICENSE_FILES = LICENSE
>  
>  define WIPE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe

Maybe this should include -m 0755 as well?

Regards,
Yann E. MORIN.

> -	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
>  endef
>  
>  $(eval $(autotools-package))
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
