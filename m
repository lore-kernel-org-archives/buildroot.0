From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 10:54:44 +0200
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
 package
In-Reply-To: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20140927085443.GA4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

What is the rationale for building it as a host-package?

libarchive provides a library, but we have no in-tree host-package that
uses libarchive.

On 2014-09-26 20:23 -0300, Guido Mart?nez spake thusly:
> It works correctly without any changes, so just enable it.

This should not be part of the commit log. The commit log should just
explain why you enable host-libarchive, especially because we have no
in-tree user.

Regards,
Yann E. MORIN.

> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/libarchive/libarchive.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 8c6951d..22914c2 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -69,3 +69,4 @@ LIBARCHIVE_CONF_OPT += --without-zlib
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
