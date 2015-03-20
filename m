From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:43:06 +0100
Subject: [Buildroot] [PATCH 3/3] ljsyscall: refactor with
 BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
In-Reply-To: <1426622689-31844-3-git-send-email-francois.perrad@gadz.org>
References: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
 <1426622689-31844-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150320234306.76d71c18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue, 17 Mar 2015 21:04:49 +0100, Francois Perrad wrote:

> diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
> index dcbd521..b9ff04d 100644
> --- a/package/ljsyscall/Config.in
> +++ b/package/ljsyscall/Config.in
> @@ -3,12 +3,12 @@ config BR2_PACKAGE_LJSYSCALL
>  	# ljsyscall is specifically for LuaJIT, not Lua.
>  	depends on BR2_PACKAGE_LUAJIT
>  	# ljsyscall is only available for some target architectures
> -	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
> +	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

Since you say yourself in the discussion that the set of architectures
supported by ljsyscall is the same as the set of architectures
supported by LuaJIT, then this 'depends on
BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS' is not needed, because this package
already 'depends on BR2_PACKAGE_LUAJIT'.

So if BR2_PACKAGE_LUAJIT has been enabled,
BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS must be true. So adding this
dependency does not make sense.

Can you rework the ljlinenoise and ljsyscall patches to remove this
architecture dependency?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
