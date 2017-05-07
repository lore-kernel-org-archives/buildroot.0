From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 May 2017 11:40:34 +0200
Subject: [Buildroot] [PATCH v2 1/4] core: reverse the argument order in
 check-host-cmake
In-Reply-To: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170507094034.GA2949@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-07 01:32 -0300, Carlos Santos spake thusly:
> Pass the minimal version before the program name. In a later change the
> script will become able to test a list of candidates.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/check-host-cmake.mk | 2 +-
>  support/dependencies/check-host-cmake.sh | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 8002278..914327f 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -12,7 +12,7 @@ BR2_CMAKE_VERSION_MIN = 3.1
>  
>  BR2_CMAKE ?= cmake
>  ifeq ($(call suitable-host-package,cmake,\
> -	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
> +	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE)),)
>  BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
>  BR2_CMAKE_HOST_DEPENDENCY = host-cmake
>  endif
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index 9b63b06..73bd4ed 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  
> -candidate="${1}"
> -version_min="${2}"
> +version_min="${1}"
> +candidate="${2}"
>  
>  major_min="${version_min%.*}"
>  minor_min="${version_min#*.}"
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
