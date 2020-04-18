From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:56:35 +0200
Subject: [Buildroot] [PATCH v4] package/swupdate: add basic systemd/sysv
 service
In-Reply-To: <20200418003110.44556-1-matthew.weber@rockwellcollins.com>
References: <20200418003110.44556-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200418145635.70ec949f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Apr 2020 19:31:10 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:


> +ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
> +define SWUPDATE_INSTALL_COMMON
> +	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
> +		$(TARGET_DIR)/usr/lib/swupdate/conf.d
> +	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
> +		$(TARGET_DIR)/usr/lib/swupdate

Should have been a full destination path.

> +define SWUPDATE_INSTALL_INIT_SYSV
> +	$(SWUPDATE_INSTALL_COMMON)
> +	$(INSTALL) -D -m 755 package/swupdate/S80SWUpdate \
> +		$(TARGET_DIR)/etc/init.d/

Ditto. And also, why S80SWUpdate instead of S80swupdate? I've renamed
to lower-case.

Applied with those minor nits fixed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
