From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 31 May 2014 10:44:20 +0200
Subject: [Buildroot] [PATCH] toolchain-buildroot: only allow the
 selection of Musl for Microblaze BE
In-Reply-To: <1401481549-23804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401481549-23804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140531084419.GM618@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> The Musl C library only supports Microblaze BE, not Microblaze LE, so
> this commit adjusts the dependencies of the toolchain-buildroot
> package to not allow the selection of Musl on Microblaze LE.

This is not true. The reason I started to hack on microblaze stuff,
was indeed musl microblaze support for both endianess. I wanted to
test musl on every supported architecture.

See 
http://git.musl-libc.org/cgit/musl/tree/configure
Line 447-448.

I am not sure why the external musl cross toolchain does not support
it, but this is not a limitation of musl itself.

Will send a patch in a few minutes.

best regards
        Waldemar 
 
> Cc: William Welch <bvwelch@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 216f9db..840668c 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -80,7 +80,7 @@ comment "(e)glibc only available with shared lib support"
>  
>  config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  	bool "musl (experimental)"
> -	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
> +	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe || \
>  		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
>  	select BR2_TOOLCHAIN_USES_MUSL
>  	help
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
