From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Feb 2015 21:04:39 +0100
Subject: [Buildroot] [PATCH v3] libgtk2: skip tutorial and faq build
In-Reply-To: <20150226165558.0A80BE0447@smtp.hushmail.com>
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk>
 <20150226165558.0A80BE0447@smtp.hushmail.com>
Message-ID: <20150226200439.GB3914@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Justin, All,

On 2015-02-26 18:55 +0200, justin.swartz at nym.hush.com spake thusly:
> Fixes: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65165
> 
> Pass "DB2HTML=false" in LIBGTK2_CONF_ENV to disable the building of the
> Tutorial and the FAQ.
> 
> Signed-off-by: Justin Swartz <justin.swartz@nym.hush.com>

So, after re-doing my build tests, it seems that I missed something in
my previous attempts. So:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - Removed 0002-configure-have_docbook.patch
>   - Replaced "ac_cv_prog_DB2HTML=no" with "DB2HTML=no" in
>     LIBGTK2_CONF_ENV
>   - Removed "--disable-gtk-doc-pdf" and "--disable-gtk-doc-html" from
>     LIBGTK2_CONF_OPTS
> 
> Changes v1 -> v2:
>   - Commit log added to the head of "0002-configure-have_docbook.patch"
>   - Moved "--disable-gtk-doc-pdf" and "--disable-gtk-doc-html" to the
>     end of LIBGTK2_CONF_OPTS
> ---
>  package/libgtk2/libgtk2.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index dfc1f5b..f52dfaf 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -69,7 +69,8 @@ LIBGTK2_CONF_ENV = \
>  	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
>  	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
>  	ac_cv_prog_F77=no \
> -	ac_cv_path_CUPS_CONFIG=no
> +	ac_cv_path_CUPS_CONFIG=no \
> +	DB2HTML=false
>  
>  LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
>  
> -- 
> 1.7.12.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
