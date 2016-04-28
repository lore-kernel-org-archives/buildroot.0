From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 21:57:33 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <572246AE.9070804@synopsys.com>
References: <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
 <20160427133149.330a7ea0@free-electrons.com>
 <5720A627.6000109@synopsys.com>
 <20160427120454.GN28464@e106497-lin.cambridge.arm.com>
 <20160427143915.4c66a19d@free-electrons.com>
 <20160427124632.GO28464@e106497-lin.cambridge.arm.com>
 <20160427145339.36ff162b@free-electrons.com>
 <5720C9FE.9000507@synopsys.com>
 <20160427163122.0002b7ef@free-electrons.com>
 <20160427144110.GR28464@e106497-lin.cambridge.arm.com>
 <572246AE.9070804@synopsys.com>
Message-ID: <20160428215733.378ce9ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Apr 2016 18:21:50 +0100, Joao Pinto wrote:

> # Automatically find the U-Boot binary
> ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME), )

use qstrip, otherwise this will never be true. Also, remove the space
after the comma.

> ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/"u-boot.bin"

Remove the quotes.

> else
> ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME)

Use qstrip here as well.

Are you sure it's either u-boot.bin or a custom name? There are plenty
of other possible image names in uboot.mk (but quite certainly not all
of them apply to ARM64).

> In terms of the SCP_FW, I think for now is more reliable to make the final stage
> manually if using a Juno board. From my experience stuff in Linaro repositories
> change frequently and so we have a good probability of breaking the binary download.
> I suggest to put a note in the readme.txt saying what should be done, since
> everyone using a Juno will have access to the SCP FW in the board.
> 
> What do you think?

Sounds OK. Having everything built automatically is better, but as a
first step, it's definitely OK as long as there are explanations in
readme.txt.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
