From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Dec 2010 11:49:29 +0100
Subject: [Buildroot] [PATCH 07/13] toolchain: move sysroot to host dir
In-Reply-To: <1292353569-30172-8-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
	<1292353569-30172-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20101216114929.0558f286@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 14 Dec 2010 16:06:03 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> diff --git a/Makefile b/Makefile
> index f6ab07e..d7d6f8d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -268,8 +268,6 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>  
>  GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
>  
> -STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
> -
>  # packages compiled for the host goes here
>  HOST_DIR:=$(BASE_DIR)/host
>  
> @@ -294,6 +292,8 @@ endif
>  include toolchain/Makefile.in
>  include package/Makefile.in
>  
> +STAGING_DIR:=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot

This change breaks the ccache support, because when
--sysroot=$(STAGING_DIR) is used, STAGING_DIR expands to nothing,
because the definition of STAGING_DIR has been moved *after* the
inclusion of package/Makefile.in. Any reason why you moved the
definition ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
