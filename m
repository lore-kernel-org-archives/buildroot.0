From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 00:27:40 +0100
Subject: [Buildroot] [PATCH] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <1394039187-24328-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1394039187-24328-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5317B2EC.4010201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 18:06, Vicente Olivert Riera wrote:
> Building o32 ELF files for MIPS64 is an exotic configuration that nobody
> should be using. If o32 is required, then is better if it's built for
> MIPS 32-bit cores so only 32-bit instructions will be used leading to a
> more efficient o32 usage.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index d9c0c02..e2b1e60 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -47,6 +47,7 @@ choice
>  
>  config BR2_MIPS_OABI32
>  	bool "o32"
> +	depends on !BR2_ARCH_IS_64
>  config BR2_MIPS_NABI32
>  	bool "n32"
>  	depends on BR2_ARCH_IS_64
> 

 Then maybe it's better to make the choice depend on BR2_ARCH_IS_64, and
make the OABI32 symbol blind and default y on !BR2_ARCH_IS_64.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
