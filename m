From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 23:21:11 +0200
Subject: [Buildroot] [PATCH 09/10] glib-networking: remove redundant
	dependency on gettext
In-Reply-To: <20121014211110.17845.3033.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211110.17845.3033.stgit@localhost>
Message-ID: <201210142321.11131.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/glib-networking/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
> index dab35ea..f1aa7ee 100644
> --- a/package/glib-networking/Config.in
> +++ b/package/glib-networking/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
>  	bool "glib-networking"
>  	depends on BR2_USE_WCHAR # glib2
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  Network-related GIO modules for glib.

The commit message says "remove redundant dependency on gettext", but this
change changes the dependency on plain gettext to gettext-if-locales.

Thus, I think the subject is wrong, and should be changed to something like:
    glib-networking: only depends on gettext if locales are used

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
