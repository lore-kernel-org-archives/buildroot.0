From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jun 2020 17:33:48 +0200
Subject: [Buildroot] [PATCH 2/2] core/br2-external: report better error
 messages
In-Reply-To: <f7b374aa76093cdf59fd788d7c8cc39b86415eb6.1590183628.git.yann.morin.1998@free.fr>
References: <cover.1590183628.git.yann.morin.1998@free.fr>
 <f7b374aa76093cdf59fd788d7c8cc39b86415eb6.1590183628.git.yann.morin.1998@free.fr>
Message-ID: <5ea0d6a7-1ad1-657e-198a-e9c0e813b98d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 22/05/2020 ? 23:40, Yann E. MORIN a ?crit?:
> The error is misleading: it reports that no name was provided,
> when in fact the external.desc file is missing.


Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>p
> ---
>  support/scripts/br2-external | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index fdea5aa251..ededd2d900 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -75,7 +75,7 @@ do_validate_one() {
>          error "'%s': permission denied\n" "${br2_ext}"
>      fi
>      if [ ! -f "${br2_ext}/external.desc" ]; then
> -        error "'%s': does not have a name (in 'external.desc'). See %s\n" \
> +        error "'%s': does not have an 'external.desc'. See %s\n" \
>              "${br2_ext}" "${MANUAL_URL}"
>      fi
>      br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
> 
