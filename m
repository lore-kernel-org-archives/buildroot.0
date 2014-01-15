From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 15:02:21 +0100
Subject: [Buildroot] [PATCH 1/1] mmc-utils: new package
In-Reply-To: <1389790554-24337-1-git-send-email-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Wed, 15 Jan 2014
 13:55:54 +0100")
References: <1389790554-24337-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <87eh49uyvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > mmc-utils provides tools to manipulate mmc device registers.
 > It is under "Hardware handling".

I know it could go in both sections, but we have E.G. flashbench under
filesystem and flash utilities, so I put it there instead.

 > +################################################################################
 > +#
 > +# mmc-utils
 > +#
 > +################################################################################
 > +
 > +MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
 > +MMC_UTILS_SITE    = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 > +MMC_UTILS_LICENSE = GPLv2
 > +
 > +define MMC_UTILS_BUILD_CMDS
 > +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 > +endef
 > +
 > +define MMC_UTILS_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
 > +endef
 > +
 > +define MMC_UTILS_UNINSTALL_TARGET_CMDS
 > +	$(RM) $(TARGET_DIR)/usr/bin/mmc
 > +endef

We have deprecated uninstall commands, so this can go. Other than that
it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
