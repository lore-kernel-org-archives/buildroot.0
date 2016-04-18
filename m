From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:44:20 +0200
Subject: [Buildroot] [PATCH v2] qt5serialbus: new package
In-Reply-To: <1459257824-3098-1-git-send-email-yegorslists@googlemail.com>
References: <1459257824-3098-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160418224420.1ee1cca0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 15:23:44 +0200, yegorslists at googlemail.com wrote:

> +ifeq ($(BR2_STATIC_LIBS),)
> +define QT5SERIALBUS_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialBus.so.* \
> +		$(TARGET_DIR)/usr/lib
> +
> +	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/canbus
> +	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/canbus/*.so \
> +		$(TARGET_DIR)/usr/lib/qt/plugins/canbus
> +
> +	$(INSTALL) -m 0755 -D $(@D)/bin/canbusutil \
> +		$(TARGET_DIR)/usr/bin/canbusutil

This tool is most likely available and should be installed even when
BR2_STATIC_LIBS=y, so I've fixed up this aspect in your package and
applied. Please check
https://git.buildroot.net/buildroot/commit/?id=1a9a9d15e670b0ab93da06e036384514ac69b642,
and if you can, do a BR2_STATIC_LIBS=y build to double check.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
