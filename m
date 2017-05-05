From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 May 2017 23:10:37 +0200
Subject: [Buildroot] [PATCH 3/3] core: add "cmake3" to the list of cmake
 candidates
In-Reply-To: <1494016231-50639-4-git-send-email-casantos@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
 <1494016231-50639-4-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170505211037.GC3001@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-05 17:30 -0300, Carlos Santos spake thusly:
> This is useful on CentOS 7, whose "cmake" utility corresponds to version
> 2.8.12, which is too old for Buildroot.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  support/dependencies/check-host-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 42aaee4..f2eef8b 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -10,7 +10,7 @@
>  #
>  BR2_CMAKE_VERSION_MIN = 3.1
>  
> -BR2_CMAKE_CANDIDATES ?= cmake
> +BR2_CMAKE_CANDIDATES ?= cmake cmake3

I'm fine with adding this. Except for the variable name, that is. ;-)

Regards,
Yann E. MORIN.

>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
>  	$(BR2_CMAKE_CANDIDATES) $(BR2_CMAKE_VERSION_MIN))
>  ifeq ($(BR2_CMAKE),)
> -- 
> 1.8.3.1
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
