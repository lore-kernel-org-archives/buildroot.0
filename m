From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 21:51:10 +0200
Subject: [Buildroot] [PATCH 09/12] pkg-infra: don't use DL_DIR as
 scratchpad for temporary downloads
In-Reply-To: <6de658f7751ced3969fb11871c77f98fe9cdc097.1401644349.git.yann.morin.1998@free.fr>
References: <cover.1401644349.git.yann.morin.1998@free.fr>
 <6de658f7751ced3969fb11871c77f98fe9cdc097.1401644349.git.yann.morin.1998@free.fr>
Message-ID: <20140601195110.GM3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-06-01 19:40 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> diff --git a/support/download/bzr b/support/download/bzr
> index 68121f4..4be36a0 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -9,11 +9,29 @@ set -e
>  #   $2: bzr revision
>  #   $3: output file
>  # And this environment:
> -#   BZR       : the bzr command to call
> -#   BR2_DL_DIR: path to Buildroot's download dir
> +#   BZR      : the bzr command to call
> +#   BUILD_DIR: path to Buildroot's build dir
>  
>  repo="${1}"
>  rev="${2}"
>  output="${3}"
>  
> -${BZR} export "${output}" "${repo}" -r "${rev}"
> +tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> +
> +# Remove leftovers from a previous failed run
> +rm -rf "${BUILD_DIR}/.foo.tmp"

As noticed by Thomas on IRC: leftovers from a previous attempt.
Fixed locally, waiting for more review before re-spinning.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
