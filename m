From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Jul 2013 00:03:20 +0200
Subject: [Buildroot] [PATCH] usbutils: bump to version 007
In-Reply-To: <1373628885-12093-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 12 Jul 2013 08:34:45 -0300")
References: <1373628885-12093-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppumce3b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/usbutils/usbutils.mk | 16 +++++++++++-----
 Gustavo>  1 file changed, 11 insertions(+), 5 deletions(-)

 Gustavo> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
 Gustavo> index c56702b..d809463 100644
 Gustavo> --- a/package/usbutils/usbutils.mk
 Gustavo> +++ b/package/usbutils/usbutils.mk
 Gustavo> @@ -4,13 +4,10 @@
 Gustavo>  #
 Gustavo>  ################################################################################
 
 Gustavo> -USBUTILS_VERSION = 006
 Gustavo> -USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils/
 Gustavo> -USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
 Gustavo> +USBUTILS_VERSION = 007
 Gustavo> +USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 Gustavo>  USBUTILS_DEPENDENCIES = host-pkgconf libusb
 Gustavo>  USBUTILS_INSTALL_STAGING = YES
 Gustavo> -# no configure in tarball
 Gustavo> -USBUTILS_AUTORECONF = YES
 Gustavo>  USBUTILS_LICENSE = GPLv2+
 Gustavo>  USBUTILS_LICENSE_FILES = COPYING
 
 Gustavo> @@ -25,6 +22,15 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 Gustavo>  	USBUTILS_DEPENDENCIES += busybox
 Gustavo>  endif
 
 Gustavo> +# Nice lsusb.py script only if there's python
 Gustavo> +ifeq ($(BR2_PACKAGE_PYTHON),)
 Gustavo> +define USBUTILS_REMOVE_PYTHON
 Gustavo> +	rm -f $(TARGET_DIR)/usr/bin/lsusb.py
 Gustavo> +endef
 Gustavo> +endif
 Gustavo> +
 Gustavo> +USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_PYTHON

I would prefer to keep the assignment to _INSTALL_TARGET_HOOKS inside
the conditional, like we do elsewhere.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
