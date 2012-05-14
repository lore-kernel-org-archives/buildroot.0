From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 May 2012 21:43:08 +0200
Subject: [Buildroot] [PATCH 3/3] wpa_supplicant: bump to version 1.0
In-Reply-To: <1336998600-3373-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 14 May 2012 09:30:00 -0300")
References: <1336998600-3373-1-git-send-email-gustavo@zacarias.com.ar>
 <1336998600-3373-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mx5azgz7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump to version 1.0
 Gustavo> Also convert to gentargets.

..

 Gustavo> +define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 Gustavo> +	$(WPA_SUPPLICANT_INSTALL_CLI)
 Gustavo> +	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 Gustavo> +endef
 Gustavo> +
 Gustavo> +ifeq ($(BR2_PACKAGE_DBUS),y)
 Gustavo>  define WPA_SUPPLICANT_INSTALL_DBUS
 Gustavo>  	$(INSTALL) -D \
 Gustavo>  	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
 Gustavo> @@ -113,23 +127,16 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 Gustavo>  	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \

..

 Gustavo> -define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
 Gustavo> -	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
 Gustavo> -	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 Gustavo> -	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 Gustavo> -	rm -f $(TARGET_DIR)/usr/etc/wpa_supplicant.conf
 Gustavo> +define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 Gustavo> +	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 Gustavo> +		$(TARGET_DIR)/usr/sbin/wpa_supplicant


You seem to have WPA_SUPPLICANT_INSTALL_TARGET_CMDS twice?

-- 
Bye, Peter Korsgaard
