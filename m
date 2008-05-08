From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 8 May 2008 11:43:32 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel
	linux
In-Reply-To: <20080416224548.D5D8F3C617@busybox.net>
References: <20080416224548.D5D8F3C617@busybox.net>
Message-ID: <d6cda7730805080743v4a298223m5ed424b4ee6c80a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> @@ -153,29 +149,16 @@
>  # BZIMAGE
>  ifeq ($(LINUX26_FORMAT),bzImage)
>  LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
> -KERNEL_EXT:=
> +KERNEL_EXT:=.bz
>  endif

I have never seen any distro doing this. Why?

>  # -----------------------------------------------------------------------------
>  # File name for the Linux kernel binary
> -ifeq ($(LINUX26_FORMAT),uImage)
> -LINUX26_KERNEL_NAME:="uImage"
> -endif
> -ifeq ($(LINUX26_FORMAT),bzImage)
> -LINUX26_KERNEL_NAME:="bzImage"
> -endif
> -ifeq ($(LINUX26_FORMAT),vmlinux)
> -LINUX26_KERNEL_NAME:="vmlinux"
> -endif
> -ifeq ($(LINUX26_FORMAT),zImage)
> -LINUX26_KERNEL_NAME:="zImage"
> -endif
> -ifeq ($(LINUX26_FORMAT),custom)
>  LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
> -endif

Why on Earth did you remove John's changes from May 6?
