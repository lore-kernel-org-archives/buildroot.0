From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:34:15 +0200
Subject: [Buildroot] [PATCH 1/1] odhcploc: new package
In-Reply-To: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20140817213415.5ea4809a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sat,  9 Aug 2014 20:06:57 +0200, Floris Bos wrote:
> Adds odhcploc, a network utility to scan for (rogue) DHCP servers.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Thanks, I've applied the patch to the next branch, after doing a few
changes, see below.

> +ODHCPLOC_VERSION = 20111021
> +ODHCPLOC_SOURCE = odhcploc-$(ODHCPLOC_VERSION).tar.gz

Line removed, after the suggestion from Thomas DS.

> +ODHCPLOC_SITE = http://downloads.sourceforge.net/project/odhcploc/$(ODHCPLOC_VERSION)
> +ODHCPLOC_LICENSE = ISC
> +ODHCPLOC_LICENSE_FILES = COPYING
> +
> +define ODHCPLOC_BUILD_CMDS
> +     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

Used tab for indentation instead of spaces, and replaced CC=.. LD=.. by
$(TARGET_CONFIGURE_OPTS).

> +define ODHCPLOC_INSTALL_TARGET_CMDS
> +     $(INSTALL) -D -m 0755 $(@D)/odhcploc $(TARGET_DIR)/usr/bin/odhcploc

Used 'make install' instead of manually doing the installation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
