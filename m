From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Mar 2016 23:29:10 +0100
Subject: [Buildroot] [PATCH 01/16] arch/arm: introduce and use
 BR2_ARM_CPU_ARMV7M
In-Reply-To: <1458164602-16983-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9DE36.5000003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> All ARM cores should select a BR2_ARM_CPU_* option. Currently, the
> cortex-m3 does not, which this commit fixes by introducing a
> BR2_ARM_CPU_ARMV7M option.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   arch/Config.in.arm | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 04f0369..33f763a 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -52,6 +52,9 @@ config BR2_ARM_CPU_ARMV6
>   config BR2_ARM_CPU_ARMV7A
>   	bool
>
> +config BR2_ARM_CPU_ARMV7M
> +	bool
> +
>   choice
>   	prompt "Target Architecture Variant"
>   	depends on BR2_arm || BR2_armeb
> @@ -171,6 +174,7 @@ config BR2_cortex_m3
>   	bool "cortex-M3"
>   	select BR2_ARM_CPU_HAS_THUMB
>   	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7M
>   config BR2_fa526
>   	bool "fa526/626"
>   	select BR2_ARM_CPU_HAS_ARM
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
