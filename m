From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:08:41 +0200
Subject: [Buildroot] [PATCH 04/10] gitlab-ci: defconfig_check is
 included in defconfig build
In-Reply-To: <606d7c2515e5996c417bca7827b7b061fcce1634.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <606d7c2515e5996c417bca7827b7b061fcce1634.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <29732ddd-5f41-50af-b4d0-465d8baf32a1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> When we build the defconfigs, we already check they are correct, so
> there is no need to run the correctness check explicitly.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  support/scripts/generate-gitlab-ci-yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index ed56a516a7..23db376944 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -47,9 +47,10 @@ gen_defconfigs() {
>      esac
>  
>      for cfg in "${defconfigs[@]}"; do
> -        printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
>          if ${build_defconfigs}; then
>              printf '%s: { extends: .defconfig }\n' "${cfg}"
> +        else
> +            printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
>          fi
>      done
>  }
> 
