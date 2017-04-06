From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:38:31 +0200
Subject: [Buildroot] [PATCH v4 02/39] package/libdvdread: add
 Kodi-specific patches
In-Reply-To: <20170323172900.25458-3-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
 <20170323172900.25458-3-bernd.kuhls@t-online.de>
Message-ID: <20170406223831.648c10df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 18:28:23 +0100, Bernd Kuhls wrote:

> +# enable Kodi-specific code
> +ifeq ($(BR2_PACKAGE_KODI),y)
> +LIBDVDREAD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_XBMC"
> +endif

This really feels clunky (ditto in patch 03/39). Why does the Kodi
related code needs to be conditional?

What if libdvdread is used in the same system for Kodi and for
something else?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
