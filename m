From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Jan 2015 23:22:41 +0100
Subject: [Buildroot] [PATCH] libcurl: drop curl* aliases
In-Reply-To: <1421061436-8322-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421061436-8322-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150112222241.GC9000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-01-12 08:17 -0300, Gustavo Zacarias spake thusly:
> They're unused hence not useful.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index db5fdb7..014c5e3 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -67,8 +67,3 @@ LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>  endif
>  
>  $(eval $(autotools-package))
> -
> -curl: libcurl
> -curl-clean: libcurl-clean
> -curl-dirclean: libcurl-dirclean
> -curl-source: libcurl-source

Oh! That's why we were able to build git until now... Sigh, I missed
that when I cleaned git up...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
