From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:14:56 +0100
Subject: [Buildroot] [PATCH for-next 1/3] package/linux-syscall-support:
 new package
In-Reply-To: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161217161456.7b333157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 17:16:38 +0100, Romain Naour wrote:

> +define LINUX_SYSCALL_SUPPORT_HOST_INSTALL
> +	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
> +		$(HOST_DIR)/usr/include/linux_syscall_support.h
> +endef
> +HOST_LINUX_SYSCALL_SUPPORT_POST_INSTALL_HOOKS += LINUX_SYSCALL_SUPPORT_HOST_INSTALL
> +
> +define LINUX_SYSCALL_SUPPORT_STAGING_INSTALL
> +	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
> +		$(STAGING_DIR)/usr/include/linux_syscall_support.h
> +endef
> +LINUX_SYSCALL_SUPPORT_POST_INSTALL_STAGING_HOOKS += LINUX_SYSCALL_SUPPORT_STAGING_INSTALL

There was no reason to use post-install hooks here. Instead,
implementing directly LINUX_SYSCALL_SUPPORT_INSTALL_STAGING_CMDS and
HOST_LINUX_SYSCALL_SUPPORT_INSTALL_CMDS makes a lot more sense, since
it's a generic-package.

I've applied after fixing this, and adding a follow-up commit adding
you to the DEVELOPERS flie for this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
