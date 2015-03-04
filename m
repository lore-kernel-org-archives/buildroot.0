From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:33:45 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: install systemd service
 files
In-Reply-To: <1425411738-3369-1-git-send-email-mike@mikebwilliams.com>
References: <1425411738-3369-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150304213345.6c41d0e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue,  3 Mar 2015 14:42:18 -0500, Mike Williams wrote:

> +define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
> +		$(TARGET_DIR)/lib/systemd/system

When using -D, the destination should be a full path, otherwise your
file will be named $(TARGET_DIR)/lib/systemd/system if
$(TARGET_DIR)/lib/systemd/system isn't an existing directory.

> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
> +		$(TARGET_DIR)/lib/systemd/system
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
> +		$(TARGET_DIR)/lib/systemd/system
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
> +		$(TARGET_DIR)/lib/systemd/system

Also, and sorry for being so ignorant about systemd, but most of our
other packages set up a bunch of symbolic links when install systemd
unit files. I'm surprised to not see the same thing here. Can you give
some details about this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
