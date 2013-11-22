From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Fri, 22 Nov 2013 11:10:47 +0000
Subject: [Buildroot] [PATCH v3] tinymembench: package not supported on
 MIPS64
In-Reply-To: <1385117836-26855-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385117836-26855-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <528F3BB7.1030408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2013 10:57 AM, Vicente Olivert Riera wrote:
> Fixes:
>
>     http://autobuild.buildroot.net/results/bab/bab68bcf8714f215ac0b0c2546fa06608377fbb0/
>
> This package is only supported on MIPS32 platforms. The mips-32.S file included
> in the source code of this package only makes sense to be compiled for MIPS32,
> and also contains hardcoded MIPS32 instructions which are illegal on MIPS64.
> Trying to compile this package on a MIPS64 platform will end with a linkage
> failure due to undefined references.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>   package/tinymembench/Config.in |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
> index 0d45532..0555b19 100644
> --- a/package/tinymembench/Config.in
> +++ b/package/tinymembench/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_TINYMEMBENCH
>   	bool "tinymembench"
> +	depends on !BR2_mips64 && !BR2_mips64el
>   	help
>   	  Tinymembench is a simple memory benchmark program, which
>   	  tries to measure the peak bandwidth of sequential memory
>

I guess you could move the 'Fixes $URL' part just above your 
Signed-off-by line. But in any case, it looks good to me. Thanks

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
