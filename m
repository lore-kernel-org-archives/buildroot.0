From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Oct 2012 00:04:31 +0200
Subject: [Buildroot] [PATCH 05/47] package/usbredir: new package
In-Reply-To: <1351113973-17237-6-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-6-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5089B76F.8070003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/12 23:25, Yann E. MORIN wrote:
[snip]
> +USBREDIR_VERSION         = 0.4.3
> +USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
> +USBREDIR_SITE            =http://spice-space.org/download/usbredir
> +USBREDIR_LICENSE         = LGPLv2.1+
> +USBREDIR_LICENSE_FILES   = COPYING.LIB
> +USBREDIR_INSTALL_STAGING = YES
> +USBREDIR_DEPENDENCIES    = libusb
> +
> +USBREDIR_DEPENDENCIES    += host-pkg-config
> +
> +ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> +
> +USBREDIR_LICENSE         += GPLv2+
> +USBREDIR_LICENSE_FILES   += COPYING

  Nice!

> +
> +else # BR2_PACKAGE_USBREDIR_SERVER != y
> +
> +# It's much easier to remove unwanted files after-the-fact, rather than trying
> +# to install only what we want. Sad-and-dull life, but life nonetheless...
> +# Note: do not forget to update the license, above, if you keep the server.

  It's not the first time this is done in buildroot, so: comment is redundant.


  Regards,
  Arnout

> +define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> +	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
> +endef
> +USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> +
> +endif # BR2_PACKAGE_USBREDIR_SERVER
> +
> +$(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
