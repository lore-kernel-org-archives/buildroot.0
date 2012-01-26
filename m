From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 17:13:25 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 26 Jan 2012 16:13:22
 +0100")
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87bopq30ii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> +define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 yegorslists> +	mkdir -p $(TARGET_DIR)/lib/firmware
 yegorslists> +	for i in $(LINUX_FIRMWARE_FILES_y); do \
 yegorslists> +		cp -af $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i; \
 yegorslists> +	done

That won't work as cp doesn't create the destination directories -
install -D is also not really good as that doesn't handle symlinks, so I
think the best approach is to use tar.

I'll fix that up while committing.

-- 
Bye, Peter Korsgaard
