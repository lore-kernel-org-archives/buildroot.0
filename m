From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jul 2009 21:20:34 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <1247569492.21613.7.camel@sven> (Sven Neumann's message of "Tue\,
	14 Jul 2009 13\:04\:52 +0200")
References: <1247473258.4007.7.camel@sven> <1247476399.4007.13.camel@sven>
	<87ljms981c.fsf@macbook.be.48ers.dk> <1247495564.20117.4.camel@sven>
	<4A5B4D46.6010807@zacarias.com.ar>
	<87k52c1lt5.fsf@macbook.be.48ers.dk> <1247569492.21613.7.camel@sven>
Message-ID: <874otf137h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> attached is an updated patch that enables the DBus config interface in
 Sven> wpa-supplicant if DBus is enabled in buildroot without introducing
 Sven> another config option.

Thanks!

 Sven> --- ../buildroot-orig/package/wpa_supplicant/wpa_supplicant.mk	2009-07-12 21:13:04.000000000 +0200
 Sven> +++ package/wpa_supplicant/wpa_supplicant.mk	2009-07-13 11:07:52.000000000 +0200
 Sven> @@ -13,10 +13,14 @@
 Sven>  WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 Sven>  WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 Sven>  WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
 Sven> +WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant

Aren't you missing a ".service" here? Service files seems to normally
have the .service extension, and the wpa supplicant file on my machine
(Debian) does as well.

 Sven> +	$(INSTALL) -D \
 Sven> +	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.service \
 Sven> +	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE)

Here you don't add it
 
 Sven> +	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service

But here you do.

-- 
Bye, Peter Korsgaard
