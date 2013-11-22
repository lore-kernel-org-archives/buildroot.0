From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Nov 2013 11:01:31 +0100
Subject: [Buildroot] [PATCH v2] tinymembench: prevent the selection of
 this package on
In-Reply-To: <1385113396-56559-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385113396-56559-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAAXf6LVOe-epUbRxXjw3mbqwbU_AGBdF6s_CiT3tnv9tz85JhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Fri, Nov 22, 2013 at 10:43 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Fixes:
>
>    http://autobuild.buildroot.net/results/bab/bab68bcf8714f215ac0b0c2546fa06608377fbb0/
>
> This package is only supported on MIPS32 platforms. The mips-32.S file included
> in the source code of this package only makes sense to be compiled for MIPS32,
> and also contains hardcoded MIPS32 instructions which are illegal on MIPS64.
> Trying to compile this package on a MIPS64 platform will end with a linkage
> failure due to undefined references.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/tinymembench/Config.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
> index 0d45532..0555b19 100644
> --- a/package/tinymembench/Config.in
> +++ b/package/tinymembench/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_TINYMEMBENCH
>         bool "tinymembench"
> +       depends on !BR2_mips64 && !BR2_mips64el
>         help
>           Tinymembench is a simple memory benchmark program, which
>           tries to measure the peak bandwidth of sequential memory
> --

Seems the patch title is not complete (or was wrapped)... Is it
possible to fix that?

Thanks,
Thomas
