From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 00:54:40 +0100
Subject: [Buildroot] [git commit] package/luajit: introducing luajit
 arch supports.
In-Reply-To: <20150317170322.4A9F981829@busybox.osuosl.org>
References: <20150317170322.4A9F981829@busybox.osuosl.org>
Message-ID: <550A1040.9070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 18:03, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=4a107f43486150c255d6ca5143609c788297c6ad
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This patch introduces BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS for luajit.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/luajit/Config.in |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index c505f6a..f6995e2 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,10 +1,16 @@
> +config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386 || \
> +		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
> +		BR2_powerpc || BR2_arm || BR2_armeb || \
> +		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
> +
>  config BR2_PACKAGE_LUAJIT
>  	bool "luajit"
>  	select BR2_PACKAGE_HAS_LUAINTERPRETER
>  	# Luajit is only available for some target architectures, and
>  	# has some complexity wrt 32/64. See luajit.mk for details.

 Shouldn't the comment also have moved?

 Also, ljlinenoise and ljsyscall should probably use it.


 Regards,
 Arnout

> -	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
> -		|| ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
> +	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	# luajit.mk uses the "-m32" compiler option to build 32bit
>  	# binaries, so check if that option is supported. See
>  	# luajit.mk for details.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
