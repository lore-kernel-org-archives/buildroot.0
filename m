From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2009 16:58:15 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <20090803143614.GK19257@buzzloop.caiaq.de>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
Message-ID: <20090803165815.312deddd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 3 Aug 2009 16:36:14 +0200,
Daniel Mack <daniel@caiaq.de> a ?crit :

> diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
> index cdd769e..aeb02df 100755
> --- a/package/gupnp/Config.in
> +++ b/package/gupnp/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_GUPNP
>          select BR2_PACKAGE_E2FSPROGS
>          select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_GSSDP
> +	select BR2_PACKAGE_LIBUUID
>  	help
>            GUPnP implements the UPnP specification: resource
> announcement and discovery, description, control, event notification,
> and

Usually, when a select dependency is added, the .mk should be modified
to make sure that libuuid is effectively compiled before gupnp is
compiled.

BTW, I don't see this gupnp package in the tree. Is the patch waiting
somewhere ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
