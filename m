From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jan 2014 23:06:38 +0100
Subject: [Buildroot] [PATCH v2, 1/3] Rename MySQL client package
In-Reply-To: <1390313310-3453-1-git-send-email-kuyurix@gmail.com>
References: <1390313310-3453-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140121220638.GC3455@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-01-21 14:08 +0000, Marcelo Guti?rrez spake thusly:
> MySQL client package has been renamed to MySQL.
> 
> Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a minor nit, see below...

> diff --git a/package/mysql_client/Config.in b/package/mysql/Config.in
> similarity index 61%
> rename from package/mysql_client/Config.in
> rename to package/mysql/Config.in
> index 543bed1..229e050 100644
> --- a/package/mysql_client/Config.in
> +++ b/package/mysql/Config.in
> @@ -1,13 +1,14 @@
> -config BR2_PACKAGE_MYSQL_CLIENT
> -	bool "MySQL client"
> +config BR2_PACKAGE_MYSQL
> +	bool "MySQL"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_READLINE
>  	help
> -	  MySQL client
> +          The MySQL Open Source Database System

This hould be a leading tab and two spaces. No need to resend, Peter can
fix while committing, I guess! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
