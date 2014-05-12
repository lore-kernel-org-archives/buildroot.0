From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 23:12:16 +0200
Subject: [Buildroot] Discussing libudev,
	was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
References: <pil74bx9op.ln2@ID-313208.user.individual.net>
 <20140512230238.76c7fb6b@free-electrons.com>
Message-ID: <g2q74bxv7r.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140512230238.76c7fb6b at free-electrons.com: 

> What would be the upstream source for this libudev package?

Hi,

I copied the systemd package and build only the libudev part, short snippets 
from my hacky package:

LIBUDEV_VERSION = 212
LIBUDEV_SITE = http://www.freedesktop.org/software/systemd/
LIBUDEV_SOURCE = systemd-$(LIBUDEV_VERSION).tar.xz
[...]
define LIBUDEV_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
                src/libudev/libudev.pc \
                src/shared/errno-from-name.h \
                src/shared/errno-to-name.h \
                src/shared/af-from-name.h \
                src/shared/af-to-name.h
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) libudev.la
endef

followed by some LIBUDEV_INSTALL_STAGING/TARGET_CMDS file copying.

Regards, Bernd
