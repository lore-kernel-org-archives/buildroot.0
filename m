From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Aug 2013 17:04:13 +0200
Subject: [Buildroot] [git commit] arch/arm: remove OABI option
In-Reply-To: <20130714204246.7BE0D9A49D@busybox.osuosl.org>
References: <20130714204246.7BE0D9A49D@busybox.osuosl.org>
Message-ID: <5206566D.9070601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/13 22:09, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=adf9646229fc5ede51297e2dc703926e1127aa6f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> OABI is more than legacy, it's dead.
>
> New developments should go with EABI, since it so much better.
>>From the Debian EABI page [0] :
>    - floating point performance, with or without an FPU is very much faster
>    - mixing soft and hardfloat code is possible
>    - structure packing is not as painful as it used to be
>    - a more efficient syscall convention
>    - more compatibility with various tools
>
> [0] http://wiki.debian.org/ArmEabiPort
>
> [Thomas: keep the ABI choice, as we are going to introduce EABIhf later].
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>   arch/Config.in.arm |    7 -------
>   1 files changed, 0 insertions(+), 7 deletions(-)
>
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 983cac4..4daa91f 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -72,19 +72,12 @@ choice
>   	help
>   	  Application Binary Interface to use
>
> -	  Note:
> -	    Using OABI is discouraged.
> -
>   config BR2_ARM_EABI_CHOICE
>   	bool "EABI"
> -config BR2_ARM_OABI

  I think this one should have been added to Config.in.legacy. If someone 
has an old .config with OABI enabled, the conversion to EABI shouldn't be 
silent, I think...

  Regards,
  Arnout

> -	bool "OABI"
> -	depends on !BR2_GCC_VERSION_4_7_X
>   endchoice
>
>   config BR2_ARM_EABI
>   	def_bool y
> -	depends on !BR2_ARM_OABI
>
>   config BR2_ARM_ENABLE_NEON
>   	bool "Enable NEON SIMD extension support"
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
