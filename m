From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:37:16 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150304233716.14233828@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun,  1 Mar 2015 18:17:55 +0100, Karoly Kasza wrote:
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 0b8c912..29d93db 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>  LINUX_LICENSE = GPLv2
>  LINUX_LICENSE_FILES = COPYING
>  
> +# Compute variables as a function, so linux-headers can call it when needed
> +define BR2_LINUX_COMPUTE_VARS
> +
>  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>  ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
> @@ -40,6 +43,10 @@ LINUX_SITE := $(LINUX_SITE)/testing/
>  endif # -rc
>  endif
>  
> +endef
> +
> +$(eval $(BR2_LINUX_COMPUTE_VARS))

I know this is not going to be a very useful answer, but I must say I
don't really like this <foo>_COMPUTE_VARS solution :-/

I unfortunately don't have many solutions to offer to solve this
problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
