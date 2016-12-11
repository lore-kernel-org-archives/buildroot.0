From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 18:40:21 +0100
Subject: [Buildroot] [git commit] jpeg: fix typo introduced when fixing
 the indentation
In-Reply-To: <20161211173622.880F881831@busybox.osuosl.org>
References: <20161211173622.880F881831@busybox.osuosl.org>
Message-ID: <20161211174021.GC3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-12-11 18:36 +0100, Thomas Petazzoni spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=09d48dce0a75e93d560d129ca5f3883650ee63bf
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/jpeg/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
> index 2bcf405..8de45a3 100644
> --- a/package/jpeg/Config.in
> +++ b/package/jpeg/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_JPEG
>  config BR2_PACKAGE_JPEG_SIMD_SUPPORT
>         bool
>         default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON || \
> -		 BR2_POWERPC_CPU_HAS_ALTIVEC
> +		 BR2_POWERPC_CPU_HAS_ALTIVEC || \
>  		 BR2_aarch64 || BR2_aarch64_be

Alternatively, I think it is easier to read if it is written like that:

    config BR2_PACKAGE_JPEG_SIMD_SUPPORT
        bool
        default y if BR2_X86_CPU_HAS_MMX
        default y if BR2_ARM_CPU_HAS_NEON
        default y if BR2_POWERPC_CPU_HAS_ALTIVEC
        default y if BR2_aarch64 || BR2_aarch64_be

Regards,
Yann E. MORIN.

>  if BR2_PACKAGE_JPEG
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
