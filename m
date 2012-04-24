From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Apr 2012 00:03:30 +0200
Subject: [Buildroot] [PATCH v2 1/2] wpa_supplicant: install basic
 configuration file
In-Reply-To: <87pqawga6d.fsf@macbook.be.48ers.dk>
References: <1335164155-20004-1-git-send-email-yegorslists@googlemail.com>
 <87pqawga6d.fsf@macbook.be.48ers.dk>
Message-ID: <20120425000330.638f4e37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 24 Apr 2012 22:13:46 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  yegorslists> +define WPA_SUPPLICANT_INSTALL_CONFIG
>  yegorslists> +	$(INSTALL) -m 644 \
>  yegorslists> +	  package/wpa_supplicant/wpa_supplicant.conf  $(TARGET_DIR)/etc/wpa_supplicant.conf
> 
> Normally we only install these default files if not already present in
> the rootfs, so people can put their own version in the skeleton if they
> need something else. See ifplugd for an example.

I am less and less sure this is a scenario we should support. We have
been talking for a while of removing the ability of using a custom
target skeleton, and instead recommend all users to use the post-build
script capability, which is much more appropriate.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
