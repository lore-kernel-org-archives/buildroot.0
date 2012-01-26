From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2012 13:16:09 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
Message-ID: <20120126131609.70b081f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jan 2012 09:00:47 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> These constructs can get too long too fast, why not something like...
> 
> ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XXX),y)
>      LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt30*.bin 
> LICENCE.ralink-firmware.txt
> endif
> 
> define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
>      cp -af $(addprefix $(@D)/, $(LINUX_FIRMWARE_FILES)) 
> $(TARGET_DIR)/lib/firmware
> endef
> 
> Will be nicer when other people add their wanted firmware to the 
> package.

I was also going to propose something like this, so I fully agree with
Gustavo here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
