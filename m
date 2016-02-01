From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:39:03 +0100
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.2
In-Reply-To: <1454154357-31625-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-2-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201213903.04cdc5be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:48 +0100, Gary Bisson wrote:

> The package adds the EPDC waveforms and the needed changes to properly
> install those were done in the firmware-imx.inc file.

I guess you wanted to say firmware-imx.mk. Maybe you've done too much
Yocto :-)


>  define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> -	mkdir -p $(TARGET_DIR)/lib/firmware
> +	mkdir -p $(TARGET_DIR)/lib/firmware/imx
>  	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
>  		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
>  	done
> +	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx; \

The ; \ is not needed.

> +	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
> +	   $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw;

The final is not needed.

Also, this rename is a bit weird, maybe a comment would have been good.

I've fixed the typos and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
