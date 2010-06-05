From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 17:30:38 +0200
Subject: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
In-Reply-To: <000f01caf97b$a06e5780$e14b0680$@pauljones.id.au>
References: <000f01caf97b$a06e5780$e14b0680$@pauljones.id.au>
Message-ID: <20100605173038.1734bd81@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Paul,

I still think this is wrong. intltool is required on the host, no on
the target. So:

 * There should be no modification in the Config.in file

 * The dependency in the .mk should be on host-intltool instead

Cheers,

Thomas

On Sat, 22 May 2010 16:54:27 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
> index 8e27dac..a84679c 100644
> --- a/package/x11r7/xkeyboard-config/Config.in
> +++ b/package/x11r7/xkeyboard-config/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_XKEYBOARD_CONFIG
>  	bool "xkeyboard-config"
>  	select BR2_PACKAGE_XAPP_XKBCOMP
> +	select BR2_PACKAGE_INTLTOOL
>  	help
>  	  keyboard configuration database for X
>  
> diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> index 9c9c8b5..3cbfba2 100644
> --- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> +++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> @@ -10,6 +10,7 @@ XKEYBOARD_CONFIG_AUTORECONF = NO
>  XKEYBOARD_CONFIG_INSTALL_STAGING = NO
>  XKEYBOARD_CONFIG_INSTALL_TARGET = YES
>  XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> +XKEYBOARD_CONFIG_DEPENDENCIES = intltool
>  
>  XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
>  


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
