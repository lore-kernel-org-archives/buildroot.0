From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:02:26 +0200
Subject: [Buildroot] [PATCH v3 04/14] check-host-rpath: no longer check
 $(HOST_DIR)/usr/{bin, sbin}
In-Reply-To: <20170704140404.4098-5-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-5-arnout@mind.be>
Message-ID: <fca6c5a5-3f29-6a58-8461-cbdbbd1dcc2d@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:03, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Since $(HOST_DIR)/usr/{bin,sbin} are now symlinks to
> $(HOST_DIR)/{bin,sbin}, it makes no sense to check them - they are
> already covered.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  support/scripts/check-host-rpath | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index adabfdf53f..2846d5eb51 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -1,6 +1,6 @@
>  #!/usr/bin/env bash
>  
> -# This script scans $(HOST_DIR)/{,usr/}{bin,sbin} for all ELF files, and checks
> +# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
>  # they have an RPATH to $(HOST_DIR)/{,usr/}lib if they need libraries from
>  # there.
>  
> @@ -26,7 +26,7 @@ main() {
>              printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
>          fi
>          printf "***   %s\n" "${file}"
> -    done < <( find "${hostdir}"/{,usr/}{bin,sbin} -type f -exec file {} + 2>/dev/null \
> +    done < <( find "${hostdir}"/{bin,sbin} -type f -exec file {} + 2>/dev/null \
>                |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
>                        -e 's//\1/'                                                  \
>              )
> 
