From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Sep 2017 22:05:03 +0200
Subject: [Buildroot] [PATCH] support/download: fix check_one_hash
	description
In-Reply-To: <20170911193232.3072-1-gael.portay@savoirfairelinux.com>
References: <20170911193232.3072-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170911200503.GB3172@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2017-09-11 15:32 -0400, Ga?l PORTAY spake thusly:
> Function check_one_hash takes three arguments:
>  - algo hash
>  - known hash
>  - file to hash
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  support/download/check-hash | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index c1ff53c02b..fe9c10570e 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -42,8 +42,9 @@ if [ ! -f "${h_file}" ]; then
>  fi
>  
>  # Check one hash for a file
> -# $1: known hash
> -# $2: file (full path)
> +# $1: algo hash
> +# $2: known hash
> +# $3: file (full path)
>  check_one_hash() {
>      _h="${1}"
>      _known="${2}"
> -- 
> 2.13.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
