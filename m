From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Dec 2016 10:53:58 -0300
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xserver_xorg-server: Fix
 build with wayland, part I
In-Reply-To: <20161227130301.22831-1-bernd.kuhls@t-online.de>
References: <20161227130301.22831-1-bernd.kuhls@t-online.de>
Message-ID: <6f7625ba97b12bdc84155e79a7546cbf@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-12-27 10:02, Bernd Kuhls wrote:

>  # Xwayland support needs libdrm, libepoxy, wayland and libxcomposite
> -ifeq
> ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyy)
> +ifeq
> ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyy)

Hi.
Maybe missing an additional 'y' for the added dependency?
Regards.
