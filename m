From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 14:35:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/perl-dbd-mysql: bump to version
 4.050
In-Reply-To: <CALURroQk+Re-mxVK_=amf0hJRKYb8U8roihZ9=LFwgZSVXXvCQ@mail.gmail.com>
References: <20200102114347.2403649-1-chrismcc@gmail.com>
 <CALURroQk+Re-mxVK_=amf0hJRKYb8U8roihZ9=LFwgZSVXXvCQ@mail.gmail.com>
Message-ID: <20200102143511.5773b287@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Jan 2020 03:55:43 -0800
Christopher McCrory <chrismcc@gmail.com> wrote:

> For MariaDB I also needed::
> 
> chrismcc at centos8-lxc git]$ cat external/packages/fixup-mariadb/
> fixup-mariadb.mk
> ################################################################################
> #
> # fixup-mariadb
> #
> ################################################################################
> 
> ifeq ($(BR2_PACKAGE_FIXUP_MARIADB),y)
> 
> define MARIADB_POST_INSTALL_STAGING_MORE
>         $(RM) -v $(STAGING_DIR)/usr/bin/mariadb_config
> endef
> 
> MARIADB_POST_INSTALL_STAGING_HOOKS += MARIADB_POST_INSTALL_STAGING_MORE

Why is it necessary to remove this file from staging? This doesn't seem
right.

> define MARIADB_POST_INSTALL_MORE
> $(RM) -r $(TARGET_DIR)/usr/data
> endef

What is this removing? Why is it important? Do we want to have this
removal in mariadb.mk in upstream Buildroot?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
