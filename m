From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:09:53 +0200
Subject: [Buildroot] [PATCH 2/2] ne10: Add aarch64 configuration option
In-Reply-To: <1493418486-109149-2-git-send-email-g4@novadsp.com>
References: <1493418486-109149-1-git-send-email-g4@novadsp.com>
 <1493418486-109149-2-git-send-email-g4@novadsp.com>
Message-ID: <20170429140953.0b7badef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Apr 2017 23:28:06 +0100, J Evans wrote:

> +ifeq ($(BR2_aarch64),y)
> +NE10_CONF_OPTS += \
> +    -DNE10_LINUX_TARGET_ARCH=aarch64
> +endif

PATCH 1/2 is already enabling ne10 on AArch64, so there's something
wrong going on here. This change should go with the patch enabling ne10
on AArch64.

But I believe you should in fact rework your patches:

 - One patch that just bumps ne10, keeping only the ARM support

 - One patch that refactors the architecture dependency with a
   Config.in hidden boolean BR2_PACKAGE_NE10_ARCH_SUPPORTS

 - One patch that allows to use ne10 on AArch64

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
