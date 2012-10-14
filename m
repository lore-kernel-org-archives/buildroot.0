From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 23:24:20 +0200
Subject: [Buildroot] [PATCH 10/10] libsoup: remove redundant dependency
	on gettext
In-Reply-To: <20121014211121.17845.45817.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211121.17845.45817.stgit@localhost>
Message-ID: <201210142324.20324.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/libsoup/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
> index 57b425f..219f822 100644
> --- a/package/libsoup/Config.in
> +++ b/package/libsoup/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBSOUP
>  	depends on BR2_USE_WCHAR # glib2 and gnutls
>  	select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  libsoup is an HTTP client/server library. It uses GObject
>  	  and the GLib main loop, to integrate well with GNOME

Ditto the glib-networking patch: the subject is misleading. Change to
something like:
    libsoup: only depends on gettext if locales are used

Or maybe you meant that gettext is needed by libglib2, not by libsoup
itself? In which case you want to remove the select altogether.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
