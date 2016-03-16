From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:26:38 +0100
Subject: [Buildroot] [PATCH 09/16] toolchain-buildroot: don't show musl
 on noMMU platforms
In-Reply-To: <1458164602-16983-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9EBAE.80508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> While musl has recently gained noMMU support for the sh2 platform, we
> don't support this yet. So for the time being, let's not show musl as
> an available C library on noMMU platforms. This is for example
> important on ARM noMMU: ARM is supported by musl, but not its noMMU
> variants.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   toolchain/toolchain-buildroot/Config.in | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index ea290eb..1fba06b 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -94,6 +94,9 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>   	depends on !BR2_powerpc_SPE # not supported, build breaks
>   	# Unsupported for MIPS R6
>   	depends on !BR2_mips_32r6 && !BR2_mips_64r6
> +	# sh2 nommu is supported by musl, but we don't have support
> +	# for it yet in Buildroot.

  We don't have support for sh2 at all, and also we used to have it, so I 
wouldn't use 'yet'. Better: we don't have support for sh2 in Buildroot.

  With that:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> +	depends on BR2_USE_MMU
>   	select BR2_TOOLCHAIN_USES_MUSL
>   	help
>   	  This option selects musl as the C library for the
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
