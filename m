From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 11:35:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/libhttpserver: disable examples
In-Reply-To: <20200604213522.12291-1-fontaine.fabrice@gmail.com>
References: <20200604213522.12291-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606093545.GB13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-04 23:35 +0200, Fabrice Fontaine spake thusly:
> examples are enabled by default since version 0.17.5 and
> https://github.com/etr/libhttpserver/commit/012d014a7c52ef91a35c521d5d4f83ee11de5068
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks.

> ---
>  package/libhttpserver/libhttpserver.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
> index 1fd76519f4..2c536cf012 100644
> --- a/package/libhttpserver/libhttpserver.mk
> +++ b/package/libhttpserver/libhttpserver.mk
> @@ -9,7 +9,9 @@ LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
>  LIBHTTPSERVER_LICENSE = LGPL-2.1+
>  LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
>  LIBHTTPSERVER_INSTALL_STAGING = YES
> -LIBHTTPSERVER_CONF_OPTS = --enable-same-directory-build
> +LIBHTTPSERVER_CONF_OPTS = \
> +	--disable-examples \
> +	--enable-same-directory-build
>  LIBHTTPSERVER_AUTORECONF = YES
>  LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
>  
> -- 
> 2.26.2
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
