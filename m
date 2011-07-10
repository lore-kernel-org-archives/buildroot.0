From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 15:27:12 +0200
Subject: [Buildroot] [PATCH 13/28] syslinux: convert to GENTARGETS
In-Reply-To: <ff407c5d7821b472c7deaf825d7e960bfbb80db0.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:04 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <ff407c5d7821b472c7deaf825d7e960bfbb80db0.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877h7qz2of.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Moreover, the installation of pxelinux and/or isolinux is now selected
 Thomas> to suboptions, as we traditionally do for other packages. This allows
 Thomas> to have a single option (BR2_TARGET_SYSLINUX) that enables the
 Thomas> syslinux package.

Committed with minor tweaks, thanks.
 
 Thomas> -$(BINARIES_DIR)/isolinux.bin: $(SYSLINUX_DIR)/.compiled
 Thomas> -	cp -a $(SYSLINUX_DIR)/core/isolinux.bin $@
 Thomas> +define SYSLINUX_INSTALL_IMAGES_CMDS
 Thomas> +	for i in $(SYSLINUX_IMAGES-y); do \
 Thomas> +		$(INSTALL) -D -m 0755 $(@D)/core/$$i $(BINARIES_DIR)/`basename $$i`; \

basename seems unneeded.

-- 
Bye, Peter Korsgaard
