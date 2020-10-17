From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 14:32:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/mpdecimal: add optional C++
 dependency
In-Reply-To: <20201016201916.2082927-1-fontaine.fabrice@gmail.com>
References: <20201016201916.2082927-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017123225.GL3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-16 22:19 +0200, Fabrice Fontaine spake thusly:
> Version 2.5.0 enables the new libmpdec++ library by default:
> http://www.bytereef.org/mpdecimal/changelog.html#version-2-5-0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I however melt the two patches into one: indeed, if one enables C++ and
static, then this first patch alone is not enough. The C++ + static fix
belongs to this patch.

Regards,
Yann E. MORIN.

> ---
>  package/mpdecimal/mpdecimal.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
> index 00aa98e693..fa310a2274 100644
> --- a/package/mpdecimal/mpdecimal.mk
> +++ b/package/mpdecimal/mpdecimal.mk
> @@ -22,4 +22,10 @@ MPDECIMAL_CONF_ENV += MACHINE=ansi32
>  endif
>  endif
>  
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +MPDECIMAL_CONF_OPTS += --enable-cxx
> +else
> +MPDECIMAL_CONF_OPTS += --disable-cxx
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.28.0
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
