From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Feb 2013 23:34:33 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh : applying xz compressed
 patches
In-Reply-To: <1360770393-2864-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1360770393-2864-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <511C14F9.2050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 16:46, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)


  Regards,
  Arnout

> ---
>   support/scripts/apply-patches.sh |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 7a6c1fa..7d5856c 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -23,8 +23,8 @@
>   # files than series file and archives are considered as a patch.
>   #
>   # Once a patch is found, the script will try to apply it. If its name doesn't
> -# end with '.gz', '.bz', '.bz2', '.zip', '.Z', '.diff*' or '.patch*', it will
> -# be skipped. If necessary, the patch will be uncompressed before being
> +# end with '.gz', '.bz', '.bz2', '.xz', '.zip', '.Z', '.diff*' or '.patch*',
> +# it will be skipped. If necessary, the patch will be uncompressed before being
>   # applied. The list of the patches applied is stored in '.applied_patches_list'
>   # file in the build directory.
>
> @@ -59,6 +59,8 @@ function apply_patch {
>   	type="bzip"; uncomp="bunzip -dc"; ;;
>   	*.bz2)
>   	type="bzip2"; uncomp="bunzip2 -dc"; ;;
> +	*.xz)
> +	type="xz"; uncomp="unxz -dc"; ;;
>   	*.zip)
>   	type="zip"; uncomp="unzip -d"; ;;
>   	*.Z)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
