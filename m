From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 23:05:34 +0200
Subject: [Buildroot] [PATCH 6/6 v3] support/download: restore mandatory
 check of hashes
In-Reply-To: <21c6a4cd9d79b9279ba50426a2d0baaa1bc3f0b0.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <21c6a4cd9d79b9279ba50426a2d0baaa1bc3f0b0.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <5522F51E.2080700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 14:13, Yann E. MORIN wrote:
> Now that custom external toolchains to be downloaded proprely instruct
> to not fail on a missing hash, restore the mandatory hash check for
> everything else.

 There are also a couple of uclibc versions without hash.

 Otherwise looks good :-)

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  support/download/check-hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index a091c61..96d12a5 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -104,5 +104,5 @@ if [ ${nb_checks} -eq 0 ]; then
>          exit 0
>      fi
>      printf "ERROR: No hash found for %s\n" "${base}" >&2
> -    exit 0
> +    exit 3
>  fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
