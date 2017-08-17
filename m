From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Aug 2017 00:20:50 +0200
Subject: [Buildroot] [PATCH] toolchain/internal: not aailable for a few
 mips cores
In-Reply-To: <20170817202647.26738-1-yann.morin.1998@free.fr>
References: <20170817202647.26738-1-yann.morin.1998@free.fr>
Message-ID: <ba40526d-508b-c2bb-64da-8f926429e8a0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-08-17 22:26, Yann E. MORIN wrote:
> Commit 1b974425 (MIPS: add support for M6201 cores) xplained that the
> new core was not supported by upstream gcc, and as of gcc-8-trunk that's
> stil lthe case.
> 
> Ditto for 3cfbeb83 (MIPS: add support for P6600 cores).
> 
> This means that we currently elect to build an internal tolchain for
> those cores, yet we have no suitable gcc version.
> 
> Disable the internal backend in this case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/Config.in.host | 7 +------
>  toolchain/Config.in        | 2 ++
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 485755a15d..77ea8ff374 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -50,8 +50,7 @@ config BR2_GCC_VERSION_5_X
>  	# musl ppc64 unsupported
>  	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
>  	# Unsupported MIPS cores
> -	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
> -		!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
> +	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && !BR2_mips_i6400

 I wouldn't remove the conditions here. If these cores are supported in GCC 8,
then we would have to re-introduce them...

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
