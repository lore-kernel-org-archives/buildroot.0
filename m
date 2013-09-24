From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Sep 2013 18:55:15 +0300
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <20130924172041.57ec6b88@skate>
References: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
 <20130924172041.57ec6b88@skate>
Message-ID: <20130924155515.GD4838@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 24, 2013 at 05:20:41PM +0200, Thomas Petazzoni wrote:
> On Tue, 24 Sep 2013 13:18:43 +0300, Jouko Nikula wrote:
> > +define I2C_TOOLS_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
> > +endef
> 
> This header is already part of the kernel headers, so it should already
> be part of the toolchain. Do you have a specific case where this header
> is missing?

This is a different header than the kernel one, although confusingly named 
identically. On my Debian system the libi2c-dev package provides i2c-dev.h, 
and diverts the kernel header to i2c-dev.h.kernel.

$ dpkg -S /usr/include/linux/i2c-dev.h
diversion by libi2c-dev from: /usr/include/linux/i2c-dev.h
diversion by libi2c-dev to: /usr/include/linux/i2c-dev.h.kernel
linux-libc-dev:amd64, libi2c-dev: /usr/include/linux/i2c-dev.h

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
