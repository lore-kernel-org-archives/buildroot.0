From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 09 Mar 2015 09:26:59 -0300
Subject: [Buildroot] [PATCH 3/3] Added support for PHP/SQLite3 (non PDO).
In-Reply-To: <1425850629-14725-3-git-send-email-mc5686@mclink.it>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
 <1425850629-14725-3-git-send-email-mc5686@mclink.it>
Message-ID: <54FD9193.40108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/08/2015 06:37 PM, Mauro Condarelli wrote:

> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/php/Config.ext |    6 ++++++
>  package/php/php.mk     |    4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index daf16c7..57685b2 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -120,6 +120,12 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
>  	help
>  	  MySQL Improved extension support
>  
> +config BR2_PACKAGE_PHP_EXT_SQLITE
> +	bool "SQLite3"
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  SQLite3 support
> +

We normally sort entries in menu entries (inside categories of course).
But given that PDO is a distinct class of database support within PHP:

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
