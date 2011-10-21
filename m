From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 08:53:47 +0200
Subject: [Buildroot] [PATCH 2/4] ocf: new package
In-Reply-To: <1319132933-13938-2-git-send-email-gustavo@zacarias.com.ar>
References: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
 <1319132933-13938-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111021085347.6e48f74c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 20 Oct 2011 14:48:51 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +config BR2_PACKAGE_OCF
> +	bool "ocf"
> +	help
> +	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
> +	  Framework (OCF). This port aims to bring full asynchronous HW/SW
> +	  crypto acceleration to the Linux kernel and applications
> +	  running under Linux.
> +	  
> +	  http://ocf-linux.sourceforge.net/

Maybe mention here that there is a kernel-side part that must be
enabled for this to work, and that it can be enabled with
BR2_LINUX_KERNEL_EXT_OCF ?

> +define OCF_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
> +		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +define OCF_UNINSTALL_STAGING_CMDS
> +	rm -f $(STAGING_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +define OCF_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
> +		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +define OCF_UNINSTALL_TARGET_CMDS
> +	rm -f $(TARGET_DIR)/usr/include/crypto/cryptodev.h
> +endef

So basically, it's just a header that needs to be installed?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
