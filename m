From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 19:24:01 +0200
Subject: [Buildroot] [PATCH] fluxbox: select xmodmap
In-Reply-To: <1350370149-2876-1-git-send-email-yegorslists@googlemail.com>
References: <1350370149-2876-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20121016192401.04d2eaf1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 16 Oct 2012 08:49:09 +0200, yegorslists at googlemail.com wrote:

> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUXBOX
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XAPP_XMODMAP
>  	help
>  	  The Fluxbox lightweight window manager for X

When a dependency like this is a runtime dependency, I generally like
to have a short comment on top of it. It's kind of likely that someone
will read fluxbox.mk, not see xmodmap in FLUXBOX_DEPENDENCIES, and
therefore wonder why this "select" is around. For sure, Git history is
here, but I think something like:

	# Runtime dependency, needed by startup script
	select BR2_PACKAGE_XAPP_XMODMAP

Doesn't harm too much and can be quite useful in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
