From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 12:41:38 +0200
Subject: [Buildroot] [PATCH] more about package managers
In-Reply-To: <20200621082017.182812-1-francois.perrad@gadz.org>
References: <20200621082017.182812-1-francois.perrad@gadz.org>
Message-ID: <20200621104138.GD2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-06-21 10:20 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 85d732636..a938b0d8d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2253,6 +2253,7 @@ comment "http://buildroot.org/manual.html#faq-no-binary-packages"
>  comment "-------------------------------------------------------"
>  	source "package/opkg/Config.in"
>  	source "package/rpm/Config.in"
> +comment "BusyBox could supply its own version of dpkg and rpm."

We do not have similar comments elsewhere in the tree. People that want
the full-blown rpm or dpkg will have to do like we do for all other
packages that are provided by busybox: enable BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.

If you were concerned that the menu is empty without
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, then it is not: thetre is at least opkg
or its dependency comment.

Regards,
Yann E. MORIN.

>  endmenu
>  
>  menu "Real-Time"
> -- 
> 2.25.1
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
