From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:57:27 +0200
Subject: [Buildroot] [PATCH] tunctl: new package
In-Reply-To: <1469283530-24618-1-git-send-email-sergio.prado@e-labworks.com>
References: <1469283530-24618-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160723225727.7d8cfe80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 11:18:50 -0300, Sergio Prado wrote:

> +TUNCTL_VERSION = 1.5
> +TUNCTL_SOURCE = tunctl-$(TUNCTL_VERSION).tar.gz
> +TUNCTL_SITE = http://downloads.sourceforge.net/project/tunctl/tunctl/$(TUNCTL_VERSION)
> +
> +TUNCTL_LICENSE = GPLv2
> +TUNCTL_LICENSE_FILES = tunctl.c
> +
> +define TUNCTL_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) tunctl

Using $(TARGET_CONFIGURE_OPTS) is preferred over manually passing CC
and LD, so I've changed this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
