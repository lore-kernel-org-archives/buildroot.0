From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:49:47 +0200
Subject: [Buildroot] [PATCH v5 7/8] package/kodi: add optional support
 for libvdpau
In-Reply-To: <1468260542-7194-7-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
 <1468260542-7194-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717144947.013a495b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 20:09:01 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_KODI_LIBVDPAU
> +	bool "vdpau"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBVDPAU
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT

These are already selected by the libvdpau package, and you were not
adding them as dependencies in the .mk file, so I've dropped those two
lines.

> +	help
> +	  Enable libvdpau support.
> +
> +comment "libvdpau needs X.org"

Changes to "libvdpau support needs X.org"

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
