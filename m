From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 22:59:39 +0100
Subject: [Buildroot] [PATCH 3/3] package/rabbitmq-server: bump version
 to 3.8.2
In-Reply-To: <20200129172618.16966-3-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200129172618.16966-3-frank.vanbever@essensium.com>
Message-ID: <20200201225939.12bcd9e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Jan 2020 18:26:18 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:
> diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
> index b3b7639e28..10a7c27d68 100644
> --- a/package/rabbitmq-server/Config.in
> +++ b/package/rabbitmq-server/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_RABBITMQ_SERVER
>  	bool "rabbitmq-server"
>  	depends on BR2_PACKAGE_ERLANG
> +	select BR2_PACKAGE_HOST_ELIXIR

There is no BR2_PACKAGE_HOST_ELIXIR option created by your PATCH 2/3,
and that's good as we don't need one. But then you shouldn't reference
one from here.

> -comment "rabbitmq-server needs erlang"
> -	depends on !BR2_PACKAGE_ERLANG
> +comment "rabbitmq-server needs erlang and elixir"
> +	depends on !BR2_PACKAGE_ERLANG || !BR2_PACKAGE_HOST_ELIXIR

This change is also not needed, as BR2_PACKAGE_HOST_ELIXIR doesn't
exist.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
