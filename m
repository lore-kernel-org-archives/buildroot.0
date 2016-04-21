From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2016 22:57:21 +0200
Subject: [Buildroot] [PATCH] i386: properly define BR2_ARCH for all x86
 subarchitectures
In-Reply-To: <1461268365-13922-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1461268365-13922-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <57193EB1.5060509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/21/16 21:52, Thomas Petazzoni wrote:
> We were not defining BR2_ARCH for two of the x86 subarchitecture,
> which means the architecture part of the GNU_TARGET_NAME tuple was
> empty, leading to weird build failures.
>
> This commit fixes that by defining the appropriate values.
>
> Fixes bug #8861.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  It would be nice if we would have a way to check something like that...

  Regards,
  Arnout

> ---
>   arch/Config.in.x86 | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 4039db8..efa9567 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -226,6 +226,8 @@ config BR2_ARCH
>   	default "i686"		if BR2_x86_nocona && BR2_i386
>   	default "i686"		if BR2_x86_core2 && BR2_i386
>   	default "i686"		if BR2_x86_corei7 && BR2_i386
> +	default "i686"		if BR2_x86_corei7_avx && BR2_i386
> +	default "i686"		if BR2_x86_corei7_avx2 && BR2_i386
>   	default "i686"		if BR2_x86_atom && BR2_i386
>   	default "i686"		if BR2_x86_opteron && BR2_i386
>   	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
