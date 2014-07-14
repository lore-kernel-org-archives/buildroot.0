From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Jul 2014 19:28:30 -0300
Subject: [Buildroot] [PATCH 1/1] PHP-FPM support
In-Reply-To: <1405365326-2414-1-git-send-email-jordi.llonch@rochsystems.com>
References: <1405365326-2414-1-git-send-email-jordi.llonch@rochsystems.com>
Message-ID: <53C4598E.90000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 04:15 PM, Jordi Llonch wrote:

Hi, let's look at this.

> +config BR2_PACKAGE_PHP_SAPI_FPM
> +	bool "FPM"
> +	select BR2_PACKAGE_PHP_FPM
> +	help
> +	  PHP-FPM (FastCGI Process Manager)
> +

Pretty sure it depends on MMU just like CGI does.

> +config BR2_PACKAGE_PHP_SAPI_CLI_FPM
> +	bool "FPM and CLI"
> +	select BR2_PACKAGE_PHP_CLI
> +	select BR2_PACKAGE_PHP_FPM
> +	help
> +	  Command line and PHP-FPM (FastCGI Process Manager)
> +

Another option for FPM alone would be good too, not everyone needs CLI
and php binaries are somewhat big.

> +PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm --disable-cgi,--disable--fpm)

This should focus on just enable/disabling it's own option, cgi disables
itself via:

PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)

So no need to re-state that.
Regards.
