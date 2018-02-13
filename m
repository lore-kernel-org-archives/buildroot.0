From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 16:51:47 +0100
Subject: [Buildroot] Custom package using buildroot-linux-uclibc-g++
In-Reply-To: <08c05d6899a793abe8e5b0bb14d84033@email.freenet.de>
References: <08c05d6899a793abe8e5b0bb14d84033@email.freenet.de>
Message-ID: <20180213165147.4e6d97e6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc. I've re-added it.

On Tue, 13 Feb 2018 16:32:50 +0100, earthquake.de at freenet.de wrote:
> Hello,
>  thanks for your help.
>  With CXX the link works! I use my own makefile and call CXX.
> 
>  mk-file:
>  CUSTOM_LIB_VERSION = 1.4.3
>  CUSTOM_LIB_SITE = $(BR2_EXTERNAL_CUSTOM_PATH)/package/custom_lib
>  CUSTOM_LIB_SITE_METHOD = local
>  CUSTOM_LIB_STAGING = YES

This should be:

 CUSTOM_LIB_INSTALL_STAGING = YES

>  define CUSTOM_LIB_BUILD_CMDS
>      $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile-custom_lib all
>      $(INSTALL) -D -m 0755 $(@D)/libcustom.so* $(STAGING_DIR)/usr/lib/
>  endef
> 
>  A further issue is that the CUSTOM_LIB_INSTALL_STAGING_CMDS will not be  called so i do the staging action in the build action (you see above) .

Which will solve this problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
