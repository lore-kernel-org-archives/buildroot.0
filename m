From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:05:41 +0100
Subject: [Buildroot] [PATCHv3 31/74] tree: don't install man page
In-Reply-To: <1417357142-14307-32-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-32-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130170541.GK4124@free.fr>
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

Regards,
Yann E. MORIN.

> ---
>  package/tree/tree.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/tree/tree.mk b/package/tree/tree.mk
> index 922deb8..83ea472 100644
> --- a/package/tree/tree.mk
> +++ b/package/tree/tree.mk
> @@ -16,8 +16,6 @@ endef
>  
>  define TREE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/tree $(TARGET_DIR)/usr/bin/tree
> -	$(INSTALL) -D -m 0644 $(@D)/doc/tree.1 \
> -		$(TARGET_DIR)/usr/share/man/man1/tree.1
>  endef
>  
>  $(eval $(generic-package))
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
