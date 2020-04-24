From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 12:00:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: disable test plugin
In-Reply-To: <20200424092732.50603-1-fontaine.fabrice@gmail.com>
References: <20200424092732.50603-1-fontaine.fabrice@gmail.com>
Message-ID: <20200424100019.GD5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabice, All,

On 2020-04-24 11:27 +0200, Fabrice Fontaine spake thusly:
> test plugin needs dynamic library support
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ce7c69ceac3390f6d22f777e4cf908188486c6b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libuhttpd/libuhttpd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> index 59a8b45c07..9c026cff02 100644
> --- a/package/libuhttpd/libuhttpd.mk
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -10,6 +10,7 @@ LIBUHTTPD_LICENSE = MIT
>  LIBUHTTPD_LICENSE_FILES = LICENSE
>  LIBUHTTPD_INSTALL_STAGING = YES
>  LIBUHTTPD_DEPENDENCIES = libev
> +LIBUHTTPD_CONF_OPTS = -DBUILD_TEST_PLUGIN=OFF
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBUHTTPD_DEPENDENCIES += openssl
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
