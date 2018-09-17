From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Sep 2018 12:01:55 +0200
Subject: [Buildroot] [PATCH 2/2] monkey: add option for SSL/TLS plugin
 compilation
In-Reply-To: <2120fe96-83cd-3d1e-0bfb-e085dafaad36@smile.fr>
References: <2120fe96-83cd-3d1e-0bfb-e085dafaad36@smile.fr>
Message-ID: <20180917120155.617afb89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

Thanks for your contribution!

On Mon, 17 Sep 2018 12:09:01 +0200, Pierret David wrote:
> This commit add an option to enable SSL/TLS plugin compilation who is 
> not build
> by default.
> If mbedtls library is selected, she will be used instead of build-in one.

We always want to use external libraries instead of bundled libraries.

> +config BR2_PACKAGE_MONKEY_SSL
> +        bool "enable SSL/TLS"
> +        help
> +          Enable build of the SSL/TLS plugin.

Please use one tab to indent bool and help, and one tab + two spaces to
indent the help text.

Make sure to run "make check-package" after your changes to verify that
you do not introduce coding style issues such as those ones.

> +ifeq ($(BR2_PACKAGE_MONKEY_SSL), y)

No space before "y".

> +MONKEY_CONF_OPTS += --enable-plugins=tls
> +# If we already have TLS/SSL library, use it.
> +ifeq ($(BR2_PACKAGE_MBEDTLS), y)
> +MONKEY_CONF_OPTS += --mbedtls-shared
> +endif
> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
