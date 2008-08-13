From: hartleys <hartleys@visionengravers.com>
Date: Wed, 13 Aug 2008 17:05:31 -0400
Subject: [Buildroot] Package ace_of_penguins sets unneeded variable
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190966BE6A@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

The ace_of_penguins package sets:

ACE_OF_PENGUINS_CONF_OPT = --target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME) \
		--prefix=/usr --sysconfdir=/etc

This appears to be unnecessary since Makefile.autotools.in sets those
automatically:

	cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	$($(PKG)_CONF_ENV) \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		$(if $(findstring s,$(MAKEFLAGS)),--quiet,)
		$($(PKG)_CONF_OPT)

Hartley
