From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 23:36:38 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery ARM:
 support only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5675DBF6.2090308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-12-15 19:14, Romain Naour wrote:
> See the conclusion about external toolchains during the Buildroot
> meeting [1]:
> "In the future, we stick to a single external toolchain version. The
> Kconfig symbol should not encode the version (avoid legacy handling)"
> 
> [1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  toolchain/toolchain-external/Config.in             | 65 +---------------------
>  .../toolchain-external/toolchain-external.hash     |  2 -
>  toolchain/toolchain-external/toolchain-external.mk |  8 +--

 One remark here (which applies to the whole series): it lacks legacy handling.
I would propose to let all of the removed symbols select
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM.

 Otherwise, looks good to me.

 Regards,
 Arnout

>  3 files changed, 3 insertions(+), 72 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 656e012..a8f19aa 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -101,7 +101,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>  	  generated is Thumb 2, with the hard floating point calling
>  	  convention, and uses the VFPv3-D16 FPU instructions.
>  
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	bool "Sourcery CodeBench ARM 2014.05"
>  	depends on BR2_arm
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
