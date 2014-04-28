From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 07:55:30 +0200
Subject: [Buildroot] [PATCH 1/9] boot/syslinux: needs an ia32-capable
 compiler
In-Reply-To: <74ac3236bb1595c30d9fd230352e96ef29e0b3ad.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <74ac3236bb1595c30d9fd230352e96ef29e0b3ad.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <535DED52.20500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/04/14 00:29, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>

 It would be good to mention in the commit log and/or the Config.in why
this dependency is needed.  I thought it was because it uses -m32, but
now I see that it doesn't...


 Regards,
 Arnout

> ---
>  boot/syslinux/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> index 2c39e65..5b1122d 100644
> --- a/boot/syslinux/Config.in
> +++ b/boot/syslinux/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TARGET_SYSLINUX
>  	bool "syslinux"
>  	depends on BR2_i386 || BR2_x86_64
> +	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
>  	help
>  	  The syslinux bootloader for x86 systems.
>  	  This includes: syslinux, pxelinux, extlinux.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
