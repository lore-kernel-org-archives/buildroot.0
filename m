From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:55:29 +0100
Subject: [Buildroot] [PATCH 6/6 v2] fs: make static device nodes
 creation more logical
In-Reply-To: <ae80646fbb9d0e7f40434b16ebe5173ee3a4654c.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <ae80646fbb9d0e7f40434b16ebe5173ee3a4654c.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <20181203215529.683151f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Nov 2018 18:33:16 +0100, Yann E. MORIN wrote:

>  	$(Q)touch $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
> -ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
> -	cat $(ROOTFS_STATIC_DEVICE_TABLES) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
> +ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
> +	cat $(ROOTFS_STATIC_DEVICE_TABLES) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
>  endif
>  endif

Ah, I thought this change was not correct. But in fact, it was correct
in your series (sorry!). It was correct because you did split the
permission table from the static device table, which was done in the
patch that Arnout didn't like.

In fact, there is a way to do the same without the split of
permission/device table. Let me propose something.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
