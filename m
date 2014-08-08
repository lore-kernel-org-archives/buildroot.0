From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 08 Aug 2014 09:49:00 -0300
Subject: [Buildroot] [PATCH 1/1] MPD: Add jack output support option
In-Reply-To: <1407485662-1712-1-git-send-email-pieter.degendt@gmail.com>
References: <1407485662-1712-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <53E4C73C.8050605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2014 05:14 AM, Pieter De Gendt wrote:

Hi.
A couple of details...

> +config BR2_PACKAGE_MPD_JACK2
> +	bool "jack2"
> +	depends on BR2_LARGEFILE # libsndfile
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +	select BR2_PACKAGE_JACK2
> +	help
> +	  Enable jack output support.
> +

The THREADS, MMU and LIBSTDCPP depends are unnecessary since mpd already
requires them, so you can drop them like it's already done for all of
the other options for mpd.
Also you're missing a comment when LARGEFILE & ATOMIC_INTRINSICS aren't
available telling that jack2 isn't available, similar to what's done for
pulseaudio for example.
Alpha-sorting the menu entry would be good too.
Otherwise it looks good.
Care to send a v2 patch with these fixes?
Thanks.
Regards.
