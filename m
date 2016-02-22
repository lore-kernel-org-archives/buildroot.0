From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 13:19:01 +0100
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
In-Reply-To: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160222131901.3baa956e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Cc'ing Yann.

On Mon, 22 Feb 2016 08:40:44 -0300, Gustavo Zacarias wrote:

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e20255..dc1c79e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>  LINUX_LICENSE = GPLv2
>  LINUX_LICENSE_FILES = COPYING
>  
> +# Used when BR2_KERNEL_HEADERS_AS_KERNEL=y
> +LINUX_ADD_TOOLCHAIN_DEPENDENCY = NO

This is annoying, because we *do* need the toolchain dependency to
build the Linux kernel. I think we would rather need to do:

LINUX_HEADERS_PATCH_DEPENDENCIES = linux-patch

Though I'm not sure how great it is to have a non-package listed in the
<pkg>_DEPENDENCIES variable. Surely it might break graph-depends and
other similar tooling.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
