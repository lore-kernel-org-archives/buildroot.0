From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 15:09:42 +0200
Subject: [Buildroot] [PATCH v2 1/8] grub2: bump up version
In-Reply-To: <20170426213953.14904-2-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
 <20170426213953.14904-2-nunes.erico@gmail.com>
Message-ID: <20170716150942.59976e6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 23:39:46 +0200, Erico Nunes wrote:
> After many years since the last release and a long time with grub 2.02
> in beta, there is finally a release and it brings many bug fixes and
> interesting features such as support for ARM.
> 
> Patch boot/grub2/0001-remove-gets.patch doesn't seem to be required
> anymore as grub-core/gnulib/stdio.in.h has changed significantly since
> "053cfcd Import new gnulib." and has another treatment for gets.
> Patch
> boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
> was a backport which is present after the bump and therefore is also no
> longer necessary.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, I've applied, after doing a few changes, see below.

> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index 7dc5cae..eede814 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TARGET_GRUB2
>  	bool "grub2"
>  	depends on BR2_i386 || BR2_x86_64

Instead of duplicating the dependency here and in the Config.in
comment, I've added a hidden BR2_TARGET_GRUB2_ARCH_SUPPORTS

> +comment "grub2 needs a toolchain w/ wchar"
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64

And use it here. Also, I've dropped the BR2_arm || BR2_aarch64 here,
since this commit hasn't added ARM/AArch64 support yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
