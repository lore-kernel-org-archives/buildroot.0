From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 19:38:53 +0100
Subject: [Buildroot] [PATCH v2] cwiid: new package
In-Reply-To: <1388689257-31068-1-git-send-email-s.martin49@gmail.com>
References: <1388689257-31068-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140128193853.5ab63cf1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu,  2 Jan 2014 20:00:57 +0100, Samuel Martin wrote:

> +if BR2_PACKAGE_CWIID
> +config BR2_PACKAGE_CWIID_WMGUI
> +	bool "wmgui"
> +	depends on BR2_PACKAGE_XORG7 # libgtk2
> +	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
> +	depends on BR2_USE_MMU # libgtk2 -> libglib2
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGTK2
> +endif

> +ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
> +CWIID_DEPENDENCIES += libgtk2 libglib2
> +CWIID_CONF_OPT += --enable-wmgui
> +else
> +CWIID_CONF_OPT += --disable-wmgui
> +endif

That's a very minor nitpick, but libgtk2 strongly requires libglib2, so
selecting and depending on both isn't very useful. Having the select
and dependency on gtk2 would probably have been sufficient, IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
