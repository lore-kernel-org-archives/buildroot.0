From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 10:11:45 +0100
Subject: [Buildroot] [PATCH 10/12] linux-fusion: bump to 8.1.2
In-Reply-To: <1288839031-24277-11-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Thu, 4 Nov 2010 03:50:29 +0100")
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-11-git-send-email-llandwerlin@gmail.com>
Message-ID: <87fwvg5e3y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

 llandwerlin> +++ b/package/linux-fusion/linux-fusion.mk
 llandwerlin> @@ -3,7 +3,7 @@
 llandwerlin>  # linux-fusion
 llandwerlin>  #
 llandwerlin>  #############################################################
 llandwerlin> -LINUX_FUSION_VERSION = 8.1.1
 llandwerlin> +LINUX_FUSION_VERSION = 8.1.2
 llandwerlin>  LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 llandwerlin>  LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 llandwerlin>  LINUX_FUSION_INSTALL_STAGING = YES
 llandwerlin> @@ -22,17 +22,18 @@ LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
 llandwerlin>  LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
 
 llandwerlin>  define LINUX_FUSION_BUILD_CMDS
 llandwerlin> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
 llandwerlin> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LINUX_FUSION_MAKE_OPTS) INSTALL_MOD_PATH=$(STAGING_DIR) -C $(@D)

Why is INSTALL_MOD_PATH needed at build time?

 llandwerlin>  endef
 
 llandwerlin>  # Only the header file is needed in the staging directory
 llandwerlin>  define LINUX_FUSION_INSTALL_STAGING_CMDS
 llandwerlin> -	install -m 644 $(@D)/linux/include/linux/fusion.h $(STAGING_DIR)/usr/include/linux

That comment should presumably go now?

-- 
Bye, Peter Korsgaard
