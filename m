From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:16:28 +0200
Subject: [Buildroot] [PATCH 03/11] package/rpi-firmware: add option to
 install vcdbg
In-Reply-To: <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
 <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <20150629221628.30ee46a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 29 Jun 2015 00:25:12 +0200, Yann E. MORIN wrote:

> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
> +define RPI_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
> +		$(TARGET_DIR)/usr/sbin/vcdbg
> +endef
> +endif # INSTRALL_VCDBG

INSTRALL -> INSTALL

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
