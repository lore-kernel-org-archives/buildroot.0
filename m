From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 19 May 2014 19:27:06 -0300
Subject: [Buildroot] [git commit] mysql: Add optional zlib dependency
In-Reply-To: <20140517112201.D10199CB44@busybox.osuosl.org>
References: <20140517112201.D10199CB44@busybox.osuosl.org>
Message-ID: <CA+kK6Wt9j5-bK8YEOmQ+vVfbcf+YzOE702XdsJozYwUVBMTZDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I've sent a patch to fix zlib dependency a few months ago:

http://patchwork.ozlabs.org/patch/326425/

Just need to install host-zlib.

Regards,
Marcelo

2014-05-17 8:21 GMT-03:00 Peter Korsgaard <peter@korsgaard.com>:
> commit: http://git.buildroot.net/buildroot/commit/?id=221b52b3ab8f4f90ebfe25ff52512233fd6fa49e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Make sure zlib is built before mysql.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mysql/mysql.mk |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
> index 5b30d84..d338c31 100644
> --- a/package/mysql/mysql.mk
> +++ b/package/mysql/mysql.mk
> @@ -33,6 +33,10 @@ MYSQL_CONF_OPT = \
>         --enable-thread-safe-client \
>         --disable-mysql-maintainer-mode
>
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +MYSQL_DEPENDENCIES += zlib
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
>  MYSQL_DEPENDENCIES += host-mysql host-bison
>  HOST_MYSQL_DEPENDENCIES =
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
