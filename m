From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Aug 2014 10:38:46 +0200
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support
 option
In-Reply-To: <53E3E37C.3080605@zacarias.com.ar>
References: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
 <53E3E37C.3080605@zacarias.com.ar>
Message-ID: <20140808103846.054831ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 07 Aug 2014 17:37:16 -0300, Gustavo Zacarias wrote:
> This is done automatically if the libnl package is selected/around.
> We really don't want to thread too thin into hostapd & wpa_supplicant
> config options.

Hum, so, Jean-Baptiste patch is adding CONFIG_DRIVER_NL80211 to the
configuration when libnl is available. But the current
wpa_supplicant.mk does (after removing the static lib special case)

ifeq ($(BR2_PACKAGE_LIBNL),y)
        WPA_SUPPLICANT_DEPENDENCIES += libnl
        WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
else
        WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
endif

So it enables CONFIG_LIBNL32 when libnl is used. Which is not exactly
the same thing. But interesting, in the else case, it's
CONFIG_DRIVER_NL80211 that gets disabled.

I'm a bit confused :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
