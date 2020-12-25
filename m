From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 16:32:32 +0100
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version
 min to 3.15
In-Reply-To: <20201015054600.90183-1-fontaine.fabrice@gmail.com>
References: <20201015054600.90183-1-fontaine.fabrice@gmail.com>
Message-ID: <20201225153232.GN3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-15 07:46 +0200, Fabrice Fontaine spake thusly:
> quazip requires cmake 3.15 since version 1.0 and
> https://github.com/stachenov/quazip/commit/89e7c201f0215032d347eef6fc0c671a1845738b
> https://github.com/stachenov/quazip/commit/818adc82246cefffa2e8851534016cf1db349da7
> 
> The rationale for this requirement is that "default locations for the
> install(TARGETS command based on the GNUInstallDirs package were only
> added in 3.14" and "3.15 is not that much of a difference from 3.14 and
> it introduced a lot of useful UI improvements.":
> https://github.com/stachenov/quazip/issues/82
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5d848a46109aef448ea1d1b857a500d9461dc2d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was not too keen on applying this bump, because that is going to
increas the build quite quite a bit on older distros...

However, there is not much we can do against upstream's will.
Furthermore, we can only count on more packages requiring a newer cmake
version as tiem passes, so bumping the requirement is inevitable.
I've added a note to that effect in the commit log, and applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/check-host-cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 01f38da376..e1bbcd62c8 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,9 +1,9 @@
> -# Set this to either 3.10 or higher, depending on the highest minimum
> +# Set this to either 3.15 or higher, depending on the highest minimum
>  # version required by any of the packages bundled in Buildroot. If a
>  # package is bumped or a new one added, and it requires a higher
>  # version, our cmake infra will catch it and build its own.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.10
> +BR2_CMAKE_VERSION_MIN = 3.15
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
