From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 25 Apr 2012 08:23:11 +0200
Subject: [Buildroot] [PATCH v2 1/2] wpa_supplicant: install basic
 configuration file
In-Reply-To: <87pqawga6d.fsf@macbook.be.48ers.dk>
References: <1335164155-20004-1-git-send-email-yegorslists@googlemail.com>
 <87pqawga6d.fsf@macbook.be.48ers.dk>
Message-ID: <4F97984F.4000809@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.04.2012 22:13, schrieb Peter Korsgaard:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
> 
>  yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  yegorslists> ---
>  yegorslists>  package/wpa_supplicant/wpa_supplicant.conf |    6 ++++++
>  yegorslists>  package/wpa_supplicant/wpa_supplicant.mk   |    8 ++++++++
>  yegorslists>  2 files changed, 14 insertions(+), 0 deletions(-)
>  yegorslists>  create mode 100755 package/wpa_supplicant/wpa_supplicant.conf
> 
>  
>  yegorslists> +define WPA_SUPPLICANT_INSTALL_CONFIG
>  yegorslists> +	$(INSTALL) -m 644 \
>  yegorslists> +	  package/wpa_supplicant/wpa_supplicant.conf  $(TARGET_DIR)/etc/wpa_supplicant.conf
> 
> Normally we only install these default files if not already present in
> the rootfs, so people can put their own version in the skeleton if they
> need something else. See ifplugd for an example.
> 
>  yegorslists> +
>  yegorslists>  define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
>  yegorslists>  	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
>  yegorslists>  	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
>  yegorslists>  	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
>  yegorslists> +	rm -f $(TARGET_DIR)/usr/etc/wpa_supplicant.conf
> 
> This doesn't work so well when you add the check before installation as
> adding/removing/adding wpasupplicant again would then overwrite the
> skeleton one. I suggest you just skip this.

Should I just this file to default skeleton or drop it completely, so that user would supply it via custom script?

Yegor
