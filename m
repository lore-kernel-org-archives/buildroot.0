From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 23:27:28 +0200
Subject: [Buildroot] [PATCH 06/10] avahi: remove double dependency on
	gettext
In-Reply-To: <20121014211032.17845.70959.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211032.17845.70959.stgit@localhost>
Message-ID: <201210142327.28517.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atnout, All,

On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/avahi/avahi.mk |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 03dc368..6a6f524 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -133,10 +133,7 @@ else
>  AVAHI_CONF_OPT += --disable-python
>  endif
>  
> -ifeq ($(BR2_PACKAGE_GETTEXT),y)
> -AVAHI_DEPENDENCIES += gettext
> -AVAHI_MAKE_OPT = LIBS=-lintl
> -endif
> +AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
>  
>  define AVAHI_REMOVE_INITSCRIPT
>  	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
