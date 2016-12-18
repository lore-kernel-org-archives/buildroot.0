From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:28:10 +0100
Subject: [Buildroot] [PATCH] xorg-server: add dependency on dri2proto
 when systemd is built
In-Reply-To: <20161129143658.20619-1-fparent@baylibre.com>
References: <20161129143658.20619-1-fparent@baylibre.com>
Message-ID: <20161218142810.2602f895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 15:36:58 +0100, Fabien Parent wrote:

> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 51c3efc..adad2a7 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -73,7 +73,8 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  XSERVER_XORG_SERVER_CONF_OPTS += \
>  	--with-systemd-daemon \
>  	--enable-systemd-logind
> -XSERVER_XORG_SERVER_DEPENDENCIES += systemd
> +XSERVER_XORG_SERVER_DEPENDENCIES += systemd		\
> +				    xproto_dri2proto

Indentation was a bit off here, so I've fixed that and applied.

However, I have to say I'm not really happy with those very
complicated/nasty dependencies of the X.org server that don't really
make any sense. Why is dri2proto needed for systemd support?

Also, what bothers me is that such missing dependencies cause some
build failures, while the configure script should detect those
dependencies and abort. It would be nice if we could track those issues
and report them back upstream so that they can fix their configure
script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
