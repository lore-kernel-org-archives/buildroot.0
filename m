From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 17:22:54 +0100
Subject: [Buildroot] [PATCH 2/3] libgtk3: gdk-wayland backend depends on
 libX11
In-Reply-To: <20170314114628.10147-2-Vincent.Riera@imgtec.com>
References: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
 <20170314114628.10147-2-Vincent.Riera@imgtec.com>
Message-ID: <20170314172254.367744f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 11:46:27 +0000, Vicente Olivert Riera wrote:

>  config BR2_PACKAGE_LIBGTK3_WAYLAND
>  	bool "Wayland GDK backend"
>  	default y
>  	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> +	depends on BR2_PACKAGE_XLIB_LIBX11

This feels weird. Isn't the point of the Wayland backend specifically
to be used with Wayland, and therefore not to depend on anything X.org
related?

Isn't this a bug in Gtk, rather than something we should fix with an
additional dependency?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
