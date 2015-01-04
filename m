From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:37:13 +0100
Subject: [Buildroot] [PATCH v4 06/17] erlang-lager: new package.
In-Reply-To: <1418135662-773-7-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-7-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150104223713.16258168@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue,  9 Dec 2014 15:34:11 +0100, Johan Oudinet wrote:

> diff --git a/package/erlang-lager/Config.in b/package/erlang-lager/Config.in
> new file mode 100644
> index 0000000..f83239e
> --- /dev/null
> +++ b/package/erlang-lager/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_ERLANG_LAGER
> +	bool "erlang-lager"
> +	depends on BR2_PACKAGE_ERLANG

Same as erlang-goldrush.

> +	select BR2_PACKAGE_ERLANG_GOLDRUSH
> +	help
> +	  Logging framework for Erlang.
> +	  
> +	  Lager (as in the beer) is a logging framework for
> +	  Erlang. Its purpose is to provide a more traditional way to
> +	  perform logging in an erlang application that plays nicely
> +	  with traditional UNIX logging tools like logrotate and
> +	  syslog.

We generally want an upstream web site location at the end of the
Config.in help text.

> diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
> new file mode 100644
> index 0000000..b530c8e
> --- /dev/null
> +++ b/package/erlang-lager/erlang-lager.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# erlang-lager
> +#
> +################################################################################
> +
> +ERLANG_LAGER_VERSION = 2.0.3
> +ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
> +ERLANG_LAGER_LICENSE = Apache-2.0
> +ERLANG_LAGER_LICENSE_FILES = LICENSE
> +ERLANG_LAGER_DEPENDENCIES = erlang erlang-goldrush

The dependency on erlang-goldrush looks OK, but why isn't the
dependency on erlang added automatically by the rebar-package macro?

> +$(eval $(rebar-package))
> +$(eval $(host-rebar-package))

Same as previous package: why a host variant is needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
