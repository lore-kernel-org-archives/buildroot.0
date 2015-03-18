From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 00:15:39 +0100
Subject: [Buildroot] [PATCH 3/3] support/download: always fail when
 there's no hash
In-Reply-To: <e443dfcec4c084f823c718aa4c7740eddb3b628e.1426545571.git.yann.morin.1998@free.fr>
References: <cover.1426545571.git.yann.morin.1998@free.fr>
 <e443dfcec4c084f823c718aa4c7740eddb3b628e.1426545571.git.yann.morin.1998@free.fr>
Message-ID: <550A071B.7000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/03/15 23:41, Yann E. MORIN wrote:
> At the time we introduced hashes, we did not want to be too harsh in the
> beginning, and give people some time to adapt and accept to hashes. So
> we so far only whined^Wwarned about a missing hash file.
> 
> Some time has passed now, and people are still missing updating hashes
> when bumping packages.
> 
> Let's make that warning a little bit more annoying...

 If you ever revive this series (which I think would be a good idea), don't
forget to remove the reference to BR2_ENFORCE_CHECK_HASH from the manual as well.


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/download/check-hash | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 4cc62f3..7971c38 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -88,10 +88,6 @@ while read t h f; do
>  done <"${h_file}"
>  
>  if [ ${nb_checks} -eq 0 ]; then
> -    if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
> -        printf "ERROR: No hash found for %s\n" "${base}" >&2
> -        exit 2
> -    else
> -        printf "WARNING: No hash found for %s\n" "${base}" >&2
> -    fi
> +    printf "ERROR: No hash found for %s\n" "${base}" >&2
> +    exit 2
>  fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
