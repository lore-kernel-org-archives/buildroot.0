From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 May 2012 09:36:15 +0200
Subject: [Buildroot] [PATCH v5 2/2] u-boot: build signed image for OMAP
 processors
In-Reply-To: <1336422724-7384-3-git-send-email-luca@lucaceresoli.net>
References: <1336422724-7384-1-git-send-email-luca@lucaceresoli.net>
 <1336422724-7384-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20120508093615.502fae88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon,  7 May 2012 22:32:04 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> +UBOOT_BIN_IFT      = ${UBOOT_BIN}.ift

This should be $(UBOOT_BIN).ift (i.e parenthesis instead of curly
braces).

> +define UBOOT_BUILD_OMAP_IFT
> +	${HOST_DIR}/usr/bin/gpsign -f $(@D)/u-boot.bin \

Ditto.

It of course works with {}, but we use () everywhere in BR, so let's
keep it consistent.

I guess Peter can fix those minor comments when committing.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
