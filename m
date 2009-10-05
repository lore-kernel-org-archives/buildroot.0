From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Oct 2009 10:45:14 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: adjust make environment for
	pkg-config call
In-Reply-To: <1254731431-8430-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Mon\, 5 Oct 2009 10\:30\:31 +0200")
References: <1254731431-8430-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87y6nq44bp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> In case that wpa_supplicant is configured with DBus interface,
 Sven> it calls pkg-config to find the dbus headers and libraries.
 Sven> Adjust the make environment so that it will use the right
 Sven> pkg-config search paths.

 Sven>  ifeq ($(BR2_PACKAGE_DBUS),y)
 Sven> -	WPA_SUPPLICANT_DEPENDENCIES += dbus
 Sven> +	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconfig dbus
 Sven> +	WPA_SUPPLICANT_MAKE_ENV = \
 Sven> +		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 Sven> +		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

Won't this pick up /usr/bin/pkg-config instead of the one in HOST_DIR? I
would prefer to simply use TARGET_CONFIGURE_OPTS here so the path gets
set and we only have the pkgconfig magic one place.

-- 
Bye, Peter Korsgaard
