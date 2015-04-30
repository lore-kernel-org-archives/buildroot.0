From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Apr 2015 10:31:47 +0200
Subject: [Buildroot] [PATCH v6 03/15] gpu-viv-bin-mx6q: make fb/x11
	choice explicit
In-Reply-To: <1421451251-23366-4-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
 <1421451251-23366-4-git-send-email-jezz@sysmic.org>
Message-ID: <20150430103147.62f30974@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 17 Jan 2015 00:33:59 +0100, J?r?me Pouiller wrote:

> +choice
> +	prompt "Output option"
> +	help
> +	  There are two versions of this library: one for
> +	  direct framebuffer access, one for X11 rendering.
> +	  Choose here which version to install.
> +
> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	bool "X11"

The bool should have been the first property, before depends on and
select properties.

I guess we'll fix up when applying since it is a minor thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
