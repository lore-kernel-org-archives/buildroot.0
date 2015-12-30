From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:48:16 +0100
Subject: [Buildroot] [PATCH 17/84 RFC] package/mono: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <878e69d3cc61ddd814ec4d45aef231e151978a15.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <878e69d3cc61ddd814ec4d45aef231e151978a15.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846D40.8070005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> This is a bit overkill, as there is only one sub-item. However, this
> commit is not about judging whether it makes sense or not to have a
> sub-menu, but to cleanup the 'config'+'menu' situation.

 NACK, like jquery.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in      | 5 -----
>  package/mono/Config.in | 8 +++++++-
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 73a3ac8..4d2b763 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -539,11 +539,6 @@ endif
>  	source "package/micropython-lib/Config.in"
>  	source "package/moarvm/Config.in"
>  	source "package/mono/Config.in"
> -if BR2_PACKAGE_MONO
> -menu "Mono libraries/modules"
> -	source "package/mono-gtksharp3/Config.in"
> -endmenu
> -endif
>  	source "package/nodejs/Config.in"
>  	source "package/perl/Config.in"
>  if BR2_PACKAGE_PERL
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index cf18a03..c00a3fa 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
>  		      BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
>  
> -config BR2_PACKAGE_MONO
> +menuconfig BR2_PACKAGE_MONO
>  	bool "mono"
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -14,6 +14,12 @@ config BR2_PACKAGE_MONO
>  
>  	  http://download.mono-project.com/sources/mono/
>  
> +if BR2_PACKAGE_MONO
> +
> +source "package/mono-gtksharp3/Config.in"
> +
> +endif
> +
>  comment "mono needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
