From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:08:55 +0100
Subject: [Buildroot] [PATCH 10/11] package/oracle-mysql: use bundled
 GPL-2.0+ libreadline
In-Reply-To: <20191113151724.12155-11-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-11-peter@korsgaard.com>
Message-ID: <20191113210855.GS3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> oracle-mysql is licensed under GPL-2.0, which is not license compatible with
> modern readline (GPL-3.0+), so instead use the bundled older version
> (GPL-2.0+ licensed) of readline instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mysql/Config.in              | 1 -
>  package/oracle-mysql/oracle-mysql.mk | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mysql/Config.in b/package/mysql/Config.in
> index d3f9f1f00d..ef4a9531a7 100644
> --- a/package/mysql/Config.in
> +++ b/package/mysql/Config.in
> @@ -37,7 +37,6 @@ comment "mariadb needs a toolchain w/ dynamic library"
>  config BR2_PACKAGE_ORACLE_MYSQL
>  	bool "oracle mysql"
>  	select BR2_PACKAGE_NCURSES
> -	select BR2_PACKAGE_READLINE
>  	select BR2_PACKAGE_HAS_MYSQL
>  	help
>  	  The MySQL Open Source Database System
> diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
> index 0275a8428f..326fbcc040 100644
> --- a/package/oracle-mysql/oracle-mysql.mk
> +++ b/package/oracle-mysql/oracle-mysql.mk
> @@ -9,7 +9,7 @@ ORACLE_MYSQL_VERSION = $(ORACLE_MYSQL_VERSION_MAJOR).73
>  ORACLE_MYSQL_SOURCE = mysql-$(ORACLE_MYSQL_VERSION).tar.gz
>  ORACLE_MYSQL_SITE = http://dev.mysql.com/get/Downloads/MySQL-$(ORACLE_MYSQL_VERSION_MAJOR)
>  ORACLE_MYSQL_INSTALL_STAGING = YES
> -ORACLE_MYSQL_DEPENDENCIES = readline ncurses
> +ORACLE_MYSQL_DEPENDENCIES = ncurses
>  ORACLE_MYSQL_AUTORECONF = YES
>  ORACLE_MYSQL_LICENSE = GPL-2.0
>  ORACLE_MYSQL_LICENSE_FILES = README COPYING
> @@ -33,7 +33,7 @@ ORACLE_MYSQL_CONF_OPTS = \
>  	--without-docs \
>  	--without-man \
>  	--without-libedit \
> -	--without-readline \
> +	--with-readline \
>  	--with-low-memory \
>  	--enable-thread-safe-client \
>  	--with-unix-socket-path=$(MYSQL_SOCKET) \
> -- 
> 2.20.1
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
