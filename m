From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 22:48:33 +0200
Subject: [Buildroot] [PATCH 08/10] flashrom: new package
In-Reply-To: <8bd26c1a4e7bab3695187a73e812f52739765565.1338653505.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:13:58 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <8bd26c1a4e7bab3695187a73e812f52739765565.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fwa1efry.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---

 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# flashrom
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +FLASHROM_VERSION = 0.9.3
 Thomas> +FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
 Thomas> +FLASHROM_SITE    = http://download.flashrom.org/releases
 Thomas> +
 Thomas> +FLASHROM_DEPENDENCIES = pciutils
 Thomas> +
 Thomas> +define FLASHROM_BUILD_CMDS
 Thomas> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 Thomas> +endef
 Thomas> +
 Thomas> +define FLASHROM_INSTALL_TARGET_CMDS
 Thomas> +	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/bin/flashrom

I would have expected something like this doing hw access should go into
/usr/sbin, and that's also where Debian places it so I've changed that
and committed, thanks.

-- 
Bye, Peter Korsgaard
