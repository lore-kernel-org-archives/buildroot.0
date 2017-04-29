From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:05:46 +0200
Subject: [Buildroot] [PATCH v7 24/31] package/kodi: add optional support
 for pulseaudio
In-Reply-To: <20170429083751.19625-25-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-25-bernd.kuhls@t-online.de>
Message-ID: <20170429120546.06d58dbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:44 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_KODI_PULSEAUDIO
> +	bool "pulseaudio"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
> +	# Kodi meets all dependencies of libglib2, so there is no need
> +	# to propagate its dependencies here.
> +	select BR2_PACKAGE_LIBGLIB2

There needs to be an explanation why libglib2 is selected here, but not
in the KODI_DEPENDENCIES variable. I guess it's because you need glib2
support in pulseaudio, but that should be explained by a comment
because it's not very obvious.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
