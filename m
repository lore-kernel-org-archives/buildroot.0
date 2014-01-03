From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 22:40:29 +0100
Subject: [Buildroot] [PATCH v2] wmctrl: new package
In-Reply-To: <1388698180-33026-1-git-send-email-jezz@sysmic.org>
References: <1388698180-33026-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140103224029.595f5e75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu,  2 Jan 2014 22:29:40 +0100, J?r?me Pouiller wrote:
> Provides command line access to almost all the features defined in
> the EWMH specification. It can be used, for example, to get
> information about the window manager, to get a detailed list of
> desktops and managed windows, to switch and resize desktops, to
> make windows full-screen, always-above or sticky, and to activate,
> close, move, resize, maximize and minimize them.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>  Fix alphabetical order
>  Fix dependencies

Applied, after a few fixes, see below.

> +	help
> +	  Provides command line access to almost all the features defined in 
> +	  the EWMH specification. It can be used, for example, to get 
> +	  information about the window manager, to get a detailed list of 
> +	  desktops and managed windows, to switch and resize desktops, to 
> +	  make windows full-screen, always-above or sticky, and to activate, 
> +	  close, move, resize, maximize and minimize them. 

These lines were slightly too long, and contained trailing whitespaces.

> +comment "libglib2 needs a toolchain w/ mmu, wchar, threads"
> +	depends on !BR2_USE_MMU || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

It is not necessary to comment about the MMU dependency.

> +WMCTRL_LICENSE = GPLv2

License is GPLv2+.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
