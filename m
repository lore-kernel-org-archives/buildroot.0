From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2012 18:02:04 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <87bopq30ii.fsf@macbook.be.48ers.dk>
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 <87bopq30ii.fsf@macbook.be.48ers.dk>
Message-ID: <20120126180204.5900134e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jan 2012 17:13:25 +0100,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

>  yegorslists> +define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
>  yegorslists> +	mkdir -p $(TARGET_DIR)/lib/firmware
>  yegorslists> +	for i in $(LINUX_FIRMWARE_FILES_y); do \
>  yegorslists> +		cp -af $(@D)/$$i
>  yegorslists> $(TARGET_DIR)/lib/firmware/$$i; \
>  yegorslists> +	done
> 
> That won't work as cp doesn't create the destination directories -
> install -D is also not really good as that doesn't handle symlinks,
> so I think the best approach is to use tar.

What about:

	mkdir -p $(dirname $(TARGET_DIR)/lib/firmware/$$i)
 	cp -af $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i

 ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
