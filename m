From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jun 2017 21:32:54 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <20170605073740.855-1-francois.perrad@gadz.org>
References: <20170605073740.855-1-francois.perrad@gadz.org>
Message-ID: <20170608193254.GC3058@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2017-06-05 09:37 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/br2-external               | 2 +-
>  support/scripts/check-bin-arch             | 2 +-
>  support/scripts/fix-configure-powerpc64.sh | 2 +-
>  support/scripts/genimage.sh                | 2 +-
>  support/scripts/hardlink-or-copy           | 2 +-
>  support/scripts/test-pkg                   | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 7e816081..00cb57d1 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  set -e
>  
>  # This script must be able to run with bash-3.1, so it can't use
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> index ff974a71..b822cdd6 100755
> --- a/support/scripts/check-bin-arch
> +++ b/support/scripts/check-bin-arch
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  
>  while getopts p:l:r:a: OPT ; do
>  	case "${OPT}" in
> diff --git a/support/scripts/fix-configure-powerpc64.sh b/support/scripts/fix-configure-powerpc64.sh
> index ad710422..ff2b283c 100755
> --- a/support/scripts/fix-configure-powerpc64.sh
> +++ b/support/scripts/fix-configure-powerpc64.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  
>  # This is a script to find, and correct, a problem with old versions of
>  # configure that affect powerpc64 and powerpc64le.
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> index 6c8d9e5a..625afc10 100755
> --- a/support/scripts/genimage.sh
> +++ b/support/scripts/genimage.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  
>  die() {
>    echo "Error: $@" >&2
> diff --git a/support/scripts/hardlink-or-copy b/support/scripts/hardlink-or-copy
> index b046bdf0..a052318f 100755
> --- a/support/scripts/hardlink-or-copy
> +++ b/support/scripts/hardlink-or-copy
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  
>  # Try to hardlink a file into a directory, fallback to copy on failure.
>  #
> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> index f08c6087..7633a21e 100755
> --- a/support/scripts/test-pkg
> +++ b/support/scripts/test-pkg
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>  set -e
>  
>  TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
> -- 
> 2.12.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
